
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../.env"

docker run -d \
    --name redis \
    --network redis \
    --ip 172.23.4.254 \
    -p 6379:6379 \
        redis:$DOCKER_IMAGE_REDIS_TAG


CONTAINER_ID=$(docker ps -aqf "name=redis")

