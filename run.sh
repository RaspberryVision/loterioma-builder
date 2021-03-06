#!/bin/sh

echo "Start Loterioma network"
echo "***********************"

echo "Run Loterioma Builder"
docker-compose down
docker-compose up -d --build

echo "Move to root RV directory"
cd ../

echo "Run Loterioma Engineer"
cd loterioma-engineer 
docker-compose down
docker-compose up -d --build
cd ..

echo "Run Loterioma DataStore"
cd loterioma-datastore
docker-compose down
docker-compose up -d --build
cd ..

echo "Run Loterioma Core"
cd loterioma-core
docker-compose down
docker-compose up -d --build
cd ..

echo "Run Loterioma Engine"
cd loterioma-engine
docker-compose down
docker-compose up -d --build
cd ..

echo "Run Loterioma RNG"
cd loterioma-rng
docker-compose down
docker-compose up -d --build
cd ..

echo "Run Loterioma Manager"
cd loterioma-manager
docker-compose down
docker-compose up -d --build
cd ..

echo "Run Loterioma Lobby"
cd loterioma-lobby
docker-compose down
docker-compose up -d --build
cd ..

# OPTIONAL CONTAINERS

echo "Run Loterioma Game Debugger"
cd loterioma-game-debugger
docker-compose down
docker-compose up -d --build
cd ..

echo "Run Loterioma Client Basic"
cd loterioma-client-basic
docker-compose down
docker-compose up -d --build
cd ..

echo "Run Loterioma Game Certifier"
cd loterioma-game-certifier
docker-compose down
docker-compose up -d --build
cd ..

echo "All components starts, waiting 30 seconds..."
sleep 30

echo "Checking components status"
echo "**************************"

echo "Ping Loterioma DataStore (http://localhost:80)"
nc -zvw3 localhost 80
if [ $? -ne 0 ]
then
  echo "** ERROR ** | Loterioma DataStore status failed."
  exit 0
else
  echo "** SUCCESS ** | Loterioma DataStore."
fi

echo "Ping Loterioma Builder (http://localhost:9904)"
nc -zvw3 localhost 9904
if [ $? -ne 0 ]
then
  echo "** ERROR ** | Loterioma Builder status failed."
  exit 0
else
  echo "** SUCCESS ** | Loterioma Builder."		
fi

echo "Ping Loterioma Engineer (http://localhost:9906)"
nc -zvw3 localhost 9906
if [ $? -ne 0 ]
then
   echo "** ERROR ** | Loterioma Engineer status failed."
   exit 0
else
   echo "** SUCCESS ** | Loterioma Engineer."			
fi

echo "Ping Loterioma Core (http://localhost:9907)"
nc -zvw3 localhost 9907
if [ $? -ne 0 ]
then
    echo "** ERROR ** | Loterioma Core status failed."
    exit 0
else
    echo "** SUCCESS ** | Loterioma Core."
fi

echo "Ping Loterioma Engine (http://localhost:9902)"
nc -zvw3 localhost 9902
if [ $? -ne 0 ]
then
   echo "** ERROR ** | Loterioma Engine status failed."
   exit 0	
else
   echo "** SUCCESS ** | Loterioma Engine."		
fi

echo "Ping Loterioma RNG (http://localhost:9901)"
nc -zvw3 localhost 9901
if [ $? -ne 0 ]	
then
    echo "** ERROR ** | Loterioma RNG status failed."
    exit 0
else
    echo "** SUCCESS ** | Loterioma RNG."			
fi

echo "Ping Loterioma Lobby (http://localhost:9909)"
nc -zvw3 localhost 9909
if [ $? -ne 0 ]
then
    echo "** ERROR ** | Loterioma Lobby status failed."
    exit 0
else
    echo "** SUCCESS ** | Loterioma Lobby."
fi

echo "Ping Loterioma Manager (http://localhost:9910)"
nc -zvw3 localhost 9910
if [ $? -ne 0 ]
then
    echo "** ERROR ** | Loterioma Manager status failed."
    exit 0
else
    echo "** SUCCESS ** | Loterioma Manager."
fi

echo "Ping Loterioma Game Debugger (http://localhost:9903)"
nc -zvw3 localhost 9903
if [ $? -ne 0 ]
then 
    echo "** ERROR ** | Loterioma Game Debugger status failed."
    exit 0	
else
    echo "** SUCCESS ** | Loterioma Game Debugger."			
fi

echo "Ping Loterioma Client Basic (http://localhost:9905)"
nc -zvw3 localhost 9905
if [ $? -ne 0 ]
then 
    echo "** ERROR ** | Loterioma Client Basic status failed."
    exit 0
else
    echo "** SUCCESS ** | Loterioma Client Basic."			
fi

#echo "Ping Loterioma Game Certifier (http://localhost:9908)"
#nc -zvw3 localhost 9908
#if [ $? -ne 0 ]
#then
#    echo "** ERROR ** | Loterioma Game Certifier status failed."
#    exit 0
#else
#    echo "** SUCCESS ** | Loterioma Game Certifier."
#fi

echo "Networks works properly! SUCCESS"

