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

echo "Stop Loterioma Game Debugger"
cd loterioma-game-debugger
docker-compose down
cd ..

echo "All components stopped"

echo "Remove Network"
docker network prune --force
