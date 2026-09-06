TIMESTAMP=$(date '+%Y%m%d%H%M%S')
DATABASE=${1:-postgres}
HOST=${2:-127.0.0.1}
PORT=${3:-5432}
USER=${4:-postgres}
PASSWORD=${5:-}

FILE=$DATABASE\_$TIMESTAMP.dump

if [ -n "$PASSWORD" ]; then
    export PGPASSWORD="$PASSWORD"
fi

START=$(date +%s)
pg_dump -Fc --dbname=$DATABASE -U $USER -h $HOST -p $PORT -w -f /dump/$FILE
EXIT_CODE=$?
END=$(date +%s)

ELAPSED=$((END - START))
MINS=$((ELAPSED / 60))
SECS=$((ELAPSED % 60))
TIMER=$(printf "%d:%02d" $MINS $SECS)

if [ $EXIT_CODE -eq 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') [OK] $FILE ${TIMER}" >> /dump/dump.log
    echo "Dump completed: $FILE (${TIMER})"
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') [FAIL] $DATABASE (exit $EXIT_CODE) ${TIMER}" >> /dump/dump.log
    echo "Dump failed: $DATABASE (${TIMER})"
fi