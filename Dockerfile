FROM ubuntu:latest
MAINTAINER Ruggero <infiniteproject@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV CONTAINER_NAME nginx
ENV CONTAINER_PORT 80
ENV SERVICE_PORT 80

VOLUME /var/lib/tor

RUN apt-get update && \
    apt-get -y --no-install-recommends install \
        tor
	
RUN apt-get clean && \
    rm -fr /var/lib/apt/lists/* \
        /tmp/* \
	    /var/tmp/*
	
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]