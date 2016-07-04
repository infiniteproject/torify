tor: /usr/bin/tor -f /etc/tor/torrc
gen: docker-gen -watch -notify -wait 5s:30s "killall -HUP tor" /app/torrc.tmpl /etc/tor/torrc
