FROM amneale/composer

RUN apk add --no-cache make $PHPIZE_DEPS \
    && pecl install pcov \
    && docker-php-ext-enable pcov
