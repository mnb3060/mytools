`source: https://bobcares.com/blog/docker-php-enable-opcache/`

# Speeding up PHP Docker with OpCache 

PHP includes a caching engine called OPcache. When enabled, it significantly improves the performance of PHP-powered websites. OPcache improves PHP performance by storing precompiled script bytecode in shared memory, eliminating the need for PHP to load and parse scripts on each request, according to php.net.

# Installing OpCache
Installing OpCache in the image requires only one step. Hence Include the line given below on the Docker file.

`docker-php-ext-install opcache`

# Enabling OpCache
A user can change the settings for OpCache to allow for more files in the cache. Hence, the user must also disable the re-validation of files in production. After that, the user can create a file with the name opcacache.ini and include it in the image. the user must make sure  that the file consists of an environment to enable validation for local development

`Dockerfile`
```
ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS="0"
ADD opcache.ini "$PHP_INI_DIR/conf.d/opcache.ini"
```
`opcache.ini`
```
[opcache]
; maximum memory that OPcache can use to store compiled PHP files, Symfony recommends 256
opcache.memory_consumption=192
; maximum number of files that can be stored in the cache
opcache.max_accelerated_files=20000
; validate on every request
opcache.revalidate_freq=0
; re-validate timestamps, by default set to false (0), can be overridden in local docker-compose
opcache.validate_timestamps=${PHP_OPCACHE_VALIDATE_TIMESTAMPS}
opcache.interned_strings_buffer=16
opcache.fast_shutdown=1
```
And, when runningdocker-compose locally a user can include the environment variable `PHP_OPCACHE_VALIDATE_TIMESTAMPS: 1` for the app container.

`docker-compose.yml`
```
services:
app:
environment:
PHP_OPCACHE_VALIDATE_TIMESTAMPS: 1

```
