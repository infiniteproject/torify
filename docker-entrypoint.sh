#!/bin/sh

echo "HiddenServiceDir /var/lib/tor/$CONTAINER/" >> /etc/tor/torrc
echo "HiddenServicePort $SERVICE_PORT $CONTAINER_NAME:$CONTAINER_PORT" >> /etc/tor/torrc

tor