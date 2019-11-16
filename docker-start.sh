#!/usr/bin/env bash

rm -Rf /mnt/logs/*

rm -Rf /mnt/data/redis-data/**/*.aof

rm -Rf /mnt/data/redis-data/**/nodes.conf

rm -Rf /mnt/data/redis-data/**/nodes.conf


docker-compose build
docker-compose up