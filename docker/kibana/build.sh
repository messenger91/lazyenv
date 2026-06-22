SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../lazyenv.conf"

docker run -d \
  --name kibana \
  --network br0 \
  --ip $DOCKER_CONTAINER_KIBANA_IP \
  -p 5601:5601 \
  kibana:$DOCKER_IMAGE_KIBANA_TAG