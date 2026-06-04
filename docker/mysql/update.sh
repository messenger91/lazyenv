#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
CONTAINER_ID=$(docker ps -aqf "name=mysql")

docker cp $SCRIPT_DIR/mysql_dump.sh $CONTAINER_ID:/mysql_dump.sh
docker cp $SCRIPT_DIR/mysql_restore.sh $CONTAINER_ID:/mysql_restore.sh
