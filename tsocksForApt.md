```
apt-get update
apt-get dist-upgrade

apt-get install tsocks

nano /etc/tsocks.conf
```
# add the end of this file like this
# replace your server ip to 127.0.0.1
```
server = 127.0.0.1
server_type = 5
server_port = 1080
```
######
# now you can enjoy with tsocks command before other commands in cli 
# for test type this line
```tsocks curl ifconfig.io```
return your proxy ip
# enjoy!
