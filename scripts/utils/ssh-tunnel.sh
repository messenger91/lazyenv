#!/bin/bash

ENV=${1:-dev}
HOST=${2:-localhost}
SERVER=root@$HOST
PORT=${3:-7000}

if [[ $ENV = "prod" ]]; then
    # PROD settings SSH TUNNEL
    #
fi

kill -9 $(lsof -t -i tcp:$PORT)
ssh -f -N -L $HOST:$PORT:127.0.0.1:5432 $SERVER
echo "$ENV SSH TUNNEL ESTABLISHED: PORT $PORT SERVER $SERVER"