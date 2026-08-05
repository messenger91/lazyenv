#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
CONTAINER_ID=$(docker ps -aqf "name=mysql")

docker cp $SCRIPT_DIR/mysql_dump.sh $CONTAINER_ID:/mysql_dump.sh
docker cp $SCRIPT_DIR/mysql_restore.sh $CONTAINER_ID:/mysql_restore.sh
docker cp $SCRIPT_DIR/.my.cnf $CONTAINER_ID:/root/.my.cnf
docker exec -d mysql chmod 0600 /root/.my.cnf
