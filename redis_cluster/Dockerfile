FROM redis:3.2.9

MAINTAINER Sanjay Sinalkar 

# Some Environment Variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Install system dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -yqq \
     gcc make g++ build-essential net-tools supervisor ruby rubygems locales gettext-base wget git libc6-dev tcl && \
    apt-get clean -yqq \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# # Ensure UTF-8 lang and locale
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

#RUN curl -sSL https://get.rvm.io | bash -s stable --ruby --gems

RUN gem install redis -v 3.3.3

ARG redis_version=3.2.9

RUN wget -qO redis.tar.gz http://download.redis.io/releases/redis-${redis_version}.tar.gz \
    && tar xfz redis.tar.gz -C / \
    && mv /redis-$redis_version /redis

RUN (cd /redis && make)

RUN mkdir /redis-conf

RUN mkdir /redis-data

RUN mkdir -p /var/log/supervisor

COPY redis-cluster.tmpl /redis-conf/redis-cluster.tmpl
COPY redis.tmpl /redis-conf/redis.tmpl

# Add supervisord configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Add startup script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh

EXPOSE 7000 7001 7002 7003 7004 7005 7006 7007

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["redis-cluster"]
