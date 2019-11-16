#!/usr/bin/env bash

docker rm -f user-service-redis | true

docker rmi user-service-redis | true

docker image prune | true

docker volume prune | true

docker build -t user-service-redis .
