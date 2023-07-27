echo "[MONGO] Start mongorestore"
docker exec bitnami_mongodb mongorestore --uri 'mongodb://root:example@localhost:27017'
echo "[MONGO] End mongorestore"