DATABASE=${1:-postgres}
FILE=${2:-postgres.dump}

dropdb -U postgres "$DATABASE"
createdb -U postgres "$DATABASE"
pg_restore -h 127.0.0.1 -p 5432 -U postgres --dbname=$DATABASE -w /dump/$FILE.dump
