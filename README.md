# lazyenv - Local Environment Manager

## Project Overview

lazyenv is a local environment management tool that simplifies the setup and management of development environments. It provides utilities for configuring system settings, managing Docker containers for common services, and automating common development tasks.

## Architecture

- `lazyenv` - Main CLI script (bash), sources `lazyenv.conf` at startup
- `lazyenv.conf` - Configuration (gitignored), copy from `lazyenv.conf.example`
- `Makefile` - Common make targets mirroring the CLI
- `build` - Copies the CLI + config into `~/.local/bin/`
- `config/` - System dotfiles (SSH, WSL, bash aliases)
- `docker/` - Per-service Docker config (build.sh / update.sh)
- `scripts/install/` - Tool installers (nvm, docker-wsl, lazydocker, ...)
- `scripts/utils/` - Utility scripts (dbeaver, ssh-tunnel, ...)

## Configuration

Copy `lazyenv.conf.example` to `lazyenv.conf` and edit:

- `FOLDER` - Project path
- `NVM_VERSION`, Docker image tags, fixed container IPs
- `GITHUB_*` / `GITLAB_*` repo lists for sync commands

The Docker network is `172.23.0.0/24` (bridge `br0`). Create it before building containers:

```bash
./lazyenv docker-net
```

## Commands

### Main Interface (`./lazyenv`)

- `./lazyenv help` - Show banner and commands
- `./lazyenv install {name}` - Install tool by script name
- `./lazyenv run-util {name}` - Run utility by name
- `./lazyenv github-sync` - Sync GitHub repos
- `./lazyenv gitlab-sync` - Sync GitLab repos
- `./lazyenv docker-net` - Create Docker bridge network (172.23.0.0/24)
- `./lazyenv docker-container-build {service}` / `dcb` - Build service container
- `./lazyenv docker-container-update {service}` / `dcu` - Update service container
- `./lazyenv docker-container-ip {name}` / `dci` - Inspect container IP
- `./lazyenv pg-dump {db} [host] [port] [user] [password]` - Dump PostgreSQL database (defaults: 127.0.0.1 5432 postgres)
- `./lazyenv pg-restore {db} {file}` - Restore PostgreSQL database from dump
- `./lazyenv psql-restore {db} {file}` - Restore PostgreSQL database from SQL
- `./lazyenv pg-list` - List available PostgreSQL dumps
- `./lazyenv pg-copy` - Copy dumps from postgres container to pg_dump/
- `./lazyenv pg-log [--tail]` - Follow dump log (or show last 10 lines)
- `./lazyenv mysql-dump {db} [host] [port] [user] [password]` - Dump MySQL database (gzipped; defaults: 127.0.0.1 3306 root)
- `./lazyenv mysql-restore {db} {file}` - Restore MySQL database from dump
- `./lazyenv mysql-log [--tail]` - Follow MySQL dump log (or show last 10 lines)
- `./lazyenv mongodump {db}` - Dump MongoDB database
- `./lazyenv mongorestore {db} {date}` - Restore MongoDB database

### Makefile

- `make docker-container-build name={service}`
- `make docker-container-update name={service}`
- `make docker-container-ip container={name}`
- `make postgres-dump db={database}`
- `make postgres-restore db={database} file={file}`
- `make mongodump db={database}`
- `make mongorestore db={database} date={date}`
- `make build` - Install CLI to `~/.local/bin`

## Docker Services

Services under `docker/` each have `build.sh` and `update.sh`:
- postgres, mysql, mongo, redis, rabbitmq, nats, nginx, kafka, jaeger, grafana, elasticsearch, kibana, nodejs

Each service binds to a fixed IP defined in `lazyenv.conf`. PostgreSQL and MySQL builds create a `lazyenv_demo` database with example data.

## Database Dumps

Dump/restore scripts run inside the containers and write logs to `/dump`:

- Dumps: `dump.log` (postgres, mysql, mongo)
- Restores: `restore.log` (postgres, mysql)
- `pg-copy` copies dumps from `docker/postgres/dump/` to `pg_dump/`
- MySQL dumps are gzipped (`*.sql.gz`)
