#!/bin/sh

echo "Stop Loterioma Builder"
docker-compose down

cd ../

echo "Stop Loterioma Engine"
cd loterioma-engine 
docker-compose down
cd ..

echo "Stop Loterioma RNG"
cd loterioma-rng
docker-compose down
cd ..

echo "Stop Loterioma Core"
cd loterioma-core
docker-compose down
cd ..

echo "Stop Loterioma Lobby"
cd loterioma-lobby
docker-compose down
cd ..

echo "Stop Loterioma Manager"
cd loterioma-manager
docker-compose down
cd ..

echo "Stop Loterioma Engineer"
cd loterioma-engineer
docker-compose down
cd ..

### OPTIONAL COMPONENTS

echo "Stop Loterioma Game Debugger"
cd loterioma-game-debugger
docker-compose down
cd ..

echo "Stop Loterioma Client Basic"
cd loterioma-client-basic
docker-compose down
cd ..

#echo "Stop Loterioma Game Certifier"
#cd loterioma-game-certifier
#docker-compose down
#cd ..

echo "All components stopped"

echo "Remove Network"
docker network prune --force
