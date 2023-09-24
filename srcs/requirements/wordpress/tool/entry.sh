#!/bin/bash

if [ ! -f "/var/www/html/wp-config.php" ]; then
	wp config create --allow-root \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD \
        --dbhost="mariadb" \
        --dbcharset="utf8" \
        --dbcollate="utf8_general_ci" \
        --path="/var/www/html"
fi

wp core install --allow-root \
	--title="Wordpress" \
	--admin_name=$MYSQL_USER \
	--admin_password=$MYSQL_PASSWORD \
	--admin_email="wordpress@superuser.com" \
	--skip-email \
	--url="gvial.42.fr" \
	--path="/var/www/html"

wp user create --allow-root \
	$WP_USER \
	$WP_EMAIL \
	--role=author \
	--user_pass=$WP_PASSWORD \
	--path="/var/www/html"

exec "$@"