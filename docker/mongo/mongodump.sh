DATABASE=${1:-local}
TIMESTAMP=$(date '+%Y%m%d%H%M%S')

mongodump --archive=/data/db/dump/dump-$DATABASE-$TIMESTAMP.gz --gzip --db $DATABASE
