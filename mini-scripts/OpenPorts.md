# Open Ports in Linux
```
sudo lsof -i -P -n | grep LISTEN
```
```
sudo netstat -tulpn | grep LISTEN
```
```
sudo ss -tulpn | grep LISTEN
```
```
sudo lsof -i:22 ## see a specific port such as 22 ##
```
```
sudo nmap -sTU -O IP-address-Here
```
`https://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/`