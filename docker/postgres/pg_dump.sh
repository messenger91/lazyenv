TIMESTAMP=$(date '+%Y%m%d%H%M%S')
DATABASE=${1:-postgres}
HOST=127.0.0.1
PORT=5432
USER=postgres

FILE=$DATABASE\_$TIMESTAMP.dump
pg_dump -Fc --dbname=$DATABASE -U $USER -h $HOST -p $PORT -w -f /dump/$FILE
echo "$FILE"