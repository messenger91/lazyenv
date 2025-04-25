
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../.env"

docker run -d \
    --name pg_dump \
    --network host \
    -p 5432:5432 \
    -e POSTGRES_PASSWORD=example \
	-v ${SCRIPT_DIR}/dump:/dump \
        postgres:$DOCKER_IMAGE_POSTGRES_TAG

docker run -d \
    --name postgres \
    --network postgres \
    --ip 172.23.2.254 \
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
