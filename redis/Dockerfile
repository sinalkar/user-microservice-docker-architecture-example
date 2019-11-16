FROM ubuntu:16.04

MAINTAINER Sanjay Sinalkar 

#RUN apt-get update -y && apt-get install -y wget build-essential
RUN apt-get update -y  \
 && apt-get install -yqq \
 build-essential \
 wget \
 supervisor
# && apt-get clean \
# && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /opt && wget http://download.redis.io/releases/redis-stable.tar.gz

RUN cd /opt && tar -xvzf redis-stable.tar.gz

RUN cd /opt/redis-stable && make

RUN mkdir -p /var/log/supervisor

RUN mkdir -p /data

COPY supervisor.conf /etc/supervisor/conf.d/supervisor.conf

COPY redis.conf /opt/redis-stable/redis.conf

EXPOSE 6380

CMD "/usr/bin/supervisord"