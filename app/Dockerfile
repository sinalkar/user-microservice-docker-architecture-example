FROM node:6.11

MAINTAINER Sanjay Sinalkar 

# Install Utilities
RUN apt-get update -y  && apt-get install -y \
 ssh \
 wget \
 sudo \
 supervisor \
 build-essential \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create Directories
RUN mkdir -p /var/log/supervisor

RUN mkdir -p /data

RUN mkdir -p /logs

RUN mkdir -p /opt/techvit/app

# Set Project Directory
ENV HOME=/opt/techvit/app

COPY src/package.json $HOME/src/

COPY src/ $HOME/src

WORKDIR $HOME/src

# Install npm packages
RUN npm cache clean && npm install --silent --progress=false

# Install haxproxy packages
RUN cd /opt && wget http://www.haproxy.org/download/1.5/src/haproxy-1.5.3.tar.gz

RUN cd /opt && tar xzf haproxy-1.5.3.tar.gz

RUN cd /opt/haproxy-1.5.3 && make TARGET=linux2628 && make install

COPY haproxy.cfg /opt/haproxy-1.5.3/haproxy.cfg

COPY supervisor.conf /etc/supervisor/conf.d/supervisor.conf

EXPOSE 80 443 8080

CMD "/usr/bin/supervisord"
