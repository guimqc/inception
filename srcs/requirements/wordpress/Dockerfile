FROM alpine:3.16

COPY conf/www.conf /etc/php8/php-fpm.d/www.conf

RUN apk update && apk upgrade && apk add --no-cache \
	curl \
	openssl \
	bash \
	mariadb-client \
	php8 \
	php8-fpm \
	php8-opcache \
	php8-mysqli \
	php8-session \
	php8-iconv \
	php8-json \
	php8-gd \
	php8-curl \
	php8-xml \
	php8-common \
	php8-imap \
	php8-cgi \
	php8-pdo \
	php8-pdo_mysql \
	php8-soap \
	php8-posix \
	php8-redis \
	php8-gettext \
	php8-ldap \
	php8-ctype \
	php8-dom \
	php8-phar

RUN curl -o /usr/local/bin/wp -fL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
	chmod +x /usr/local/bin/wp; \
	wp --allow-root --version

CMD ["/usr/sbin/php-fpm8", "-F"]