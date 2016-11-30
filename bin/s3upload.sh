#!/bin/bash
set -e

## s3upload.sh: upload files to a bucket and return url
## (Assumes you're using the bucket as a static web site)
## Usage: s3upload.sh -b s3://mybucket.com file [file2 file3...]
##
##       [-h     | --help]     Print this help message
##       [-b     | --bucket]   The s3 bucket path
## Eg:
##   s3upload.sh -b s3://mybucket.com lolcat.png
##  => http://mybucket.com/lolcat.png

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
    "--bucket")  set -- "$@" "-b" ;;
    *)        set -- "$@" "$arg"
  esac
done
# Parse short options
OPTIND=1
while getopts "hb:" opt
do
  case "$opt" in
    "h") usage; exit 0 ;;
    "b") BUCKET="$OPTARG" ;;
    "?") usage >&2; exit 1 ;;
    ":") error "Option -$OPTARG requires an argument.";;
  esac
done
shift $(expr $OPTIND - 1) # remove options from positional parameters

ARGS=( "$@" )
#echo "Rest of the args were: $ARGS"

if [[ -n "$BUCKET" ]]; then

  for i in "${ARGS[@]}"
  do
    OUTPUT=$(aws s3 cp --acl "public-read" "$i" "$BUCKET")
    if [ $? -eq 0 ]
    then
      URL=$(echo "$OUTPUT" | cut -d : -f 3)

      # AA TODO: use xsel for linux and pbcopy for mac
      echo "http:$URL" | tee /dev/tty | pbcopy
    fi
  done

else
  error "bucket argument is required"
fi

