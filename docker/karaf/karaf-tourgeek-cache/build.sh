#!/bin/bash

# docker build -t tourgeek/karaf-obr:latest .

docker stop karaf-tourgeek
docker rm karaf-tourgeek

docker run -d --name karaf-tourgeek tourgeek/karaf-tourgeek:latest
sleep 15
docker exec -t karaf-tourgeek /opt/apache/karaf/bin/client shell:source mvn:org.jbundle.config/jbundle-artifacts//shell/setup
sleep 5
docker exec -t karaf-tourgeek /opt/apache/karaf/bin/stop
sleep 5

docker commit karaf-tourgeek tourgeek/karaf-tourgeek-cache
docker tag tourgeek/karaf-tourgeek-cache:latest tourgeek/karaf-tourgeek-cache:4.2.8
#docker push
