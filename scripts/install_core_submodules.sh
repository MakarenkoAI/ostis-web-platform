#!/usr/bin/env bash
set -eo pipefail

CURRENT_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)
source "${CURRENT_DIR}/formats.sh"

if [[ -z "${PLATFORM_PATH}" || -z "${SC_MACHINE_REPO}" || -z "${SC_MACHINE_BRANCH}" ]];
then
  source "${CURRENT_DIR}/set_vars.sh"
fi


usage() {
  cat <<USAGE
Usage: $0 [update]

This script is used to download sources of ostis-web-platform and submodules
and install them. The exact behavior is configured via run arguments.

Options:
  update: Remove ostis-web-platform submodules sources and download them from scratch.
USAGE
  exit 1
}

clone_project()
{
  if [ -z "$2" ];
  then
    printf "Empty paths are dangerous in use. Use another path instead for submodules installation or update.\n"
    exit 1
  fi

  if [[ ! -d "$2" || ${update} == 1 ]]; then
    if (( ${update} == 1 ));
    then
      printf "Remove submodule %s (%s) %s \n" "$1" "$3" "$2"
      rm -rf "$2"
      git pull
    fi

    printf "Clone submodule %s (%s) into %s\n" "$1" "$3" "$2"
    git clone "$1" --branch "$3" --single-branch "$2" --recursive
  else
    printf "You can update %s manually. Use this script with \"update\" parameter.\n" "$2"
  fi
}

update=0

while [ "$1" != "" ]; do
  case $1 in
    "update" )
      update=1
      ;;
    "--help" )
      usage
      ;;
    "help" )
      usage
      ;;
    "-h" )
      usage
      ;;
    * )
      usage
      ;;
      esac
      shift
done

stage "Clone submodules"

cd "${PLATFORM_PATH}"

clone_project "${SC_MACHINE_REPO}" "${SC_MACHINE_PATH}" "${SC_MACHINE_BRANCH}"
git submodule update --init --recursive

stage "Submodules cloned successfully"
