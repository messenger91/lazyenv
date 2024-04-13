DATABASE=${1:-postgres}
TIMESTAMP=${2:-postgres}

pg_restore -h 127.0.0.1 -p 5432 -U postgres --dbname=$DATABASE -w /var/lib/postgresql/data/dump/$DATABASE-$TIMESTAMP.dump
