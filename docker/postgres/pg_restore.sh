DATABASE=${1:-postgres}
FILE=${2:-postgres.dump}

pg_restore -h 127.0.0.1 -p 5432 -U postgres --dbname=$DATABASE -w /dump/$FILE.dump
