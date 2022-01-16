#!/bin/bash

# docker build -t tourgeek/karaf-obr:latest .

docker stop karaf-tourgeek
docker rm karaf-tourgeek

docker run -d --name karaf-tourgeek tourgeek/karaf-tourgeek:latest
sleep 15
docker exec -t karaf-tourgeek client shell:source mvn:org.jbundle.config/jbundle-artifacts//shell/setup
sleep 5
docker exec -t karaf-tourgeek stop
sleep 5

docker commit karaf-tourgeek tourgeek/karaf-tourgeek-cache
docker tag tourgeek/karaf-tourgeek-cache:latest tourgeek/karaf-tourgeek-cache:1.4.1
#docker push
