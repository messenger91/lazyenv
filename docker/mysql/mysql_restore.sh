#!/bin/bash
DATABASE=${1:-mysql}
FILE=${2:-dump.sql}

START=$(date +%s)
mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$DATABASE" < /dump/$FILE 2>/dev/null || \
mysql -u root -p example "$DATABASE" < /dump/$FILE
EXIT_CODE=$?
END=$(date +%s)

ELAPSED=$((END - START))
MINS=$((ELAPSED / 60))
SECS=$((ELAPSED % 60))
TIMER=$(printf "%d:%02d" $MINS $SECS)

if [ $EXIT_CODE -eq 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') [OK] restore $FILE -> $DATABASE ${TIMER}" >> /dump/restore.log
    echo "Restore completed: $DATABASE from $FILE (${TIMER})"
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') [FAIL] restore $FILE -> $DATABASE (exit $EXIT_CODE) ${TIMER}" >> /dump/restore.log
    echo "Restore failed: $DATABASE from $FILE (${TIMER})"
fi
