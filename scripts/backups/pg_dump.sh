#!/bin/bash

HOST=localhost
PORT=5432
DB_USER=postgres
DB_DATABASE=postgres

filename=${1:-unnamed}
timestamp=$(date '+%Y%m%d%H%M%S')

pg_dump -Fc --dbname=$DB_DATABASE -U $DB_USER -h $HOST -p $PORT -w -f dump/$ENV/$timestamp.dump