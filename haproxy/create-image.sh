#!/usr/bin/env bash

docker rm -f user-load-balancer | true

docker rmi -f user-load-balancer | true

docker image prune | true

docker volume prune | true

docker build -t user-load-balancer .
