src: https://www.digitalocean.com/community/tutorials/how-to-install-webmin-on-ubuntu-22-04
# Webmin
```
sudo apt update
curl -fsSL https://download.webmin.com/jcameron-key.asc | sudo gpg --dearmor -o /usr/share/keyrings/webmin.gpg
echo "deb [signed-by=/usr/share/keyrings/webmin.gpg] http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list
sudo apt update
sudo apt -y install webmin
```