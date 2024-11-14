SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../.env"

docker run -d \
    --name loki \
    --network grafana \
    --ip 172.23.11.3 \
    -p 3100:3100  \
        grafana/loki:$DOCKER_IMAGE_LOKI_TAG