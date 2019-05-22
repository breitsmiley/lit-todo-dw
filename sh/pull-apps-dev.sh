#!/usr/bin/env bash
APPS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../apps" && pwd )"
BUILD_ENV="dev"

#git pull --progress --no-stat -v --progress origin dev || exit 1

# Crypto services
#================================================
function lit-todo-front {
    cd ${APPS_DIR}/lit-todo-front
    git pull --progress --no-stat -v --progress origin dev
}

function lit-todo-back {
    cd ${APPS_DIR}/lit-todo-back
    git pull --progress --no-stat -v --progress origin dev
}
#-----------------------------

#############################
# MAIN SECTION
#############################

# Links
# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash

services=("$@")
servicesLength=${#services[@]}

if [ ${servicesLength} -eq 0 ]; then
    echo "PULL All Services"
    lit-todo-front
    lit-todo-back
    exit
else
  echo "PULL Some Services"

  for i in "${services[@]}";
  do
    case $i in
    "lit-todo-front") ;&
    "lit-todo-back")
        echo "${i} is pulling..."
        $i
    ;;
    *)    # unknown option
        echo "\"${i}\" is wrong service name - SKIP"
    ;;
    esac
  done

  exit
fi