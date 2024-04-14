DATABASE=${1:-local}
TIMESTAMP=${2:-20240404000000}

mongorestore --gzip --archive=/data/db/dump/dump-$DATABASE-$TIMESTAMP.gz --db $DATABASE