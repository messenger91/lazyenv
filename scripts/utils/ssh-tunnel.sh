#!/bin/bash

HOST=${1:-localhost}
USER=${2:-root}
PORT=${3:-5433}

SERVER=$USER@$HOST

kill -9 $(lsof -t -i tcp:$PORT)
ssh -f -N -L localhost:$PORT:$HOST:5432 $SERVER
echo "SSH TUNNEL ESTABLISHED: PORT $PORT SERVER $SERVER"