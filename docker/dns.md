Create a `/etc/docker/daemon.json` file with this content:
```
{
  "dns": ["8.8.8.8", "8.8.4.4"]
}
```
and restart the docker service:

`sudo service docker restart`
src: https://docs.docker.com/engine/install/linux-postinstall/#specify-dns-servers-for-docker
