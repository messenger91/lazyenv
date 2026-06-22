DATABASE=${1:-postgres}
FILE=${2:-postgres.dump}
HOST=127.0.0.1
PORT=5432
USER=postgres
PASSWORD=example

pg_restore -h $HOST -p $PORT -U $USER -d $DATABASE -w /dump/$FILE
echo "$DATABASE restored from $FILE"