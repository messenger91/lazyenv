SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
CONTAINER_ID=$(docker ps -aqf "name=postgres")

docker cp $SCRIPT_DIR/pg_dump.sh $CONTAINER_ID:/pg_dump.sh
docker cp $SCRIPT_DIR/pg_restore.sh $CONTAINER_ID:/pg_restore.sh
