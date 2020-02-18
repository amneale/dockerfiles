FROM php:7.4-fpm-alpine

RUN docker-php-ext-install opcache pdo_mysql \
    && docker-php-ext-enable opcache \
    && rm -rf /var/cache/apk/* /var/lib/apt/lists/*
