SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../.env"

docker run -d \
    --name mongo \
    --network br0 \
    --memory=384M \
    --ip $DOCKER_CONTAINER_MONGO_IP \
    -v ${SCRIPT_DIR}/data/db:/data/db \
    -p 27017:27017 \
        mongo:$DOCKER_IMAGE_MONGO_TAG

CONTAINER_ID=$(docker ps -aqf "name=mongo")

docker cp $SCRIPT_DIR/mongodump.sh $CONTAINER_ID:/mongodump.sh
docker cp $SCRIPT_DIR/mongorestore.sh $CONTAINER_ID:/mongorestore.sh
