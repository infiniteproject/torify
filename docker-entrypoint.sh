#!/bin/bash
set -e

if [[ $DOCKER_HOST == unix://* ]]; then
	socket_file=${DOCKER_HOST#unix://}
	if ! [ -S $socket_file ]; then
		cat >&2 <<-EOT
			ERROR: you need to share your Docker host socket with a volume at $socket_file
			Typically you should run your infiniteproject/torify with: \`-v /var/run/docker.sock:$socket_file:ro\`
		EOT
		socketMissing=1
	fi
fi

if [ "$socketMissing" = 1 -a "$1" = forego -a "$2" = start -a "$3" = '-r' ]; then
	exit 1
fi

exec "$@"
