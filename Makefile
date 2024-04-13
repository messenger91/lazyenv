# Makefile


env-prepare:
	cp -n .env.example .env


create-net:
	cd docker && bash network.sh


build-container:
	cd docker/${NAME} && bash build.sh


postgres-dump:
	docker exec -d postgres bash pg_dump.sh ${DATABASE}


postgres-restore:
	docker exec -d postgres bash pg_restore.sh ${DATABASE} ${TIMESTAMP}