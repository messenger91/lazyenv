#!/bin/bash

ENV=${1:-local}
HOST=localhost
PORT=5101
DB_USER=user
DB_DATABASE=db

file=$(date '+%Y%m%d%H%M%S.dump')

if [[ $ENV = "dev" ]]; then
    # DEV DB SSH TUNNEL
    ./db-ssh.sh $ENV
    PORT=5102
fi

if [[ $ENV = "prod" ]]; then
    # PROD DB SSH TUNNEL
    ./db-ssh.sh $ENV
    PORT=5103
fi

pg_dump -Fc --dbname=$DB_DATABASE -U $DB_USER -h $HOST -p $PORT -w -f dump/$ENV/$file 