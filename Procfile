tor: /usr/bin/tor -f /etc/tor/torrc
gen: docker-gen -watch -notify "killall -HUP tor" /app/torrc.tmpl /etc/tor/torrc
