#!/bin/bash

## This is a template bash script with usage docs and arg parsing
## Usage: template.sh [options]
##
##       [-h | --help]     Print this help message
##       [-f | --foo]      Foos the bar
##       [-b | --bar]      Bars the baz

usage() {
   echo "$(grep "^## " "${BASH_SOURCE[0]}" | cut -c 4-)"
   exit 0
}

error() {
   cat <<< "$@" 1>&2
   exit 1
}

[[ $# == 0 ]] && usage

ARGS=$@

while [[ $# > 0 ]]; do
   key="$1"
   case $key in
      -h|--help)
         usage
         ;;
      -f|--foo)
         FOO=1
         ;;
      -b|--bar)
         BAR=1
         ;;
   esac
   shift
done

if [[ -n "$FOO" ]]; then
   echo "FOO"
fi
if [[ -n "$BAR" ]]; then
   echo "BAR"
fi
