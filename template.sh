#!/bin/bash
set -e

## This is a template bash script with usage docs and arg parsing
## Usage: template.sh [options]
##
##       [-h     | --help]     Print this help message
##       [-f arg | --foo arg]  Foos the bar
##       [-b arg | --bar arg]  Bars the baz

BASE=$(cd $(dirname $0); pwd -P)                                        

usage() {
   echo "$(grep "^## " "${BASH_SOURCE[0]}" | cut -c 4-)"
   exit 0
}

error() {
   cat <<< "$@" 1>&2
   exit 1
}

[[ $# == 0 ]] && usage

# Transform long options to short ones
for arg in "$@"; do
  shift
  case "$arg" in
    "--help") set -- "$@" "-h" ;;
    "--foo")  set -- "$@" "-f" ;;
    "--bar")  set -- "$@" "-b" ;;
    *)        set -- "$@" "$arg"
  esac
done
# Parse short options
OPTIND=1
while getopts "hf:b:" opt
do
  case "$opt" in
    "h") usage; exit 0 ;;
    "f") FOO="$OPTARG" ;;
    "b") BAR="$OPTARG" ;;
    "?") usage >&2; exit 1 ;;
    ":") error "Option -$OPTARG requires an argument.";;
  esac
done
shift $(expr $OPTIND - 1) # remove options from positional parameters


ARGS=$@

if [[ -n "$FOO" ]]; then
   echo "FOO: $FOO"
fi
if [[ -n "$BAR" ]]; then
   echo "BAR: $BAR"
fi

echo "Rest of the args were: $ARGS"
