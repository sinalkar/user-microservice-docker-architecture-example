#!/usr/bin/env bash

docker run -d -v /mnt/logs:/logs -p 80:80 --hostname=loadbalancer.techvit.com user-load-balancer