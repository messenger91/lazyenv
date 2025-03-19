source "$(pwd)/../../.env"

docker run -d \
    --name redis \
    --network redis \
    --ip 172.23.4.254 \
    -p 6379:6379 \
        redis:$DOCKER_IMAGE_REDIS_TAG
