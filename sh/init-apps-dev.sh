#!/usr/bin/env bash
APPS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../apps" && pwd )"
BUILD_ENV="dev"

# services
#================================================
function lit-todo-front {
    cd ${APPS_DIR}
    git clone -b dev https://github.com/breitsmiley/lit-todo-dw.git lit-todo-front \
    && cd lit-todo-front
}

function lit-todo-back {
    cd ${APPS_DIR}
    git clone -b dev https://github.com/breitsmiley/lit-todo-back lit-todo-back \
    && cd lit-todo-back \
    && cp .env.dist .env
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
    echo "INIT All Services"
    lit-todo-front
    lit-todo-back
    exit
else
  echo "INIT Some Services"

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
