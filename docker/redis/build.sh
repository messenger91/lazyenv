SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../.env"

docker run -d \
    --name redis \
    --memory=128M \
    --network br0 \
    --ip $DOCKER_CONTAINER_REDIS_IP \
    -p 6379:6379 \
        redis:$DOCKER_IMAGE_REDIS_TAG