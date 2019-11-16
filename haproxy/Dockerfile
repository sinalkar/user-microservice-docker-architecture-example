FROM ubuntu:16.04

MAINTAINER Sanjay Sinalkar 

#RUN apt-get update -y && apt-get install -y curl wget supervisor build-essential
# Install Utilities
RUN apt-get update -y  \
 && apt-get install -yqq \
 curl \
 build-essential \
 wget \
 supervisor 
 #&& apt-get clean \
 #&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/log/supervisor

RUN mkdir -p /logs

RUN cd /opt && wget http://www.haproxy.org/download/1.5/src/haproxy-1.5.3.tar.gz

RUN cd /opt && tar xzf haproxy-1.5.3.tar.gz

RUN cd /opt/haproxy-1.5.3 && make TARGET=linux2628 && make install

COPY haproxy.cfg /opt/haproxy-1.5.3/haproxy.cfg

COPY supervisor.conf /etc/supervisor/conf.d/supervisor.conf

EXPOSE 80 8080

CMD "/usr/bin/supervisord"