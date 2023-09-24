FROM alpine:3.16

RUN apk update && apk add --update mariadb mariadb-client bash

COPY ./conf/my.cnf /etc/my.cnf
COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/my.cnf
COPY ./tool/entry.sh .

RUN	chmod +x ./entry.sh
RUN	mkdir -p /run/mysqld /var/lib/mysql /var/log/mysql
RUN	chown -R mysql:mysql /var/lib/mysql

ENTRYPOINT [ "./entry.sh" ]

CMD	["mysqld"]
