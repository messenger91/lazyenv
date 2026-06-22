DATABASE=${1:-postgres}
FILE=${2:-dump.sql}
HOST=127.0.0.1
PORT=5432
USER=postgres
PASSWORD=example

dropdb -U postgres "$DATABASE"
createdb -U postgres "$DATABASE"
psql -h $HOST -p $PORT -d $DATABASE -U $USER -w -f /dump/$FILE

echo "Database $DATABASE restored from $FILE" 