#!/usr/bin/env bash
# this file is part of the factor.bash script, and isn't much use without it

started_script=$(date +%s)
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
file_outdated_vs_directory() {
  $SAY "checking $1 is newer than files in $2"
  local -r file_mtime=$(get_file_mtime "$1")

  for dir_entry in "$2"/*
  do
    local dir_entry_mtime
    dir_entry_mtime=$(get_file_mtime "$dir_entry")
    if [[
      # dc seems to be faster here
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
