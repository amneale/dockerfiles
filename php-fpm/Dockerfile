FROM php:8.0-fpm-alpine

RUN apk add --update icu-dev \
    && docker-php-ext-install opcache pdo_mysql bcmath intl \
    && docker-php-ext-enable opcache \
    && rm -rf /var/cache/apk/* /var/lib/apt/lists/*
