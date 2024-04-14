# Makefile
env-prepare:
	cp -n .env.example .env

create-net:
	cd docker && bash network.sh

build-container:
	cd docker/${NAME} && bash build.sh

update-container:
	cd docker/${NAME} && bash update.sh

postgres-dump:
	docker exec -d postgres bash pg_dump.sh ${DATABASE}

postgres-restore:
	docker exec -d postgres bash pg_restore.sh ${DATABASE} ${TIMESTAMP}

mongodump:
	docker exec -d mongo bash mongodump.sh ${DATABASE}

mongorestore:
	docker exec -d mongo bash mongorestore.sh ${DATABASE} ${TIMESTAMP}