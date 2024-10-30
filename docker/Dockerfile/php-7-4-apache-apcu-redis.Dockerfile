FROM chialab/php:7.4-apache
# php ext
RUN apt-get update && apt-get install -y libmemcached-dev libssl-dev zlib1g-dev wget
# php varnish
# RUN apt-get update && apt-get install -y varnish
# XCache
#RUN apt-get install -y php-xcache xcache-admin
# install imagemagick 
RUN apt install -y libpng-dev libjpeg-dev libtiff-dev imagemagick
#RUN pecl install memcached
RUN	docker-php-ext-enable memcached 
RUN docker-php-ext-install opcache mysqli
RUN	docker-php-ext-enable opcache mysqli
#OpCache
ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS="0"
#ADD opcache.ini "$PHP_INI_DIR/conf.d/opcache.ini"

# opcode apc
# Install APCu and APC backward compatibility
RUN pecl install APCu \
&& docker-php-ext-enable apcu \
&& echo "apc.enabled=1" >> /usr/local/etc/php/conf.d/apcu.ini \
&& echo "apc.enable_cli=1" >> /usr/local/etc/php/conf.d/apcu.ini 
# Xcache
#RUN cd /usr/local/src && wget http://xcache.lighttpd.net/pub/Releases/1.3.2/xcache-1.3.2.tar.gz && tar -xzf xcache-1.3.2.tar.gz && cd xcache-1.3.2 && phpize && ./configure --with-php-config=/usr/bin/php-config --enable-xcache --enable-xcache-optimizer --enable-xcache-coverager && make && make install

#redis
RUN pecl install redis \
&& docker-php-ext-enable redis \
&& echo "session.save_handler = redis" >> /usr/local/etc/php/conf.d/redis.ini \
&& echo "session.save_path = tcp://redis:6379" >> /usr/local/etc/php/conf.d/redis.ini 
# apache
RUN a2enmod rewrite
RUN a2enmod socache_shmcb

RUN a2enmod ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem -subj "/C=AT/ST=Vienna/L=Vienna/O=Security/OU=Development/CN=example.com"

RUN a2ensite default-ssl

RUN service apache2 restart

#EXPOSE 80
EXPOSE 443