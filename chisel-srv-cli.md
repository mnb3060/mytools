## install chisel
```
mkdir chisel && cd chisel && wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_amd64.gz && gunzip chisel_1.9.1_linux_amd64.gz && chmod +x chisel_1.9.1_linux_amd64
```
# enable service for srv/cli
```
nano /etc/systemd/system/chisel.service
```

# for server 

############# for running on 8080 port and 8443(socks proxy running)
```
[Unit]
Description=Chisel Service
After=network.target

[Service]
Type=simple
WorkingDirectory=/root/chisel/
ExecStart=/root/chisel/chisel_1.9.1_linux_amd64 server --port 8080 --socks5 8443 --proxy http://ursrv.com -v

Restart=on-failure

[Install]
WantedBy=multi-user.target
```
####################

# for client service
############# client service
```
[Unit]
Description=Chisel Service
After=network.target

[Service]
Type=simple
WorkingDirectory=/root/chisel/
ExecStart=/root/chisel/chisel_1.9.1_linux_amd64 client http://ursrv.com:8080 2480:127.0.0.1:8443
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
#######################
#######################
  
```
systemctl enable chisel && systemctl start chisel
```

## run proxy on 2480
## for check the service 

`service chisel status`

# if yoou want to run apt service over your chisel proxy
```
echo "Acquire::socks5::Proxy \"socks5://127.0.0.1:2480\";" > /etc/apt/apt.conf.d/81socksproxy
```


