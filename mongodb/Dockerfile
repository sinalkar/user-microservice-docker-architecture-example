FROM ubuntu:16.04

MAINTAINER Sanjay Sinalkar 

#RUN apt-get update -y && apt-get install -y wget
RUN apt-get update -y  \
 && apt-get install -yqq \
 wget \
 supervisor \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/log/supervisor

RUN mkdir -p /data

RUN mkdir -p /logs

RUN cd /opt && wget -nv https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu1604-3.4.9.tgz

RUN cd /opt && tar -xvzf mongodb-linux-x86_64-ubuntu1604-3.4.9.tgz

COPY mongo.conf /opt/mongodb-linux-x86_64-ubuntu1604-3.4.9/mongo.conf

COPY supervisor.conf /etc/supervisor/conf.d/supervisor.conf

EXPOSE 27017                                        

CMD "/usr/bin/supervisord"