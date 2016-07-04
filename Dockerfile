FROM ubuntu:latest
MAINTAINER Ruggero <infiniteproject@gmail.com>

ENV DOCKER_HOST unix:///tmp/docker.sock
ENV DOCKER_GEN_VERSION 0.7.3
ENV DEBIAN_FRONTEND noninteractive
ENV SERVICE_PORT 80

VOLUME /var/lib/tor
WORKDIR /app

RUN apt-get update && \
    apt-get -y --no-install-recommends install \
        tor \
        wget

COPY Procfile /app/Procfile
ADD https://bin.equinox.io/c/ekMN3bCZFUn/forego-stable-linux-amd64.tgz /usr/local/bin/forego
RUN chmod +x /usr/local/bin/forego

RUN wget https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz && \
    tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz && \
    rm /docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz
	
RUN apt-get clean && \
    rm -fr /var/lib/apt/lists/* \
        /tmp/* \
	/var/tmp/*

ADD tor.tmpl /app/tor.tmpl
	
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["forego", "start", "-r"]
