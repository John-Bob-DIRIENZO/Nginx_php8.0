# FastCGI Process Manager (FPM)
FROM php:8.0-fpm

RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN apt-get update \
    && apt-get install -y openssl libssl-dev libcurl4-openssl-dev \
    && pecl install mongodb \
    && echo "extension=mongodb.so" >> $PHP_INI_DIR/php.ini-production \
    && docker-php-ext-enable mongodb

