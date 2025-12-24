# lazyenv

Local environment manager which improve developer experience :)

## Config

- wireguard
- wsl

## Docker

- consul
- grafana
- jaeger
- kafka
- kibana
- mongo
- nats
- nginx
- postgres
- rabbitmq
- redis

## Scripts

- install
- utils

## Env

Example:

```.env
# APP VERSIONS
NVM_VERSION=0.39.7

# DOCKER IMAGE TAGS
DOCKER_IMAGE_NGINX_TAG=1.25.4
DOCKER_IMAGE_POSTGRES_TAG=16.2
DOCKER_IMAGE_MONGO_TAG=7.0.8
DOCKER_IMAGE_REDIS_TAG=7.2.4
DOCKER_IMAGE_RABBITMQ_TAG=3.13.1-management
DOCKER_IMAGE_NATS_TAG=2.10.22
DOCKER_IMAGE_JAEGER_TAG=1.63.0
DOCKER_IMAGE_CONSUL_TAG=1.15.4
DOCKER_IMAGE_LOKI_TAG=2.9.2
DOCKER_IMAGE_GRAFANA_TAG=10.4.12
DOCKER_IMAGE_TEMPO_TAG=main-a2039e9


# Kubectrl
KUBE_PG_DUMP_CMD="PGPASSWORD=pwd pg_dump -U postgres -d postgres -p 5432"

# Github

GITHUB_FOLDER=/home/username/github # #example
GITHUB_REPOS=(
    "https://github.com/inancgumus/learngo" # example
    "https://github.com/teivah/100-go-mistakes" # example
)

```

## Makefile commands

| Command                 | VARS       | Description                                  |
| ----------------------- | ---------- | -------------------------------------------- |
| env-prepare             | -          | Init .env from env.example                   |
| create-net              | -          | Init docker networks                         |
| docker-container-ip     | $container | Check docker container ip's                  |
| docker-build-container  | $name      | Build container by name                      |
| docker-update-container | $name      | Update container by name                     |
| postgres-dump           | $db        | Create pg_dump by database name              |
| postgres-restore        | $db, $date | Restore pg database by name and timestamp    |
| mongodump               | $db        | Create mongodump by database name            |
| mongorestore            | $db, $date | Restore mongo database by name and timestamp |
