#!/usr/bin/env bash
#SWARM_SECRETS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../docker/_swarm/secrets" && pwd )"
#RUN_ENV="preprod"


# https://docs.docker.com/engine/swarm/swarm_manager_locking/
# COMMON - Files
#---------------------------------
# docker stop $(docker ps -a -q)
#docker secret rm $(docker secret ls -q)


echo "[START] - Init SWARM secrets"
echo "-----------------------------"


printf "lit" | docker secret create litTodoBackDb-MYSQL_DATABASE-v1 -
printf "lit" | docker secret create litTodoBackDb-MYSQL_USER-v1 -
printf "lit" | docker secret create litTodoBackDb-MYSQL_PASSWORD-v1 -
printf "root" | docker secret create litTodoBackDb-MYSQL_ROOT_PASSWORD-v1 -


echo "-----------------------------"
echo "[DONE] - Init SWARM secrets"


