#!/bin/bash

echo "HiddenServiceDir /var/lib/tor/$CONTAINER_NAME/" >> /etc/tor/torrc
echo "HiddenServicePort $SERVICE_PORT $CONTAINER_NAME:$CONTAINER_PORT" >> /etc/tor/torrc

/usr/bin/tor