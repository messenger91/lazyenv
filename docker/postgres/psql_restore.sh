DATABASE=${1:-postgres}
FILE=${2:-dump.sql}
HOST=127.0.0.1
PORT=5432
USER=postgres
PASSWORD=example

START=$(date +%s)
dropdb -U postgres "$DATABASE"
createdb -U postgres "$DATABASE"
psql -h $HOST -p $PORT -d $DATABASE -U $USER -w -f /dump/$FILE
EXIT_CODE=$?
END=$(date +%s)

ELAPSED=$((END - START))
MINS=$((ELAPSED / 60))
SECS=$((ELAPSED % 60))
TIMER=$(printf "%d:%02d" $MINS $SECS)

if [ $EXIT_CODE -eq 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') [OK] psql restore $FILE -> $DATABASE ${TIMER}" >> /dump/restore.log
    echo "Restore completed: $DATABASE from $FILE (${TIMER})"
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') [FAIL] psql restore $FILE -> $DATABASE (exit $EXIT_CODE) ${TIMER}" >> /dump/restore.log
    echo "Restore failed: $DATABASE from $FILE (${TIMER})"
fi 