#!/bin/bash
# building nginx unit php8.1 module in nginx/unit:1.27.0-minimal
# based on: Packaging Custom Modules - https://unit.nginx.org/howto/modules/
export UNITTMP=$(mktemp -d -p /tmp -t unit.XXXXXX)
mkdir -p $UNITTMP/unit-php8.1/DEBIAN
cd $UNITTMP
curl -O https://unit.nginx.org/download/unit-1.27.0.tar.gz
tar xzf unit-1.27.0.tar.gz
cd unit-1.27.0
./configure --prefix=/usr --state=/var/lib/unit --control=unix:/var/run/control.unit.sock --pid=/var/run/unit.pid --log=/var/log/unit.log --tmp=/var/tmp --user=unit --group=unit --openssl --libdir=/usr/lib/x86_64-linux-gnu --cc-opt='-g -O2 -fdebug-prefix-map=/unit=. -specs=/usr/share/dpkg/no-pie-compile.specs -fstack-protector-strong -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fPIC' --modules=/usr/lib/unit/modules
./configure php --module=php8.1 --config=php-config
make php8.1
mkdir -p $UNITTMP/unit-php8.1/usr/lib/unit/modules
mv build/php8.1.unit.so $UNITTMP/unit-php8.1/usr/lib/unit/modules
echo 'Package: unit-php8.1
Version: 1.27.0
Architecture: amd64
Depends: php8.1-common, libphp8.1-embed
Description: PHP 8.1 language module for NGINX Unit 1.27.0' > $UNITTMP/unit-php8.1/DEBIAN/control
dpkg-deb -b $UNITTMP/unit-php8.1
cp $UNITTMP/unit-php8.1.deb /unit-php8.1.deb
