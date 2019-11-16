#!/usr/bin/env bash

docker rm -f user-service-mongodb | true

docker rmi -f user-service-mongodb | true

docker image prune | true

docker volume prune | true

docker build -t user-service-mongodb .
