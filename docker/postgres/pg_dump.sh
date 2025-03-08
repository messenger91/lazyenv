DATABASE=${1:-postgres}
TIMESTAMP=$(date '+%Y%m%d%H%M%S')

pg_dump -Fc --dbname=$DATABASE -U postgres -h 127.0.0.1 -p 5432 -w -f /dump/$DATABASE-$TIMESTAMP.dump
