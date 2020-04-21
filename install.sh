#!/bin/bash

USAGE='Usage: install'

## VARIABLES
##############################

PROG_NAME=cookie-cutter
DIR=~/.local/bin/
CUR_DIR=$( pwd )

TARGET="$DIR"/$PROG_NAME

## ASSERTIONS
##############################

if [ ! -d "$DIR" ]; then
  echo "${0}: error: target directory $DIR does not exist ..."
  exit 1
fi

## MAIN
##############################

# Check for existing file
if [ -f "$TARGET" ]; then
  target_exists=1
else
  target_exists=0
fi

if [ $target_exists -eq 1 ]; then
  read -p "Target already exists. Overwrite? (y/n) [n]: " overwrite
fi

if [ "$overwrite" != "y" ]; then
  echo "${0}: error: aborting without overwriting ..."
  exit 1
fi

# Make backup
if [ $target_exists -eq 1 ]; then
  mv "$TARGET" "$TARGET".bk
fi

# Install
if ln -s "$CUR_DIR"/cookie_cutter.sh "$TARGET"; then
  successful_install=1
else
  successful_install=0
fi

if [ $successful_install -eq 1 ]; then
  echo "Successfully installed ${PROG_NAME}!"
  exit_code=0
else
  echo "${0}: error: failed to install target ..."
  rm -f "$TARGET"
  exit_code=1
fi

# Clean up
if [ $target_exists -eq 1 ]; then
  mv "$TARGET".bk "$TARGET"
  rm -f "$TARGET".bk
fi

# Exit
exit $exit_code

