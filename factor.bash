#!/usr/bin/env bash
# factor.bash: manage as many Factor images as your hard drive can hold
# https://github.com/catb0t/factor.bash
#
# Copyright 2018 catb0t / Cat Stevens

#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.

#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.

#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <https://www.gnu.org/licenses/>.started_script=$(date +%s)

started_script=$(date +%s)

# Case insensitive string comparison
shopt -s nocaseglob
shopt -s nocasematch

set -e
# NOTE: set this in .bashrc or similar
cd "$FACTOR_FOLDER"
# argument list is saved
ARGV=( $@ )
# everything (except $0) is gone
shift $#

alias make="make -j"
{
  # has empty argument list!
  source ./build.sh

  # borrow a lot of code from the build script
  set_downloader
  set_cc
  set_make
  find_os
  find_architecture
  find_word_size
  set_factor_image
  set_factor_binary
  set_build_info
  # goodbye fds
} > /dev/null 2>&1

set -e

check_ret() { return $?; }
refresh_image() {
  ./$my_binary_name -no-user-init -i="$1" -e="USING: vocabs.loader vocabs.refresh system memory ; refresh-all save 0 exit"
}
make_boot_image() {
  ./$my_binary_name -no-user-init -i"$1" -e="\"$MAKE_IMAGE_TARGET\" USING: system bootstrap.image memory ; make-image image-path save-image 0 exit"
}

macos_notify() { osascript -e "display notification \"$$ on $branchname\" with title \"$1\"" & }
linux_notify() { notify-send -i gnome-terminal --hint int:transient:1 -u low "$1" "$$ on $branchname" & }
# NOTE: uses arguments #1=title #2=message
# shellcheck disable=2155
declare -r NOTIFY=$(case "$OS" in (macosx) echo macos_notify ;; (linux) echo linux_notify ;; (*) echo : ;; esac)
_say() { echo "[$$] on $branchname: $*" >&2 ; } # output to stderr; argument #1=message
declare -r SAY=_say
_sum() { sha224sum | cut -f1 -d' ' ; }
declare -r SUM=_sum
export SUM

declare -r SCRIPT_VERSION=0.1

TRIM_HASH_TO=12
export TRIM_HASH_TO

# shellcheck disable=2155
declare -r FACTOR_VERSION=$(make -n | grep -m1 'FACTOR_VERSION' | sed -E 's/^.*FACTOR_VERSION=\"([0-9]+\.[0-9]+)\".*$/\1/')

echo "[$$] $0 v$SCRIPT_VERSION "
echo "[$$] Factor v$FACTOR_VERSION"
echo "[$$]"

# shellcheck disable=2155
# user could `git checkout` another branch during execution but please don't do that
export branchname=$(current_git_branch)
export name_format=
export my_binary_name=
export my_image_name=
export my_boot_image_name=

# SOURCE="${BASH_SOURCE[0]}"
# while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
#   DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
#   SOURCE="$(readlink "$SOURCE")"
#   [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
# done
# DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
# # shellcheck source=hashing.bash
# source "$DIR/hashing.bash"

my_exit() {
  local -r ended_script=$(date +%s)
  local -r elapsed_time=$(($ended_script - $started_script))
  local -r min_sec=$(dc -e "$elapsed_time 60~rn[m ]Pn[s]P")
  $SAY "done! in $min_sec"
  exit
}

run_factor() {
  $SAY "./$my_binary_name" "${ARGV[@]:1}" # omitting implied argument -i=$my_image_name
  ./$my_binary_name "${ARGV[@]:1}" &
  local -r pid=$!
  disown $pid
  $SAY "PID $pid"
  $NOTIFY "started $pid"
  my_exit
}

build_factor() {
  $SAY "missing or outdated binary"
  $NOTIFY "building $FACTOR_BINARY"
  $SAY "making $my_binary_name"
  make_clean_factor
  command mv "$FACTOR_BINARY" "$my_binary_name"
  $SAY "done"
}

build_image() {
  $SAY "missing or outdated image"
  $NOTIFY "building $MAKE_IMAGE_TARGET"
  # (git branch -r | grep upstream | grep "$branchname" || true)

  $SAY "making $my_image_name"
  # code allows error exit codes
  # NOTE: just download a boot image
  set +e
  {
    stat "$BOOT_IMAGE" ||
    (stat "$my_boot_image_name" && mv "$my_boot_image_name" "$BOOT_IMAGE") ||
    update_boot_image ||
    update_boot_images || # old versions of build.sh
    get_url "http://downloads.factorcode.org/images/master/$BOOT_IMAGE"
  } >/dev/null 2>&1

  $NOTIFY "image pass #1"
  $SAY "image pass #1"
  # NOTE: STEP 1: run from boot image
  ./$my_binary_name -no-user-init "-i=$BOOT_IMAGE" # > /dev/null 2>&1 &
  # spinner $!

  # NOTE: STEP 2: `refresh-all` from newly compiled image
  refresh_image $my_image_name
  image_fails_refresh=$?
  local i=2

  # NOTE: STEP 3: re-bootstrap and refresh until it doesn't break
  while [[ $image_fails_refresh -gt 0 ]]
  do
    $SAY "refresh #$i failed! bootstrapping again..."
    $NOTIFY "image pass #$i"

    make_boot_image $my_image_name
    ./$my_binary_name -no-user-init "-i=$BOOT_IMAGE"

    refresh_image $my_image_name

    image_fails_refresh=$?
    i=$((i+1)) # avoid exit code
  done

  set -e

  # NOTE: STEP 4: build one more boot image
  make_boot_image $my_image_name
  command mv "$BOOT_IMAGE" "$my_boot_image_name" # don't delete the boot image

  $NOTIFY "image compilation complete"
  $SAY "image compilation complete"
  $SAY "done"
}

# NOTE: uses argument #1=filename and outputs to stdout
# prints last modified time of file in seconds
get_file_mtime() {
  stat -c%Y "$1"
}

# NOTE: uses argument #1=filename and #2=directory and outputs to stdout
# prints whether the file is outdated (older; smaller mtime) relative to the directory
_file_mtime_outdated_vs_directory() {
  $SAY "checking $1 is newer than files in $2"
  local -r file_mtime=$(get_file_mtime "$1")

  for dir_entry in $(git ls-files -E "^$2/")
  do
    local dir_entry_mtime
    dir_entry_mtime=$(get_file_mtime "$dir_entry")
    if [[
      # $(bc <<< "$file_mtime < $dir_entry_mtime") -eq 1
      $(dc -e "[1p]sm$file_mtime $dir_entry_mtime>m") -eq 1
    ]]
    then
      # NOTE: file is outdated compared to directory file
      echo 1
      return 0
    fi
  done
  echo 0
  return 0
}

#!/usr/bin/env bash

TRIM_HASH_TO=${TRIM_HASH_TO:-12}

# 1 arg
git_directory_files() {
  git ls-files | egrep "^$1/"
}

# 1 arg
hash_directory_filenames() {
  git_directory_files "$1" | $SUM
}

# 1 arg
hash_directory_contents() {
  git_directory_files "$1" | xargs cat | $SUM
}

# no args, reads STDIN
trim_line() {
  fold "-w$TRIM_HASH_TO" | head -n1
}

# 1 arg
# output hash format: filenames-contents
make_hash_names() {
  echo -e "$(hash_directory_filenames "$1" | trim_line)-$(hash_directory_contents "$1" | trim_line)"
}

# 1 arg
final_hash() {
  case "$1" in
    "image")  make_hash_names "(core|basis)" ;;
    "binary") make_hash_names "vm" ;;
  esac
}

# 1 arg, writes STDOUT
file_hashes_from_name() {
  echo "$1" | sed -E 's/.*\[(.+)-(.+)\]_\[(.+)-(.+)\].*/\1 \2 \3 \4/'
}

_file_hash_outdated_vs_directory() {
  true
}

file_outdated_vs_directory() {
  true
}

# 2 args: binary hash string, image hash string
make_current_file_names() {
 name_format="_$branchname""_$MAKE_IMAGE_TARGET""_v$FACTOR_VERSION"
 my_basefilename="$name_format""_$FACTOR_BINARY"
 my_boot_image_name="boot.$my_basefilename.image"

 # hash format: [binary_filenames-binary_filecontents]_[image_filenames-image_filecontents]

 my_binary_name="$name_format""_[$1]_[$2]_$FACTOR_BINARY"
 my_image_name="$my_binary_name.image"

 echo "name_format=        $name_format"
 echo "my_basefilename=    $my_basefilename"
 echo "my_boot_image_name= $my_boot_image_name"
 echo "my_binary_name=     $my_binary_name"
 echo "my_image_name=      $my_image_name"
}

current_files_missing() {
  local -r binary_hash=$(final_hash "binary")
  local -r image_hash=$(final_hash "image")

  make_current_file_names $binary_hash $image_hash

  if [[ ! -e "$my_binary_name" || ! -e "$my_image_name" ]]
  then
    echo 1
  else
    echo 0
  fi
}

main() {
  set +e
  {
    stat "$my_binary_name"
    local -r my_binary_missing=$?

    stat "$my_image_name"
    local -r my_image_missing=$?
  } > /dev/null 2>&1
  set -e

  # no first argument = do nothing
  # first arg is -- = do nothing
  if [[ ! -z "${ARGV[0]}" && "${ARGV[0]}" != "--" ]]
  then

    if [[ "${ARGV[0]}" = "noop" ]]
    then
      $SAY "doing literally nothing"
      my_exit
    fi

    if [[ "${ARGV[0]}" = "nomtime" ]]
    then
      $SAY "not checking mtimes"
      local -r check_mtime=0
    else
      local -r check_mtime=1
      make_clean
    fi

    if [[ "${ARGV[0]}" = "forcerebuild" ]]
    then
      $SAY "forcing rebuild"
      build_factor
      build_image
      run_factor
    fi

    if [[
      $my_binary_missing -gt 0 || (
        $check_mtime -eq 1
        && $my_binary_missing -eq 0
        && $(file_outdated_vs_directory "$my_binary_name" "vm") -eq 1
      )
    ]]
    then
      build_factor
    else
      $SAY "binary up-to-date"
      $NOTIFY "binary up-to-date"
    fi

    if [[
      $my_image_missing -gt 0 || (
        $check_mtime -eq 1
        && $my_image_missing -eq 0
        && $(file_outdated_vs_directory "$my_image_name" "core") -eq 1
        && $(file_outdated_vs_directory "$my_image_name" "basis") -eq 1
      )
    ]]
    then
      build_image
    else
      $SAY "image up-to-date"
      $NOTIFY "image up-to-date"
    fi

    run_factor

  else
    $SAY "built nothing: empty \$ARGV"
    $NOTIFY "nothing built (empty ARGV)"
    if [[ $my_binary_missing -eq 0 && $my_image_missing -eq 0 ]]
    then
      $SAY "running factor"
      run_factor
    else
      $SAY "nothing to run"
    fi
    $SAY "done"
  fi
}

# main
make_file_names "$(final_hash binary)" "$(final_hash image)"