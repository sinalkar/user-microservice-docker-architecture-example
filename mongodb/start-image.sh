#!/usr/bin/env bash

docker run -d -v /mnt/data:/data -v /mnt/logs:/logs -p 27017:27017 --hostname=mongodev.local user-service-mongodb
