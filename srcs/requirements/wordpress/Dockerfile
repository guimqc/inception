FROM alpine:3.16

RUN apk update && apk upgrade \
	&& apk add php8-fpm

CMD ["/usr/sbin/php-fpm8"]