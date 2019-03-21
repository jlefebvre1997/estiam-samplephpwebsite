#!/bin/bash

# Let's stop all docker containers running on port 8081, since we need this one for nginx
docker stop $(docker ps | grep 0.0.0.0:8081 | awk '{print $1}')

docker-compose down --remove-orphans
docker-compose build && docker-compose up -d

# At this point, the project is available at localhost:8081, so let's open it
xdg-open http://localhost:8081 &
