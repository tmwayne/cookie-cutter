#!/bin/bash

USAGE='Usage: uninstall'

## VARIABLES
##############################

PROG_NAME=cookie-cutter
DIR=~/.local/bin/

TARGET="$DIR"/$PROG_NAME

## ASSERTIONS
##############################

if [ ! -f "$TARGET" ]; then
  echo "${0}: error: target not found ..."
  exit 1
fi

## MAIN
##############################

if rm -f "$TARGET"; then
  echo "Successfully uninstalled ${PROG_NAME}!"
else
  echo "$0: error: unable to uninstall $PROG_NAME ..."
fi
