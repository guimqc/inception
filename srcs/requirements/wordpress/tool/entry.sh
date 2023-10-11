#!/bin/bash

for i in {0..10}; do
	if mariadb -h$MYSQL_SERVER -u$MYSQL_USER -p$MYSQL_PASSWORD --database=$MYSQL_DATABASE <<<'SELECT 1;' &>/dev/null; then
		break
	fi
	sleep 2
done
if [ "$i" = 10 ]; then
	echo "Can't connect to db"
fi

if [ ! -f "/var/www/html/wp-config.php" ]; then
        tar -xzf wordpress-6.0.tar.gz
        rm wordpress-6.0.tar.gz
        mv wordpress//* var/www/html/
        rm -rf wordpress

		echo connecting to database...
		mariadb -h$MYSQL_SERVER -u$MYSQL_USER -p$MYSQL_PASSWORD --database=$MYSQL_DATABASE
		echo config create
        wp config create --allow-root \
            --dbname=$MYSQL_DATABASE \
            --dbuser=$MYSQL_USER \
            --dbpass=$MYSQL_PASSWORD \
            --dbhost=$MYSQL_SERVER \
            --dbcharset="utf8" \
            --dbcollate="utf8_general_ci" \
            --path="/var/www/html"
		echo install
        wp core install --allow-root \
            --title="Wordpress" \
            --admin_name=$MYSQL_USER \
            --admin_password=$MYSQL_PASSWORD \
            --admin_email=$MYSQL_EMAIL \
            --skip-email \
            --url=$DOMAIN_NAME \
            --path="/var/www/html"
		echo user create
        wp user create --allow-root \
            $WP_USER \
            $WP_EMAIL \
            --role=author \
            --user_pass=$WP_PASSWORD \
            --path="/var/www/html"
fi

exec "$@"