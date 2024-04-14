SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../.env"

docker run -d \
    --name rabbitmq \
    --network rabbitmq \
    -p 15672:15672 \
        rabbitmq:$DOCKER_RABBITMQ_TAG