echo "[MONGO] Start mongodump"
docker exec mongo mongodump --uri 'mongodb://root:example@localhost:27017'
echo "[MONGO] End mongodump"