FROM ubuntu:latest
MAINTAINER Ruggero <infiniteproject@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV CONTAINER_NAME nginx
ENV CONTAINER_PORT 80
ENV SERVICE_PORT 80

RUN apt-get update && \
    apt-get -y install \
        tor
	
RUN apt-get clean && \
    rm -fr /var/lib/apt/lists/* \
        /tmp/* \
	    /var/tmp/*
	
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]