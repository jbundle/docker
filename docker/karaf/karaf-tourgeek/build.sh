#!/bin/bash

docker build -t tourgeek/karaf-tourgeek:latest .
docker tag tourgeek/karaf-tourgeek:latest tourgeek/karaf-tourgeek:4.2.12
#docker push