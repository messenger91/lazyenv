#!/bin/bash

# by default fallback for postges tunnel
HOST=${1}
USER=${2:-root}
PORT=${3:-5432}
IP=${4:-127.0.0.1}
LOCAL_PORT=${5:-$((PORT+1))}

kill -9 $(lsof -t -i tcp:$LOCAL_PORT)
ssh -f -N -L localhost:$LOCAL_PORT:$IP:$PORT $USER@$HOST
echo "SSH TUNNEL ESTABLISHED: localhost:$LOCAL_PORT:$IP:$PORT $USER@$HOST"