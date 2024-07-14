# ClamAV
## install
```sudo apt-get install clamav clamav-daemon```
## scan
```sudo freshclam```
```sudo clamscan -r <Directory>```
### show only the infected files after the scanning
```sudo clamscan -r -i <Directory>```

# Rkhunter
```sudo apt-get install rkhunter```
## update
```sudo rkhunter –propupd```
## scan
```sudo rkhunter –checkall```
## save logs scan
```sudo cat /var/log/rkhunter.log | grep -i warning```

# Chkrootkit
## install
```sudo apt-get install chkrootkit```
## scan
```sudo chkrootkit```
## save logs
```sudo chkrootkit | sudo tee /var/log/chkrootkit/chkrootkit.log```
## show only warning
```sudo cat /var/log/chkrootkit/chkrootkit.log | grep -i warning```

src: https://www.interserver.net/tips/kb/scan-ubuntu-server-for-malware-and-rootkits/