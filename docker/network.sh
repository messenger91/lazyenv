docker network create --driver bridge --subnet=172.23.0.0/24 br0
docker network create --driver bridge --subnet=172.23.1.0/24 nginx
docker network create --driver bridge --subnet=172.23.2.0/24 postgres
docker network create --driver bridge --subnet=172.23.3.0/24 mongo
docker network create --driver bridge --subnet=172.23.4.0/24 redis
docker network create --driver bridge --subnet=172.23.5.0/24 elastic
docker network create --driver bridge --subnet=172.23.6.0/24 kafka
docker network create --driver bridge --subnet=172.23.7.0/24 rabbitmq
