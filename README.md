# torify
Tor hidden service "proxy" for Docker containers using [docker-gen](https://github.com/jwilder/docker-gen).
```
docker run -d --name torify -v /var/run/docker.sock:/tmp/docker.sock:ro infiniteproject/torify
```
Run container you want to create a hidden service for with -e TORIFY env variable:
```
docker run -d --name <some-nginx> -e TORIFY nginx
```
Get hostname:
```
docker exec -it torify cat /var/lib/tor/<some-nginx>/hostname
```
This is very basic and untested, feedback appreciated. Tor connects to target container's first exposed port, otherwise to port 80 unless specified with VIRTUAL_PORT env variable. Data is stored in /var/lib/tor/<container-name> so you can persist it with -v tor:/var/lib/tor.
