SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../.env"

docker run -d \
    --name nats \
    --network nats \
    --ip 172.23.8.254 \
    -p 4222:4222  \
    -v ${SCRIPT_DIR}/nats-server.conf:/etc/nats/nats-server.conf \
    -p 8222:8222  \
        nats:$DOCKER_IMAGE_NATS_TAG \
    -c /etc/nats/nats-server.conf \
    --http_port 8222