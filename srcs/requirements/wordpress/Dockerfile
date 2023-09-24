FROM alpine:3.16

COPY conf/www.conf /etc/php8/php-fpm.d/www.conf

COPY tool/entry.sh /entry.sh
RUN chmod +x /entry.sh

RUN apk update && apk upgrade && apk add --no-cache \
	curl bash mariadb-client \
	php8-fpm php8-phar php8-curl php8-json php8-mysqli php8-gd \
	php8-xml php8-zip php8-mbstring php8-curl php8-openssl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT ["/entry.sh"]

CMD ["/usr/sbin/php-fpm8", "-F"]
