FROM chialab/php:8.2-apache
# php ext
RUN apt-get update && apt-get install -y libmemcached-dev libssl-dev zlib1g-dev 
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

# apache
RUN a2enmod rewrite
RUN a2enmod socache_shmcb
RUN service apache2 restart
#EXPOSE 80
