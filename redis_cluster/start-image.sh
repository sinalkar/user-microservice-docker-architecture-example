#!/usr/bin/env bash

#docker run -it -p 80:80 -v /mnt/logs:/logs --env-file=env --add-host=eshost208.myjipl.com:183.87.38.208 --add-host=eshost209.myjipl.com:183.87.38.209 --add-host=eshost210.myjipl.com:183.87.38.210  user-service

docker run -it -v /mnt/data:/data -v /mnt/logs:/logs -p 7000:7000 -p 7001:7001 -p 7002:7002 -p 7003:7003 -p 7004:7004 -p 7005:7005 -p 7006:7006 -p 7007:7007 user-service-redis-cluster
