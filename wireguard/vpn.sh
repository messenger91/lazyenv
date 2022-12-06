# Manage VPN by wg-quick
# Usage: wg-quick [ up | down | save | strip ] [ CONFIG_FILE | INTERFACE ]

COMMAND=${1:-up}
CONFIG_FILE=${2:-wg0}

echo $COMMAND
echo $CONFIG_FILE

sudo wg-quick ${COMMAND} ${CONFIG_FILE}