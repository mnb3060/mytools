# Some mysql/mariadb useful command

## Create mysql user
```
CREATE USER 'sammy'@'localhost' IDENTIFIED BY 'password';
```
### For use in phpmyadmin use this plugin
```
CREATE USER 'sammy'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```
Or alter an exist one:
```
ALTER USER 'sammy'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```

### Grant user to db
```
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'sammy'@'localhost' WITH GRANT OPTION;
```
### Drop user
```
DROP USER user@localhost,user2@'127.%';
```
## dont forget flush after all changes in mysql
```
FLUSH PRIVILEGES;
```


## Migrate from server a to server b
```
mysqldump -uuser -ppassword myDatabase | mysql -hremoteserver -uremoteuser -premoteserverpassword 
```
### replace remoteserver and etc...

## Backup all database to one gzip file with time and date
### gzip
```
cd /path/db/ && mkdir "$(date +'%Y-%m-%d_%H-%M-%S')" && mysqldump -u root --all-databases | gzip > "$(date +'%Y-%m-%d_%H-%M-%S')/all.sql.gz"
```
### 7z (best compression) with docker
```
docker exec mariadb \
mariadb-dump -u root -p{ROOT_PASS} --all-databases  | \
7z a -si -mx9 /path/to/bkdb/$(date +'%Y-%m-%d')/all-$(date +'%Y-%m-%d_%H-%M-%S').sql.7z
```
### Dont forget to set user and password to `~/.my.cnf` for automate it Like this:
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


some src:
```
https://www.digitalocean.com/community/tutorials/how-to-create-a-new-user-and-grant-permissions-in-mysql

```