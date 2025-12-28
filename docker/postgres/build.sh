
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../lazyenv.config"

docker run -d \
    --name postgres \
    --memory=256M \
    --network br0 \
    --ip $DOCKER_CONTAINER_POSTGRES_IP \
    -e POSTGRES_PASSWORD=example \
	-e PGDATA=/var/lib/postgresql/data/pgdata \
    -v ${SCRIPT_DIR}/pgdata:/var/lib/postgresql/data \
	-v ${SCRIPT_DIR}/dump:/dump \
    -p 5432:5432 \
        postgres:$DOCKER_IMAGE_POSTGRES_TAG

CONTAINER_ID=$(docker ps -aqf "name=postgres")

docker cp $PWD/pg_dump.sh $CONTAINER_ID:/pg_dump.sh
docker cp $PWD/pg_restore.sh $CONTAINER_ID:/pg_restore.sh
docker cp $PWD/psql_restore.sh $CONTAINER_ID:/psql_restore.sh
docker cp $PWD/.psqlrc $CONTAINER_ID:/root/.psqlrc
docker cp $PWD/scripts $CONTAINER_ID:/root
docker cp $PWD/.pgpass $CONTAINER_ID:/root/.pgpass

# docker run -d \
#     --network host \
#     --name libpg \
#     -e POSTGRES_PASSWORD=example \
# 	-v ${SCRIPT_DIR}/dump:/dump \
#         postgres:$DOCKER_IMAGE_POSTGRES_TAG

# CONTAINER_ID=$(docker ps -aqf "name=libpg")

# docker cp $PWD/pg_dump.sh $CONTAINER_ID:/pg_dump.sh
# docker cp $PWD/pg_restore.sh $CONTAINER_ID:/pg_restore.sh
# docker cp $PWD/psql_restore.sh $CONTAINER_ID:/psql_restore.sh
# docker cp $PWD/.psqlrc $CONTAINER_ID:/root/.psqlrc
# docker cp $PWD/.pgpass $CONTAINER_ID:/root/.pgpass
