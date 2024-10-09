# Some mysql/mariadb useful command

## Migrate from server a to server b
```
mysqldump -uuser -ppassword myDatabase | mysql -hremoteserver -uremoteuser -premoteserverpassword 
```
### replace remoteserver and etc...

## Backup all database to one gzip file with time and date
```
cd /path/db/ && mkdir "$(date +'%Y-%m-%d_%H-%M-%S')" && mysqldump -u root --all-databases | gzip > "$(date +'%Y-%m-%d_%H-%M-%S')/all.sql.gz"
```
### Dont forget to set user and password to ~/.my.cnf for automate it Like this:
```
[mysql]
user=root
password=yourpaswd
host=mariadb
[mysqldump]
user=root
password=yourpaswd
host=mariadb
```
