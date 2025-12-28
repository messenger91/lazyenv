#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../lazyenv.config"

DATABASE=${1:-postgres}
TIMESTAMP=$(date '+%Y%m%d%H%M%S')

FILENAME=stage-$DATABASE-$TIMESTAMP.sql

kubectl exec -it stage-postgresql-master-0 -n postgresql -- /bin/bash -c "$KUBE_PG_DUMP_CMD" > $SCRIPT_DIR/../../pg_dump/stage-$DATABASE-$TIMESTAMP.sql