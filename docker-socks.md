Setting up the SOCKS5 proxy connection
You are going to use the -D option in your SSH command. This allocates a socket listing on a port. Connections made to this port are forwarded over the (secure) channel.

For example, if you can use host 172.31.10.5 as a proxy, the command would look like this:

ssh -D 8080 172.31.10.5

Every connection to port 8080 on localhost is proxied via host 172.31.10.5.

Configure Docker
To make Docker use the proxy, you will have to configure dockerd. One way to do this is to create the file 

/etc/systemd/system/docker.service.d/proxy.conf 

with the following content:

[Service]
Environment="HTTP_PROXY=socks5://127.0.0.1:8080"
Environment="HTTPS_PROXY=socks5://127.0.0.1:8080"

(You most likely do not even need the HTTP_PROXY line, but it also doesn’t hurt. ;-) )

Once this file is in place, you need to restart the Docker service:

systemctl daemon-reload
systemctl restart docker

When you run the following command again, the traffic is tunneled via your proxy.

docker pull registry.example.com:5678/image
