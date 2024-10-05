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
RUN	docker-php-ext-enable memcached xcache
RUN docker-php-ext-install opcache mysqli
RUN	docker-php-ext-enable opcache mysqli
#OpCache
ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS="0"
#ADD opcache.ini "$PHP_INI_DIR/conf.d/opcache.ini"

# opcode apc
# Install APCu and APC backward compatibility
RUN pecl install apcu \
    && pecl install apcu_bc-1.0.3 \
    && docker-php-ext-enable apcu --ini-name 10-docker-php-ext-apcu.ini \
    && docker-php-ext-enable apc --ini-name 20-docker-php-ext-apc.ini


# Install APCu extension
#RUN pecl install apcu \
#    && docker-php-ext-enable apcu

# apache
RUN a2enmod rewrite
RUN a2enmod socache_shmcb
RUN service apache2 restart
#EXPOSE 80
