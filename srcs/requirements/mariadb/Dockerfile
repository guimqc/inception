FROM alpine:3.16

RUN apk update && apk add mariadb && \
	mysql_install_db --ldata=/var/lib/mysql/ && \
	mkdir /run/mysqld

COPY 	/conf/my.cnf /etc/my.cnf
COPY 	/conf/my.cnf /etc/mysql/my.cnf
COPY 	/tool/entrypoint.sh ./entrypoint.sh

RUN		chmod +x entrypoint.sh
RUN		mkdir -p /run/mysqld /var/lib/mysql /var/log/mysql
RUN		chown -R mysql:mysql /var/log/mysql

CMD ["mariadbd"]