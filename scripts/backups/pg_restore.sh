#!/bin/bash

#FILE_PATH="/home/user/dump/dev/20211107001439.dump"
FILE_PATH=${1:-''}
HOST=localhost
PORT=5101
DB_USER=user
DB_DATABASE=db

pg_restore -h $HOST -p $PORT --dbname=$DB_DATABASE --username=$DB_USER -w $FILE