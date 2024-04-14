
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../.env"

docker run -d \
    --name postgres \
    --network postgres \
    -e POSTGRES_PASSWORD=example \
	-e PGDATA=/var/lib/postgresql/data/pgdata \
	-v ${SCRIPT_DIR}/pgdata:/var/lib/postgresql/data \
    -p 5432:5432 \
        postgres:$DOCKER_POSTGRES_TAG


CONTAINER_ID=$(docker ps -aqf "name=postgres")

docker cp $PWD/pg_dump.sh $CONTAINER_ID:/pg_dump.sh
docker cp $PWD/pg_restore.sh $CONTAINER_ID:/pg_restore.sh
