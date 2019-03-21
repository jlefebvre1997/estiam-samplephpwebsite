#!/bin/bash

printf "\n\nFirst, let's check you've got all the branches ready on your local machine : \n\n"
git fetch

printf "\n\nLet's stop all containers so there'll be no port confusion\n\n"
docker stop $(docker container ls -q)

printf "\n\nLet's run jenkins now : "
docker-compose up -d

printf "\n\nOnce it's up, let's test the app through the other branches :)\n\n"
git checkout v1

docker-compose down --remove-orphans

docker-compose up -d

printf "\n\nThe app is now running on V1 on port 8081, I'll open it in your favorite browser for you !\n\n"
xdg-open http://localhost:8081 2>/dev/null

read -p "Well, then, press any key when you're ready to test V2" -n1 -s

docker-compose down --remove-orphans
git checkout v2

docker-compose up -d

printf "\n\nThe app is now running on V2 on port 8081, I'll open it in your favorite browser for you !\n\n"
xdg-open http://localhost:8081 2>/dev/null

read -p "Last, press any key when you're ready to test V3" -n1 -s

docker-compose down --remove-orphans
git checkout v3

docker-compose up -d

printf "\n\nThe app is now running on V3 on port 8081, I'll open it in your favorite browser for you !\n\n"
xdg-open http://localhost:8081 2>/dev/null

read -p "Press any key when you're done, and I'll stop the app ! To replay it from the beginning, just checkout to the branch called 'jenkins' and launch this script (./start.sh) again !"
docker-compose down --remove-orphans
