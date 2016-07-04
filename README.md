# torify
Tor hidden service "proxy" for Docker containers using docker-gen.
```
docker run -d --name torify -v /var/run/docker.sock:/tmp/docker.sock:ro infiniteproject/torify 
docker run -d --name some-nginx -e TORIFY nginx
```
Get hostname:
```
docker exec -it torify cat /var/lib/tor/nginx/hostname
```
This is very basic and untested, feedback appreciated.
