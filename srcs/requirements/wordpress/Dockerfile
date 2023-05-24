FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache \
	curl \
    tar \
    php8 \
    php8-fpm \
    php8-mysqli \
    php8-curl \
    php8-gd \
    php8-intl \
    php8-mbstring \
    php8-opcache \
    php8-openssl \
    php8-soap \
    php8-zip

RUN curl -o wordpress.tar.gz -SL https://wordpress.org/latest.tar.gz && \
    tar -xzf wordpress.tar.gz -C /var/ && \
    rm wordpress.tar.gz

CMD ["/usr/sbin/php-fpm8", "-F"]