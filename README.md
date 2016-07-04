# torify
Tor hidden service "proxy" for Docker containers using docker-gen.
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
This is very basic and untested, feedback appreciated.
