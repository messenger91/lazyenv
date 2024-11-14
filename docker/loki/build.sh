SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../.env"

docker run -d \
    --name loki \
    --network loki \
    --ip 172.23.11.3 \
    -p 3100:3100  \
    -v "$SCRIPT_DIR/mnt/config:/mnt/config" \
        grafana/loki:$DOCKER_IMAGE_LOKI_TAG -config.file=/mnt/config/loki-config.yaml
   


docker run -d \
    --name grafana \
    --network loki \
    --ip 172.23.11.2 \
    -e GF_PATHS_PROVISIONING=/etc/grafana/provisioning \
    -e GF_AUTH_ANONYMOUS_ENABLED=true \
    -e GF_AUTH_ANONYMOUS_ORG_ROLE=Admin \
    -v "$SCRIPT_DIR/grafana/provisioning/datasources:/etc/grafana/provisioning/datasources" \
    -p 3000:3000 \
        grafana/grafana:$DOCKER_IMAGE_GRAFANA_TAG