#!/usr/bin/env bash

## Remove unused Images
docker image prune -a && docker volume prune --force

# # Stop all containers
docker-compose rm --all --force && docker-compose build --no-cache && docker-compose up --force-recreate 