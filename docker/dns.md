Create a `/etc/docker/daemon.json` file with this content:
```
mkdir /etc/docker
nano /etc/docker/daemon.json
```
```
{
  "dns": ["8.8.8.8", "8.8.4.4"]
}
```
and restart the docker service:

```sudo service docker restart```


or with one command(old file overritten)
```
mkdir /etc/docker && echo "{"dns": ["8.8.8.8", "8.8.4.4"]}" > /etc/docker/daemon.json && sudo service docker restart
```
src: https://docs.docker.com/engine/install/linux-postinstall/#specify-dns-servers-for-docker
