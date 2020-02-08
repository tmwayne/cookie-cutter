#!/bin/bash

# Usage: start_flask [-e env]

while getopts ":e:" opt; do
  case $opt in
    e)
      PY_ENV=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done
shift $((OPTIND-1))

PY_ENV=${PY_ENV:-webserver}

echo "Activating Python environment: $PY_ENV"
source activate "$PY_ENV"

export FLASK_APP=main.py
export FLASK_ENV=development
flask run
