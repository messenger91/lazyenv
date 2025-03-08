DATABASE=${1:-postgres}
FILE=${2:-dump.sql}

psql -h 127.0.0.1 -d $DATABASE -U postgres -f /dump/$FILE
