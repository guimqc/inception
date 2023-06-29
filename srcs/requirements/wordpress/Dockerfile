FROM alpine:3.16

COPY conf/www.conf /etc/php8/php-fpm.d/www.conf

CMD ["/usr/sbin/php-fpm8", "-F"]