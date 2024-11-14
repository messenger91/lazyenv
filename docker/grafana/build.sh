SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../.env"

docker run -d \
    --name grafana \
    --network grafana \
    --ip 172.23.11.2 \
    -p 3000:3000  \
        grafana/grafana:$DOCKER_IMAGE_GRAFANA_TAG