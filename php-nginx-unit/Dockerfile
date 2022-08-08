FROM nginx/unit:1.26.1-php8.1

RUN apt update \
    && apt install -y icu-devtools

RUN pecl install apcu \
    && pecl clear-cache \

RUN docker-php-ext-install opcache intl \
    && docker-php-ext-enable apcu opcache \
    && rm -rf /var/cache/apk/* /var/lib/apt/lists/*

RUN apt purge -y --auto-remove icu-devtools