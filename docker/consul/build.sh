SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../.env"

docker run -d \
    --name consul \
    --network consul \
    --ip 172.23.10.254 \
    -p 8500:8500  \
        consul:1.15.4