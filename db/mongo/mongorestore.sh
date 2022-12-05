echo "[MONGO] Start mongorestore"
docker exec mongo mongorestore --uri 'mongodb://root:example@localhost:27017'
echo "[MONGO] End mongorestore"