#!/bin/bash
DATABASE=${1:-mysql}
FILE=${2:-dump.sql}

mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$DATABASE" < /dump/$FILE 2>/dev/null || \
mysql -u root -p example "$DATABASE" < /dump/$FILE
