# Makefile
test:
	echo "OK"

env-prepare:
	cp -n .env.example .env

install:
	cd scripts/install && bash ${name}.sh

create-net:
	cd docker && bash network.sh

docker-container-ip:
	docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}; {{end}}' ${container}

docker-container-build:
	cd docker/${name} && bash build.sh

docker-container-update:
	cd docker/${name} && bash update.sh

postgres-dump:
	docker exec -d postgres bash pg_dump.sh ${db}

postgres-restore:
	docker exec -d postgres bash pg_restore.sh ${db} ${file}

psql-restore:
	docker exec -d postgres bash psql_restore.sh ${db} ${file}

mongodump:
	docker exec -d mongo bash mongodump.sh ${db}

mongorestore:
	docker exec -d mongo bash mongorestore.sh ${db} ${date}

github-sync:
	cd scripts/utils && bash github-repos.sh