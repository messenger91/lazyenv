# Makefile
env-prepare:
	cp -n .env.example .env

create-net:
	cd docker && bash network.sh

build-container:
	cd docker/${name} && bash build.sh

update-container:
	cd docker/${name} && bash update.sh

postgres-dump:
	docker exec -d postgres bash pg_dump.sh ${db}

postgres-restore:
	docker exec -d postgres bash pg_restore.sh ${db} ${date}

mongodump:
	docker exec -d mongo bash mongodump.sh ${db}

mongorestore:
	docker exec -d mongo bash mongorestore.sh ${db} ${date}

sync-github:
	cd scripts/utils && bash github-repos.sh