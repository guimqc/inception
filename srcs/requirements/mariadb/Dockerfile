FROM alpine:3.16

RUN apk update && apk add mariadb && \
	mysql_install_db --ldata=/var/lib/mysql/ && \
	mkdir /run/mysqld

CMD ["mariadbd", "--user=root"]
