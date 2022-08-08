# Builder
FROM nginx/unit:1.27.0-minimal as builder

RUN apt update && apt install -y ca-certificates apt-transport-https \
    && curl -o /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ bullseye main" | tee /etc/apt/sources.list.d/php.list \
    && apt update && apt install -y php8.1 php8.1-mysql php8.1-curl php8.1-xml php8.1-apcu php8.1-dev libphp8.1-embed

COPY ./build.sh /build.sh
RUN /build.sh

# Main
FROM nginx/unit:1.27.0-minimal as main

RUN apt update && apt install -y ca-certificates apt-transport-https \
    && curl -o /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ bullseye main" | tee /etc/apt/sources.list.d/php.list \
    && apt update && apt install -y php8.1-common php8.1-mysql php8.1-curl php8.1-xml php8.1-apcu libphp8.1-embed

COPY --from=builder /unit-php8.1.deb /unit-php8.1.deb

RUN dpkg -i /unit-php8.1.deb \
    && apt purge -y apt-transport-https apache2 && apt clean autoclean \
    && apt autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/ && rm -rf /unit-php8.1.deb
