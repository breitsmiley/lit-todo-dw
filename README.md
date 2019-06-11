# Get Started

## Setup docker workspace
```bash
cp .env.dist.dev.env .env
sudo -- sh -c "echo 127.0.0.1 proxy.lit-todo.loc >> /etc/hosts"
sudo -- sh -c "echo 127.0.0.1 lit-todo.loc >> /etc/hosts"
```

## Clone projects
```bash
./sh/init-apps-dev.sh
```


## Good Commands
```bash
docker pull breitsmiley/lit-nest-dev:latest
docker pull breitsmiley/lit-angular-dev:latest


ts-node -r tsconfig-paths/register ./node_modules/.bin/typeorm 
ts-node -r tsconfig-paths/register ./node_modules/.bin/typeorm schema:drop
ts-node -r tsconfig-paths/register ./node_modules/.bin/typeorm schema:sync
ts-node -r tsconfig-paths/register ./node_modules/.bin/typeorm migration:generate -n init
ts-node -r tsconfig-paths/register ./node_modules/.bin/typeorm migration:run

ts-node ./node_modules/typeorm/cli.js migration:run

```


docker build -t breitsmiley/lit-todo-front-prod:latest -t breitsmiley/lit-todo-front-prod:0.0.1 . \
docker build -t breitsmiley/lit-todo-back-prod:latest -t breitsmiley/lit-todo-back-prod:0.0.1 . \
docker push breitsmiley/lit-todo-front-prod:latest
docker push breitsmiley/lit-todo-front-prod:0.0.1

docker push breitsmiley/lit-todo-back-prod:latest
docker push breitsmiley/lit-todo-back-prod:0.0.1

docker stack deploy --compose-file docker-stack.yml stackdemo
