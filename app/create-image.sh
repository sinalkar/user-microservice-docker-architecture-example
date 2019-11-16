#!/usr/bin/env bash

docker rm -f user-service | true

docker rmi -f user-service | true

docker image prune -a | true

docker volume prune --force | true

docker build -t user-service .
