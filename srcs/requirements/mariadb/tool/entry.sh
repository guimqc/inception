#!/bin/bash

set -euo pipefail

if [ "$1" = 'mysqld' ]; then
    if [ ! -f "$MYSQL_DATADIR/initdb.sql" ]; then
		echo mysql_install_db
        mysql_install_db --datadir=$MYSQL_DATADIR --user=$MYSQL_USER --rpm --skip-test-db > /dev/null

        cat >"$MYSQL_DATADIR/initdb.sql" <<EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';

FLUSH PRIVILEGES;
EOF

        mysqld --skip-networking=1 &
        for i in {0..30}; do
            if mysql -u root -proot --database=mysql <<<'SELECT 1;' &> /dev/null; then
                break
            fi
            sleep 0.1
        done
        if [ "$i" = 30 ]; then
            echo "Error while starting server"
        fi
        mysql -u root -p$MYSQL_PASSWORD < "$MYSQL_DATADIR/initdb.sql" && killall mysqld
    fi

    echo "MariaDB listening on port 3306"
fi

exec "$@"