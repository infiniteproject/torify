#!/bin/bash

echo "HiddenServiceDir /var/lib/tor/$CONTAINER_NAME/" >> /etc/tor/torrc
echo "HiddenServicePort $SERVICE_PORT $CONTAINER_NAME:$CONTAINER_PORT" >> /etc/tor/torrc
echo "Log info stdout" >> /etc/tor/torrc

/usr/bin/tor -f /etc/tor/torrc