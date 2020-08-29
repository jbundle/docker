#!/bin/bash

docker build -t tourgeek/karaf:latest .
docker tag tourgeek/karaf:latest tourgeek/karaf:4.2.9
#docker push