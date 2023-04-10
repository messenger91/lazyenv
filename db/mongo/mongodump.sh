echo "[MONGO] Start mongodump"
docker exec mongodb mongodump --uri 'mongodb://root:example@localhost:27017'
echo "[MONGO] End mongodump"
