#!/bin/bash

THIS_PROG=$( basename $0 )
USAGE="Usage: $THIS_PROG [-d cookie_cutter_dir] [-D project_dir] project_type project_name"

## CONFIGURATIONS
########################################

COOKIE_CUTTER_DIR="$HOME/code/scripts/cookie_cutters"
PROJ_DIR=$( readlink -f . )

while getopts ":hd:D:" opt; do
  case $opt in
    h)
      echo $USAGE
      exit 0
      ;;
    d)
      COOKIE_CUTTER_DIR=$OPTARG
      ;;
    D)
      PROJ_DIR=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done
shift $((OPTIND-1))

PROJ_TYPE=$1
COOKIE_CUTTER="$COOKIE_CUTTER_DIR/$PROJ_TYPE"

PROJ_NAME=$2

PROJ_DEST="$PROJ_DIR/$PROJ_NAME"


## ASSERTIONS
########################################

if [ $# -lt 2 ] ; then
  echo $USAGE
  exit 1
fi

if [ ! -d $COOKIE_CUTTER ] ; then
  echo "${0}: error: template for project type does not exist"
  exit 1
fi

if [ -d "$PROJ_DEST" ] ; then
  echo "${0}: error: project directory already exists"
  echo "$PROJ_DEST"
  exit 1
fi


## MAIN
########################################

printf "Creating $PROJ_TYPE project in $PROJ_DEST ... "
if cp -r $COOKIE_CUTTER $PROJ_DEST; then
  echo "Success!"
else
  echo ""
  echo "${0}: error: unable to create $PROJ_TYPE in $PROJ_DIR ..."
fi
