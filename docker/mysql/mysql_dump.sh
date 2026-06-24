#!/bin/bash
DATABASE=${1:-mysql}
TIMESTAMP=$(date '+%Y%m%d%H%M%S')
FILE_SQL=$DATABASE-$TIMESTAMP.sql
FILE=$FILE_SQL.gz

START=$(date +%s)
mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" "$DATABASE" --single-transaction 2>/dev/null > /dump/$FILE_SQL
DUMP_EXIT=$?

if [ $DUMP_EXIT -eq 0 ] && [ -s /dump/$FILE_SQL ]; then
    gzip /dump/$FILE_SQL
    EXIT_CODE=$?
else
    EXIT_CODE=$DUMP_EXIT
fi
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
