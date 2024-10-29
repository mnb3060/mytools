# using redis in docker

## run redis in docker 
```
docker run redis
```

## build phpredis on docker php image 

```
RUN pecl install redis
```
src: https://github.com/phpredis/phpredis/blob/develop/INSTALL.md

### add redis container to your project network

## Add these lines to php.ini for 'redis' server name
```
;redis
session.save_handler = redis
session.save_path = "tcp://redis:6379"
```