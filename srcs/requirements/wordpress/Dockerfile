FROM alpine:3.16

COPY conf/www.conf /etc/php8/php-fpm.d/www.conf
# COPY conf/wp-config.php  /var/www/html/wp-config.php

COPY tool/entry.sh /entry.sh
RUN chmod +x /entry.sh

RUN apk update && apk upgrade && apk add --no-cache \
	curl openssl bash mariadb-client \
	php8-fpm php8-phar php8-curl php8-json php8-mysqli

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT ["/entry.sh"]

CMD ["/usr/sbin/php-fpm8", "-F"]
