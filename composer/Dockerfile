FROM amneale/php-fpm

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN composer global require hirak/prestissimo \
    --prefer-dist \
    --prefer-stable \
    --no-progress \
    --no-scripts \
    --no-suggest \
    --no-interaction \
    --ansi
