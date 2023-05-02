FROM alpine:3.16

RUN apk update && apk add mariadb && \
	mysql_install_db --user=mysql --ldata=/var/lib/mysql/

CMD ["mariadbd", "--user=root"]
