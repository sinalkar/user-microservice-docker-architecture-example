#!/usr/bin/env bash

#docker run -it -p 80:80 -v /mnt/logs:/logs --env-file=env --add-host=eshost208.myjipl.com:183.87.38.208 --add-host=eshost209.myjipl.com:183.87.38.209 --add-host=eshost210.myjipl.com:183.87.38.210  user-service

docker run -d -v /mnt/data:/data -v /mnt/logs:/logs -p 6380:6380 user-service-redis
