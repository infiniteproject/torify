gen: docker-gen -watch -notify "kill -HUP $(pidof tor)" /app/torrc.tmpl /etc/tor/torrc
tor: /usr/bin/tor -f /etc/tor/torrc
