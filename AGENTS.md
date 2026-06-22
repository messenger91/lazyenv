# lazyenv - Local Environment Manager

## Entry Point

```bash
./lazyenv {command} [args]   # Main CLI
make {target}                 # Alternative via Makefile
```

## Key Commands

```bash
./lazyenv install {name}          # Install tools (nvm, docker-wsl, lazydocker, gittype)
./lazyenv docker-net               # Create Docker bridge network (172.23.0.0/24, name: br0)
./lazyenv docker-container-build {service}  # Build service container
./lazyenv docker-container-ip {name}         # Get container IP
./lazyenv pg-dump {db}             # Dump PostgreSQL database
./lazyenv pg-list                  # List available dumps in pg_dump/
./lazyenv mongodump {db}           # Dump MongoDB database
./lazyenv pg-restore {db} {file}   # Restore pg_dump file
./lazyenv psql-restore {db} {file} # Restore plain SQL file
./lazyenv github-sync             # Sync GitHub repos
./lazyenv gitlab-sync             # Sync GitLab repos
./lazyenv pg-copy                 # Copy dumps from docker/postgres/dump to pg_dump/
```

## Configuration

- **Source config**: `lazyenv.conf` (gitignored, copy from `lazyenv.conf.example`)
- Config file sets Docker image tags, container IP addresses (172.23.0.0/24 subnet), and utility paths

## Docker Services

Services under `docker/` each have `build.sh` and `update.sh`:
- postgres, mysql, mongo, redis, rabbitmq, nats, nginx, kafka, jaeger, grafana, elasticsearch

Each service binds to a fixed IP defined in `lazyenv.conf`:
```
postgres: 172.23.0.102
mysql: 172.23.0.108
mongo: 172.23.0.107
redis: 172.23.0.109
```

## Directory Structure

```
lazyenv/          # Main CLI script
lazyenv.conf      # Configuration (gitignored)
pg_dump/          # Database dumps (gitignored)
docker/           # Service configs and build scripts
  {service}/      # Service-specific: build.sh, update.sh, dump scripts
  network.sh      # Creates br0 network
config/           # SSH, WSL, bash aliases
scripts/          # Install and utility scripts
  install/        # nvm.sh, docker-wsl.sh, lazydocker.sh, gittype.sh, test.sh
  utils/          # github-repos.sh, dbeaver-scripts.sh, ssh-tunnel.sh
```

## Makefile Patterns

```bash
make docker-container-build name={service}
make postgres-dump db={database}
make mongodump db={database}
make pg-copy            # Copy dumps from docker/postgres/dump to pg_dump/
```

## Gotchas

- `lazyenv` sources `lazyenv.conf` at startup — config file with `FOLDER` var must exist
- Docker network `br0` must be created before building containers: `./lazyenv docker-net`
- PostgreSQL container uses hardcoded password `example` in build.sh
- Dump scripts inside containers expect mounted volumes at `/dump`
