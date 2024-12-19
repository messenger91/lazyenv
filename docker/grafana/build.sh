SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../.env"

docker run -d \
    --name grafana \
    --network grafana \
    --ip 172.23.11.254 \
    -e GF_PATHS_PROVISIONING=/etc/grafana/provisioning \
    -e GF_AUTH_ANONYMOUS_ENABLED=true \
    -e GF_AUTH_ANONYMOUS_ORG_ROLE=Admin \
    -v "$SCRIPT_DIR/provisioning/datasources:/etc/grafana/provisioning/datasources" \
    -p 3000:3000 \
        grafana/grafana:$DOCKER_IMAGE_GRAFANA_TAG

docker run -d \
    --name loki \
    --network grafana \
    --ip 172.23.11.253 \
    -p 3100:3100  \
    -v "$SCRIPT_DIR/mnt/config:/mnt/config" \
        grafana/loki:$DOCKER_IMAGE_LOKI_TAG -config.file=/mnt/config/loki-config.yaml
   
docker run -d \
    --name tempo \
    --network grafana \
    --ip 172.23.11.252 \
    --user root \
    --log-opt max-size=5m \
    -p 3200:3200  \
    -p 14268:14268 \
    -v "$SCRIPT_DIR/mnt/config/tempo-config.yaml:/etc/tempo.yaml" \
    -v "$SCRIPT_DIR/tempo-data:/var/tempo" \
        grafana/tempo:$DOCKER_IMAGE_TEMPO_TAG -config.file=/etc/tempo.yaml
   



