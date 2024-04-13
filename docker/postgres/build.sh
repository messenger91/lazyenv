
echo ${PWD}
docker run -d \
    --name postgres \
    --network postgres \
    -e POSTGRES_PASSWORD=example \
	-e PGDATA=/var/lib/postgresql/data/pgdata \
	-v ${PWD}/pgdata:/var/lib/postgresql/data \
    -p 5432:5432 \
        postgres:16.2


CONTAINER_ID=$(docker ps -aqf "name=postgres")

docker cp $PWD/pg_dump.sh $CONTAINER_ID:/pg_dump.sh
docker cp $PWD/pg_restore.sh $CONTAINER_ID:/pg_restore.sh
