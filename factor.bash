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

declare -r SCRIPT_VERSION=0.2

# shellcheck disable=2155
declare -r FACTOR_VERSION=$(make -n | grep -m1 'FACTOR_VERSION' | sed -E 's/^.*FACTOR_VERSION=\"([0-9]+\.[0-9]+)\".*$/\1/')

# source directory of this script
###########
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
###########

# shellcheck source=src/lib.sh
source "$DIR/factor_functions.bash"

# Case insensitive string comparison
shopt -s nocaseglob
shopt -s nocasematch

# NOTE: set this in .bashrc or similar
pushd "$FACTOR_FOLDER" > /dev/null
# argument list is saved
ARGV=( $@ )
# everything (except $0) is gone
shift $#

alias make="make -j"
set +e
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

echo "[$$] $0 v$SCRIPT_VERSION "
echo "[$$] Factor v$FACTOR_VERSION"
echo "[$$]"

# shellcheck disable=2155
# user could `git checkout` another branch during execution but please don't do that
declare -r branchname=$(current_git_branch)
declare -r name_format="_$branchname""_$MAKE_IMAGE_TARGET""_v$FACTOR_VERSION"
declare -r my_binary_name="$name_format""_$FACTOR_BINARY"
declare -r my_image_name="$my_binary_name.image"
declare -r my_boot_image_name="boot.$my_image_name"

# being sourced
if [[ "$0" = "bash" ]]
then
  true
else
  main
fi

popd > /dev/null
