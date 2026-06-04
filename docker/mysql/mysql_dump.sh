#!/bin/bash
DATABASE=${1:-mysql}
TIMESTAMP=$(date '+%Y%m%d%H%M%S')

mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" --all-databases --single-transaction > /dump/$DATABASE-$TIMESTAMP.sql 2>/dev/null || \
mysqldump -u root -p example --all-databases --single-transaction > /dump/$DATABASE-$TIMESTAMP.sql
