# Remote Mount in Linux

# FTP protocol

## using curlftpfs

### Install

```
apt update
apt install curlftpfs
```

### make dir for mounting

```
mkdir /mnt/ftp
```

### connect to ftp

```
sudo curlftpfs -o allow_other ftp://username:password@ftp.example.com /mnt/ftp
```

### Test

```
cd /mnt/ftp
ls
```

### Unmount

```
sudo umount /mnt/ftp
```

### Set Cron to auto mount on boot (Not Recommended)

```
nano /etc/fstab
```

```
curlftpfs#ftp://username:password@ftp.example.com /mnt/ftp fuse allow_other,uid=1000,gid=1000 0 0
```

src: Qwen

### mehtod 2: (Not save user:pass in fstab) (more secure)

#### Since we do not want to put any passwords in the /etc/fstab file, we will first create a /root/.netrc file with a ftp username and password using this format:

nano /root/.netrc
machine my-ftp-location.local
login ftp-user
password ftp-pass

#### Next, change permissions of this file to 600:

`chmod 600 /root/.netrc`

#### Check uid and gid of your non-root user. This user will have access to ftp mount directory:

#### In the next step add the following line to your /etc/fstab file ( change credentials for your ftp user ):

`curlftpfs#my-ftp-location.local /mnt/my_ftp fuse allow_other,uid=1000,gid=1000,umask=0022 0 0`

#### Now mount the remote FTP directory with:

```
mount -a
```

src: https://linuxconfig.org/mount-remote-ftp-directory-host-locally-into-linux-filesystem

### method 3 (more Stable And can be more secure with merge with method2 for password location)

Don't try to add remote fs to /etc/fstab

Or don't try to mount shares via /etc/rc.local .

In both cases it won't work as the network is not available when init reads /etc/fstab.

-> install AutoFS

# SSH protocol

## using sshfs

### Install sshfs

```
sudo apt install sshfs
```

### Mount remote directory

```
mkdir /local_directory
sshfs user@host:/remote_directory /local_directory
```

# windows share protocol
## using cifs
### Install
```
sudo apt install cifs-utils -y
```
### mount 
Change between [] for your config
```
sudo mkdir /mnt/winshare
sudo mount -t cifs //[IP_Address]/[share_name] /mnt/winshare -o username=[username]
```
### for save user/pass in file (more secure)

```
sudo nano /etc/cifs-credentials
```
add your user/pass:
```
username=[username]
password=[password]
```
save and exit

```
sudo chmod 600 /etc/cifs-credentials
```

for fstab auto mount example
```
sudo nano /etc/fstab
```

add following lines
```
//[IP_address]/[share_name] /mnt/winshare cifs credentials=/etc/cifs-credentials 0 0
```
# Install AutoFS For auto mounting

```
sudo apt install autofs
```

```
nano /etc/auto.master
```

Add or uncomment following lines

```
+/etc/auto.master.d
+/etc/auto.master
/- /etc/auto.sshfs --timeout=30
```

Edit this

```
nano /etc/auto.sshfs
```

Add like this

```
/local_directory -fstype=fuse,allow_other,IdentityFile=/local_private_key :sshfs\#user@remote_host\:/remote_directory
```
