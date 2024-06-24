FROM chialab/php:7.4-apache

#RUN echo "nameserver 127.0.0.11" > /etc/resolv.conf
#RUN sed -i 's/deb.debian.org/cdn-fastly.deb.debian.org/g' /etc/apt/sources.list

#ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

#RUN chmod +x /usr/local/bin/install-php-extensions


#RUN install-php-extensions gd xdebug mysqli curl mbstring imagick
#RUN docker-php-ext-install gd mysqli curl mbstring imagick
#RUN docker-php-ext-enable gd mysqli curl mbstring imagick

# php ext
RUN apt-get update && apt-get install -y libmemcached-dev libssl-dev zlib1g-dev 
#RUN pecl install memcached

RUN	docker-php-ext-enable memcached
RUN docker-php-ext-install opcache
RUN	docker-php-ext-enable opcache

#OpCache
ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS="0"
#ADD opcache.ini "$PHP_INI_DIR/conf.d/opcache.ini"

# apache

RUN a2enmod rewrite
RUN a2enmod ssl

RUN a2enmod socache_shmcb
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem -subj "/C=AT/ST=Vienna/L=Vienna/O=Security/OU=Development/CN=example.com"

RUN a2ensite default-ssl

RUN service apache2 restart

#EXPOSE 80
EXPOSE 443
#MEMCACHE PORT EXPOSE
EXPOSE 11211
