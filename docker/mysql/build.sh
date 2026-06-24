#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../lazyenv.conf"

docker run -d \
    --name mysql \
    --memory=1G \
    --network br0 \
    --ip $DOCKER_CONTAINER_MYSQL_IP \
    -e MYSQL_ROOT_PASSWORD=example \
    -v ${SCRIPT_DIR}/data:/var/lib/mysql \
    -v ${SCRIPT_DIR}/dump:/dump \
    -p 3306:3306 \
        mysql:$DOCKER_IMAGE_MYSQL_TAG

CONTAINER_ID=$(docker ps -aqf "name=mysql")

docker cp $PWD/mysql_dump.sh $CONTAINER_ID:/mysql_dump.sh
docker cp $PWD/mysql_restore.sh $CONTAINER_ID:/mysql_restore.sh

echo "Waiting for mysql to be ready..."
until docker exec mysql mysqladmin ping -u root -p example --silent 2>/dev/null; do
    sleep 2
done

echo "Creating demo database..."
docker exec mysql mysql -u root -p example -e "CREATE DATABASE IF NOT EXISTS lazyenv_demo"

echo "Loading demo data..."
docker exec -i mysql mysql -u root -p example lazyenv_demo < $PWD/demo.sql
