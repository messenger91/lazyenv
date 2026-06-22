SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../lazyenv.conf"

docker run -d \
    --name elasticsearch \
    --network br0 \
    --ip $DOCKER_CONTAINER_ELASTICSEARCH_IP \
    -p 9200:9200 \
    -p 9300:9300 \
    -e "discovery.type=single-node" \
    -e "xpack.security.enabled=false" \
        elasticsearch:$DOCKER_IMAGE_ELASTICSEARCH_TAG