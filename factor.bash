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
#  along with this program.  If not, see <https://www.gnu.org/licenses/>.

started_script=$(date +%s)

[[ "$0" != "${BASH_SOURCE[0]}" ]] && BEING_SOURCED=1 || BEING_SOURCED=0
[[ TRC -eq 1 ]] && set -x

# Case insensitive string comparison
shopt -s nocaseglob
shopt -s nocasematch

set -e
# NOTE: set this in .bashrc or before running the script
cd "$FACTOR_FOLDER"

# the point of this is to prevent Factor's build.sh from reading our garbage arguments
# argument list is saved
# shellcheck disable=2206
ARGV=( $@ )
# everything (except $0) is gone
shift $#

# these come later
OUR_ARGS=()
_FACTOR_ARGS=()

alias make="make -j"
set +e
{
  # sorry! build.sh does not use "command"
  unalias rm
  unset -f rm
  unalias mv
  unset -f mv
  unalias cp
  unset -f cp
  # has empty argument list!
  . build.sh

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

require_file_names() {
  if [[ -z "$my_binary_name" || -z "$my_image_name" ]]
  then
    $SAY "BUG: missing required call to make_current_file_names"
    return 78
  fi
}

my_exit() {
  chmod ug+w ".git"
  if [[ BEING_SOURCED -eq 0 ]]
  then
    local -r ended_script=$(date +%s)
    local -r elapsed_time=$(($ended_script - $started_script))
    local -r min_sec=$(dc -e "$elapsed_time 60~rn[m ]Pn[s]P")
    $SAY "done! in $min_sec"
    exit # $1
  fi
}
# trap my_exit EXIT INT TERM

_err_bad_hashtype() { echo "invalid hash type: not image or binary" ; }

new_branch="$(current_git_branch)"
# requires testing
# set +e
# new_branch="$(command yad --on-top --mouse --title="factor.bash: Choose Branch" --text="Choose the branch from which to build/run Factor" --form --field="Branch name")"
# if [[ $? -gt 0 || "$new_branch" = "" || "$new_branch" = "|" ]] # output always contains a trailing | unless ESC was pressed
# then
#   new_branch="$(current_git_branch)" # never mind, use the current branch
# else
#   new_branch="${new_branch::-1}" # chop off the trailing | and use this
#   command git checkout "$new_branch"
#   if [[ $? -ne 0 ]]
#   then
#     $SAY "requested non-existent branch: '$new_branch'"
#     $NOTIFY "FAILED" "no branch named $new_branch"
#     my_exit
#   fi
# fi
# set -e
# chmod a-w ".git" # NOW we can make git readonly

macos_notify() { osascript -e "display notification \"$$ on $branchname\" with title \"$1\"" & }
linux_notify() { notify-send -i gnome-terminal --hint int:transient:1 -u low "$1" "$$ on $branchname" & }
_say() { echo "[$$] on $branchname: $*" >&2 ; } # output to stderr; argument #1=message
_sum() { sha224sum | cut -f1 -d' ' ; }
_mv() { command mv -f "$@" ; }

# NOTE: uses arguments #1=title #2=message
# shellcheck disable=2155
[[ -v NOTIFY ]] || declare -r NOTIFY="$(case "$OS" in (macosx) echo macos_notify ;; (linux) echo linux_notify ;; (*) echo : ;; esac)"
[[ -v SAY ]] || declare -r SAY=_say
[[ -v SUM ]] || declare -r SUM=_sum
[[ -v MV ]] || declare -r MV=_mv
[[ -v SCRIPT_VERSION ]] || declare -r SCRIPT_VERSION=0.2
# shellcheck disable=2155
[[ -v FACTOR_VERSION ]] || declare -r FACTOR_VERSION="$(make -n 2>/dev/null | grep -m1 'FACTOR_VERSION' | sed -E 's/^.*FACTOR_VERSION=\"([0-9]+\.[0-9]+)\".*$/\1/')"
# which dirs build the image?
[[ -v _IMAGE_DIR_REGEX ]] || declare -r _IMAGE_DIR_REGEX="(core|basis)"
# which dirs build the binary?
[[ -v _BINARY_DIR_REGEX ]] || declare -r _BINARY_DIR_REGEX="vm"


echo "[$$] ${BASH_SOURCE[0]} v$SCRIPT_VERSION "
echo "[$$] Factor v$FACTOR_VERSION"
echo "[$$]"

# shellcheck disable=2155
# user could `git checkout` another branch during execution but please don't do that!
# currently the .git folder is made read-only for the duration of the script
# if you insist, make it writable `chmod ug+w` again
branchname="$new_branch"
name_format=
export my_binary_name=
export my_image_name=
export my_boot_image_name=

# to resolve the path of this script from anywhere, for self-invocation
# not actually usefull at the current junction
# SOURCE="${BASH_SOURCE[0]}"
# while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
#   DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
#   SOURCE="$(readlink "$SOURCE")"
#   [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
# done
# DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
# # shellcheck source=hashing.bash
# source "$DIR/hashing.bash"

run_factor() {
  # omitting implied argument -i=$my_image_name because it is in the format Factor expects
  # due to the fact that juggling custom image names with recomplilation is a real PITA

  $SAY "./$my_binary_name" "${_FACTOR_ARGS[@]}"
  ./$my_binary_name "${_FACTOR_ARGS[@]}" &
  local -r pid=$!
  disown $pid
  $SAY "PID $pid"
  $NOTIFY "started + disowned $pid"
  my_exit
}

build_factor() {
  $SAY "missing or outdated binary"
  $NOTIFY "building $FACTOR_BINARY"
  $SAY "making $my_binary_name"
  require_file_names
  make_clean_factor
  $MV "$FACTOR_BINARY" "$my_binary_name"
  $SAY "done"
}

build_image() {
  $SAY "missing or outdated image"
  $NOTIFY "building $MAKE_IMAGE_TARGET"
  # (git branch -r | grep upstream | grep "$branchname" || true)

  $SAY "making $my_image_name"
  require_file_names
  # code allows error exit codes
  # NOTE: just download a boot image
  # NOTE: this series of OR fallbacks is real fucking stupid
  set +e
  {
    stat "$BOOT_IMAGE" ||
    (stat "$my_boot_image_name" && command cp "$my_boot_image_name" "$BOOT_IMAGE") ||
    update_boot_image ||
    update_boot_images || # old versions of build.sh
    get_url "http://downloads.factorcode.org/images/master/$BOOT_IMAGE" ||
    get_failed=1
  } >/dev/null 2>&1
  if [[ $get_failed -eq 1 || $(stat "$BOOT_IMAGE" >/dev/null 2>&1; echo $?) == "1" ]]
  then
    $NOTIFY "FAILED" "unable to find or download boot image"
    $SAY
    $SAY "Bootstrap: no prior boot image ($BOOT_IMAGE) (sorry!)"
    $SAY "  there is no net service to download one :("
    return 78
  fi

  $NOTIFY "image pass #1"
  $SAY "image pass #1"
  # NOTE: STEP 1: run from boot image
  ./$my_binary_name -no-user-init "-i=$BOOT_IMAGE" # > /dev/null 2>&1 &
  # spinner $!

  # NOTE: STEP 2: `refresh-all` from newly compiled image
  refresh_image $my_image_name
  image_fails_refresh=$?
  local i=2

  # NOTE: STEP 3: re-bootstrap and refresh until it doesn't break (25 re-compiles should be enough....)
  while [[ $image_fails_refresh -gt 0 && 1 -eq $((i < 25)) ]]
  do
    $SAY "refresh #$i failed! bootstrapping again..."
    $NOTIFY "image pass #$i"

    make_boot_image $my_image_name
    ./$my_binary_name -no-user-init "-i=$BOOT_IMAGE"

    refresh_image $my_image_name

    image_fails_refresh=$?
    i=$((i+1))
  done

  set -e

  # NOTE: STEP 4: build one more boot image
  make_boot_image $my_image_name
  $MV "$BOOT_IMAGE" "$my_boot_image_name" # don't delete the boot image

  $NOTIFY "image compilation complete"
  $SAY "image compilation complete"
  $SAY "done"
}

# NOTE: uses argument #1=filename and outputs to stdout
# prints last modified time of file in seconds
get_file_mtime() {
  stat -c%Y "$1"
}

# NOTE: UNUSED: REASON: git updates file mtimes on branch checkout, they are unreliable
# NOTE: uses argument #1=filename and #2=directory and outputs to stdout
# prints whether the file is outdated (older; smaller mtime) relative to the directory
# _file_mtime_outdated_vs_directory() {
#   $SAY "checking $1 is newer than files in $2"
#   local -r file_mtime=$(get_file_mtime "$1")
#
#   for dir_entry in $(git ls-files -E "^$2/")
#   do
#     local dir_entry_mtime
#     dir_entry_mtime=$(get_file_mtime "$dir_entry")
#     if [[
#       # $(bc <<< "$file_mtime < $dir_entry_mtime") -eq 1
#       $(dc -e "[1p]sm$file_mtime $dir_entry_mtime>m") -eq 1 # slightly faster
#     ]]
#     then
#       # NOTE: this file is outdated compared to directory file
#       echo 1
#       return 0
#     fi
#   done
#   echo 0
#   return 0
# }

TRIM_HASH_TO=${TRIM_HASH_TO:-12}

# 1 arg: regex to find directories
git_directory_files() {
  git ls-files | egrep "^$1/"
}

# 1 arg: see git_directory_files
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

# 1 arg: regex
# output hash format: filenames-contents
make_hash_names() {
  echo -e "$(hash_directory_filenames "$1" | trim_line)-$(hash_directory_contents "$1" | trim_line)"
}

# 1 arg: (image|binary)
final_hash() {
  local -r type="$(sed -nE 's/^(image|binary)$/\U&/p' <<< "$1")"
  [[ -z "$type" ]] && { _err_bad_hashtype ; return 78; }

  local -r type_variable="_$type""_DIR_REGEX"

  # the following are equivalent
  make_hash_names "${!type_variable}"
  # case "$1" in
  #   "image")  make_hash_names "$_IMAGE_DIR_REGEX" ;;
  #   "binary") make_hash_names "$_BINARY_DIR_REGEX" ;;
  # esac
}

# extract the parts of the filename generated by make_hash_names / make_current_file_names
# 1 arg: filename, writes STDOUT with delimited hashes:
# vm/ filenames vm/ file contents;core+basis filenames core+basis contents
# binary is built from 1+2, image is built from 3+4
file_hashes_from_name() {
  sed -nE 's/.*\[(.+)-(.+)\]_\[(.+)-(.+)\].*/\1 \2;\3 \4/p' <<< "$1"
}

# not called anywhere, might be used later
_file_hash_outdated_vs_directory() {
  true
}

# 1 arg: (image|binary)
_hash_position() {
  local -r type=$(sed -nE 's/^(image|binary)$/\1/p' <<< "$1")
  [[ -z "$type" ]] && { _err_bad_hashtype ; return 78; }

  # these are used via indirection

  # shellcheck disable=2034
  local -r binary_hash_pos="1"
  # shellcheck disable=2034
  local -r image_hash_pos="2"

  local -r type_variable="$type""_hash_pos"

  echo "${!type_variable}"
}

# unused
# arg #1: (image|binary), arg #2: filename
file_outdated_vs_directory() {
  require_file_names
  local -r type=$(sed -nE 's/^(image|binary)$/\U&/p' <<< "$1") # local -r type="$(tr '[:lower:]' '[:upper:]' <<< "$1")"
  [[ -z "$type" ]] && { _err_bad_hashtype ; return 78; }

  local -r type_variable="_$type""_DIR_REGEX"

  # we'll just trim the hashes to $TRIM_HASH_TO, instead of string_startswith

  local -r hash_current_filenames=$(hash_directory_filenames "${!type_variable}" | trim_line)
  local -r hash_current_contents=$(hash_directory_contents "${!type_variable}"   | trim_line)

  # the following two strings are already $TRIM_HASH_TO long

  # filename comes first: -f1
  local -r hash_built_filenames="$(file_hashes_from_name "$2" | cut -d';' -f"$(_hash_position "$1")" | cut -d' ' -f1)"
  # -f2 is the contents hash
  local -r hash_built_contents="$(file_hashes_from_name "$2" | cut -d';' -f"$(_hash_position "$1")" | cut -d' ' -f2)"

  echo "hash_built_filenames=   $hash_built_filenames"
  echo "hash_current_filenames= $hash_current_filenames"
  echo "hash_built_contents=    $hash_built_contents"
  echo "hash_current_contents=  $hash_current_contents"

  if [[
    "$hash_built_filenames" != "$hash_current_filenames"
    || "$hash_built_contents" != "$hash_current_contents"
  ]]
  then
    echo 1 # the hashes do not match, needs  to be rebuilt
  else
    echo 0 # matching hashes, do not rebuild
  fi
}

# 2 args: binary hash string, image hash string
make_current_file_names() {
 name_format="_$branchname""_$MAKE_IMAGE_TARGET""_v$FACTOR_VERSION"
 my_basefilename="$name_format""_$FACTOR_BINARY"
 my_boot_image_name="boot.$my_basefilename.image"

 # hash format: [binary_filenames-binary_filecontents]_[image_filenames-image_filecontents]

 my_binary_name="$name_format""_[$1]_[$2]_$FACTOR_BINARY"
 my_image_name="$my_binary_name.image"

 echo "CURRENT VARS"
 echo -e "name_format=        $name_format"
 echo -e "my_basefilename=    $my_basefilename"
 echo -e "my_boot_image_name= $my_boot_image_name"
 echo -e "my_binary_name=     $my_binary_name"
 echo -e "my_image_name=      $my_image_name"
}

easy_make_current_filenames() {
  make_current_file_names "$(final_hash "binary")" "$(final_hash "image")"
}

# arg #1: "binary" or "image"
# output: 1 for missing 0 for exists
is_current_file_missing() {
  require_file_names
  # variables can't start with a number so $1_name is actually "$1" + _name
  local -r file_name_var_name="my_$1_name"

  if [[ -e "${!file_name_var_name}" ]]
  then
    echo 0
  else
    echo 1
  fi
}

is_current_files_missing() {
  require_file_names
  if [[ $(is_current_file_missing "binary") -eq 1 || $(is_current_file_missing "image") -eq 1 ]]
  then
    echo 1
  else
    echo 0
  fi
}

main() {
  seen_args_end=0

  for cmd_arg in "${ARGV[@]}"
  do
    if [[ "$cmd_arg" = "--" && seen_args_end -eq 0 ]]
    then
      seen_args_end=1
      # echo "seen args end"
      continue
    fi
    if [[ "$seen_args_end" -eq 0 ]]
    then
      OUR_ARGS+=("$cmd_arg")
    else
      _FACTOR_ARGS+=("$cmd_arg")
    fi
    # echo -n "$cmd_arg" | od -vAn -tcx1
  done

  # $SAY "OUR ARGS: ${OUR_ARGS[*]}"
  # $SAY "FACTOR'S ARGS: ${_FACTOR_ARGS[*]}"

  local -r my_binary_missing=$(is_current_file_missing "binary")

  local -r my_image_missing=$(is_current_file_missing "image")

  # no first argument = do nothing
  # first arg is -- = do nothing
  # -- means end our argument list and begin Factor's args
  if [[ ! -z "${OUR_ARGS[0]}" ]] # redundant: && "${ARGV[0]}" != "--"
  then

    if [[ "${OUR_ARGS[0]}" = "noop" ]]
    then
      $SAY "doing literally nothing"
      my_exit
    fi

    if [[ "${OUR_ARGS[0]}" != "noclean" ]]
    then
      make_clean
    fi

    if [[ "${OUR_ARGS[0]}" = "forcerebuild" ]]
    then
      $SAY "forcing rebuild"
      build_factor
      build_image
      run_factor
    fi

    if [[
      $my_binary_missing -gt 0
      || $(file_outdated_vs_directory "binary" "$my_binary_name") -eq 1
    ]]
    then
      build_factor
    else
      $SAY "binary up-to-date"
      $NOTIFY "binary up-to-date"
    fi

    if [[
      $my_image_missing -gt 0
      || $(file_outdated_vs_directory "image" "$my_image_name") -eq 1
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
    if [[ $(is_current_files_missing) -eq 0 ]]
    then
      $SAY "running factor"
      run_factor
    else
      $SAY "nothing to run"
      if [[ $(is_current_file_missing "image") -eq 1 ]]; then $SAY "missing image" ; fi
      if [[ $(is_current_file_missing "binary") -eq 1 ]]; then $SAY "missing binary" ; fi
    fi
    $SAY "done"
  fi
}

easy_make_current_filenames
if [[ BEING_SOURCED -eq 0 ]]
then
  main
else
  true
fi

cd - >/dev/null 2>&1

set +e
set +x
