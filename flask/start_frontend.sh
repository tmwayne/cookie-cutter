#!/bin/bash

# Usage: start_flask [-e env]

while getopts ":e:" opt; do
  case $opt in
    e)
      ENV=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done
shift $((OPTIND-1))

ENV=${ENV:-py-env}

echo "Activating Python virtual environment $ENV..."
source $ENV/bin/activate

# export FLASK_APP=main.py
export FLASK_ENV=development
flask run
