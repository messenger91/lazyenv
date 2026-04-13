SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../.env"

docker run -d \
    --name kafka \
    --network br0 \
    --ip $DOCKER_CONTAINER_KAFKA_IP \
    -p 9092:9092 \
    -p 9093:9093 \
        apache/kafka:$DOCKER_IMAGE_KAFKA_TAG