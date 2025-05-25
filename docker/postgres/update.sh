SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
CONTAINER_ID=$(docker ps -aqf "name=postgres")

docker cp $SCRIPT_DIR/pg_dump.sh $CONTAINER_ID:/pg_dump.sh
docker cp $SCRIPT_DIR/pg_restore.sh $CONTAINER_ID:/pg_restore.sh
docker cp $SCRIPT_DIR/psql_restore.sh $CONTAINER_ID:/psql_restore.sh
docker cp $SCRIPT_DIR/.psqlrc $CONTAINER_ID:/root/.psqlrc
docker cp $SCRIPT_DIR/scripts $CONTAINER_ID:/root
docker cp $SCRIPT_DIR/.pgpass $CONTAINER_ID:/root/.pgpass