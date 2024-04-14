# infrastructure

This repos help developers to quickly setup dev environment :)

## Config

- wireguard
- wsl

## Docker

- kafka
- kibana
- mongo
- nginx
- postgres
- rabbitmq
- redis

## Scripts

- install
- utils

# TMP FOLDERS

- mongo_dump
- pg_dump

## Env

Example:

```.env
NVM_VERSION=0.39.7

DOCKER_POSTGRES_TAG=16.2
DOCKER_MONGO_TAG=7.0.8
DOCKER_REDIS_TAG=7.2.4
DOCKER_RABBITMQ_TAG=3.13.1-management

```

## Makefile commands

| Command          | VARS                  | Description                                  |
| ---------------- | --------------------- | -------------------------------------------- |
| env-prepare      | -                     | Init .env from env.example                   |
| create-net       | -                     | Init docker networks                         |
| build-container  | $NAME                 | Build container by name                      |
| update-container | $NAME                 | Update container by name                     |
| postgres-dump    | $DATABASE             | Create pg_dump by database name              |
| postgres-restore | $DATABASE, $TIMESTAMP | Restore pg database by name and timestamp    |
| mongodump        | $DATABASE             | Create mongodump by database name            |
| mongorestore     | $DATABASE, $TIMESTAMP | Restore mongo database by name and timestamp |
