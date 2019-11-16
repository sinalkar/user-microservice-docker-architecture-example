#!/usr/bin/env bash

docker run -d -p 81:80 -v /mnt/data:/data -v /mnt/logs:/logs --env-file=env --add-host=eshost208.myjipl.com:183.87.38.208 --add-host=eshost209.myjipl.com:183.87.38.209 --add-host=eshost210.myjipl.com:183.87.38.210 --hostname=user1.techvit.com  user-service
docker run -d -p 82:80 -v /mnt/data:/data -v /mnt/logs:/logs --env-file=env --add-host=eshost208.myjipl.com:183.87.38.208 --add-host=eshost209.myjipl.com:183.87.38.209 --add-host=eshost210.myjipl.com:183.87.38.210 --hostname=user2.techvit.com  user-service
docker run -d -p 83:80 -v /mnt/data:/data -v /mnt/logs:/logs --env-file=env --add-host=eshost208.myjipl.com:183.87.38.208 --add-host=eshost209.myjipl.com:183.87.38.209 --add-host=eshost210.myjipl.com:183.87.38.210 --hostname=user3.techvit.com  user-service
docker run -d -p 84:80 -v /mnt/data:/data -v /mnt/logs:/logs --env-file=env --add-host=eshost208.myjipl.com:183.87.38.208 --add-host=eshost209.myjipl.com:183.87.38.209 --add-host=eshost210.myjipl.com:183.87.38.210 --hostname=user4.techvit.com  user-service
