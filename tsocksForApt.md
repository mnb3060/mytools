# installation
```
apt-get update
apt-get dist-upgrade

apt-get install tsocks
```

# Config
add the end of this file
```
nano /etc/tsocks.conf
```
like this:

```
server = 127.0.0.1
server_type = 5
server_port = 1080
```
## Dont Forget replace your server ip with 127.0.0.1
######
### now you can enjoy with tsocks command before other commands in cli 
## for test type this line
`tsocks curl ifconfig.io`
return your proxy ip
# enjoy!
