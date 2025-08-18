DATABASE=${1:-postgres}
FILE=${2:-dump.sql}

dropdb -U postgres "$DATABASE"
createdb -U postgres "$DATABASE"
psql -h 127.0.0.1 -d $DATABASE -U postgres -f /dump/$FILE
