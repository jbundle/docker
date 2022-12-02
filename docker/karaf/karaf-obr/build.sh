#!/bin/bash

docker build -t tourgeek/karaf-obr:latest .

docker stop karaf-obr
docker rm karaf-obr

docker run -d --name karaf-obr tourgeek/karaf-obr:latest
sleep 5
docker exec -t karaf-obr sed -i 's/\#karaf/karaf/g' ./opt/apache-karaf-4.2.16/etc/users.properties
docker exec -t karaf-obr sed -i 's/\#_g_/_g_/g' ./opt/apache-karaf-4.2.16/etc/users.properties
sleep 15
docker exec -t karaf-obr client feature:install http obr war
sleep 5
docker exec -t karaf-obr stop
sleep 5

docker commit karaf-obr tourgeek/karaf-obr
docker tag tourgeek/karaf-obr:latest tourgeek/karaf-obr:4.2.16
#docker push
