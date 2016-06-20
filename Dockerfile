FROM ubuntu:latest
MAINTAINER Ruggero <infiniteproject@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install \
        tor
	
RUN apt-get clean && \
    rm -fr /var/lib/apt/lists/* \
        /tmp/* \
	/var/tmp/*
	
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["tor"]
