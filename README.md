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