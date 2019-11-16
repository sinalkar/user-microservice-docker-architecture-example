#!/usr/bin/env bash

docker rm -f user-service-redis-cluster | true

docker rmi user-service-cluster | true

docker image prune | true

docker volume prune | true

docker build -t user-service-redis-cluster .
