# lazyenv - Local Environment Manager

Bash CLI for managing local dev tools, Docker service containers, and database dumps.

## Entry Points

```bash
./lazyenv {command} [args]   # main CLI (run from repo root)
make {target}                # partial mirror of CLI
./build                      # installs CLI + conf to ~/.local/bin/
```

## CLI Commands

```bash
./lazyenv help                                   # banner + command list (no args also works)
./lazyenv install {name}                         # run scripts/install/{name}.sh
./lazyenv run-util {name}                        # run scripts/utils/{name}.sh
./lazyenv github-sync | gitlab-sync              # clone/sync repos listed in lazyenv.conf
./lazyenv docker-net                             # create bridge br0 (172.23.0.0/24)
./lazyenv dcb {svc} | dcu {svc}                  # build / update service container (aliases: docker-container-build/update)
./lazyenv dci {name}                             # show container IPs (alias: docker-container-ip)
./lazyenv pg-dump {db} | pg-restore {db} {f}     # dump / restore postgres (pg_restore format)
./lazyenv psql-restore {db} {f}                  # restore plain SQL into postgres
./lazyenv pg-list                                # list dumps in pg_dump/
./lazyenv pg-copy                                # sudo cp docker/postgres/dump/*.dump pg_dump/
./lazyenv pg-log [--tail] | mysql-log [--tail]   # follow dump.log (default = tail -f)
./lazyenv mysql-dump {db} | mysql-restore {db} {f}   # mysql dumps are gzipped (*.sql.gz)
./lazyenv mongodump {db} | mongorestore {db} {date}
```

`make` equivalents: `make docker-container-build name={svc}`, `make postgres-dump db={db}`, `make pg-copy` (note: target is `sync-dump` in the Makefile, not `pg-copy`).

## Config

- `lazyenv.conf` is gitignored; copy `lazyenv.conf.example`. The CLI and all `docker/*/build.sh` source it.
- `FOLDER` must point at the repo: `install` and `pg-list` use `$FOLDER` absolutely.
- `run-util`/`github-sync`/`gitlab-sync` use relative paths — run them from the repo root.
- Conf holds image tags, fixed container IPs (172.23.0.0/24), and GITHUB_*/GITLAB_* repo lists for sync. It defines consul/loki/tempo tags, but there are no `docker/` dirs for those.

## Docker Services

`docker/{service}/build.sh` creates a container on `br0` with a fixed IP from `lazyenv.conf` (postgres 172.23.0.102, mysql 172.23.0.108, mongo 172.23.0.107, redis 172.23.0.109). Only postgres, mysql, mongo have `update.sh`. `br0` must exist first: `./lazyenv docker-net`.

- postgres/mysql use hardcoded root password `example` and create `lazyenv_demo` DB from `demo.sql`.
- postgres/mysql mount `dump/` to container `/dump`; mongo does NOT (its `mongodump.sh` writes to `/data/db/dump/` inside the container).
- mongo and kafka also ship `docker-compose.yml`; nodejs has `run.sh` + `server.mjs`.

## DB Dump/Restore Flow

- `docker exec -d` runs dump/restore scripts detached inside the container; progress is only visible via `pg-log`/`mysql-log` (tail `/dump/dump.log`).
- `pg-copy` / `make sync-dump` need `sudo` (raw `sudo cp`).
- Postgres also copies `.psqlrc`, `.pgpass`, and `scripts/` into the container on build.

## Gotchas

- `make run-util` target is broken (cds to `utils/install`, which doesn't exist); use the CLI instead.
- `*.dump`, `*.sql`, `*.sql.gz`, `*.log` are gitignored — pg_dump/ dumps and container dump dirs are local-only.
