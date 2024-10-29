# using redis in docker

## run redis in docker 
```
docker run redis
```
### add redis to your project network

## Add these lines to php.ini for 'redis' server name
```
;redis
session.save_handler = redis
session.save_path = "tcp://redis:6379"
```