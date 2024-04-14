SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
CONTAINER_ID=$(docker ps -aqf "name=mongo")

docker cp $SCRIPT_DIR/mongodump.sh $CONTAINER_ID:/mongodump.sh
docker cp $SCRIPT_DIR/mongorestore.sh $CONTAINER_ID:/mongorestore.sh
