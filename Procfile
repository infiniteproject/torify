gen: docker-gen -watch -wait 5s:30s -notify "killall -HUP tor" /app/torrc.tmpl /etc/tor/torrc
tor: /usr/bin/tor -f /etc/tor/torrc
