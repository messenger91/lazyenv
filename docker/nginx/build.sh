SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../lazyenv.config"

docker run -d \
    --name nginx \
    --network nginx \
    --ip 172.23.1.2 \
    -v "${SCRIPT_DIR}/usr/share/nginx/html:/usr/share/nginx/html" \
    -v "${SCRIPT_DIR}/etc/nginx/nginx.conf:/etc/nginx/nginx.conf:ro" \
    -p 8080:80 \
        nginx:$DOCKER_IMAGE_NGINX_TAG