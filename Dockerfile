# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: jsimelio <jsimelio@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2021/04/19 16:06:28 by jsimelio      #+#    #+#                  #
#    Updated: 2021/04/27 15:32:04 by jsimelio      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

# ENV		AUTOINDEX on

LABEL 	maintainer="jsimelio@student.codam.nl"

RUN		apt-get update && \
		apt-get install -y \
		wget \
		nginx \
		mariadb-server \
		php7.3 \
		php-mysql \
		php-fpm \
		php-pdo \
		php-gd \
		php-cli \
		php-mbstring \
		php-xml

# COPY SRCS
COPY 	srcs/. /root/

# CONFIGURE SSL
RUN 	wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.1/mkcert-v1.4.1-linux-amd64 && \
		chmod 777 ./mkcert-v1.4.1-linux-amd64 && \
		./mkcert-v1.4.1-linux-amd64 localhost && \
		rm -rf ./mkcert-v1.4.1-linux-amd64 && \
		mv ./localhost.pem ./etc/nginx && \
		mv ./localhost-key.pem ./etc/nginx

# # NGINX CONF FILE && SIMLINK
# # RUN 	mv /root/info.php /var/www/html && \
# # 		# mv /root/index.html /var/www/html && \
# # RUN		mv /root/index.sh . && \
# RUN		mv /root/nginx.conf /etc/nginx/sites-available/localhost && \
# 		ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/ && \
# 		nginx -t

# CONFIGURE NGINX WEB SERVER
RUN 		mv /root/info.php /var/www/html && \
        	mv /root/index.html /var/www/html && \
			mv /root/index.sh . && \
        	mv /root/nginx.conf /etc/nginx/sites-available && \
			ln -fs /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled && \
			nginx -t

# CONFIGURE DATABASE
RUN 	service mysql start && \
		echo "create user 'jsimelio'@'localhost' identified by 'password'"| mysql -u root && \
		echo "create database wordpress;"| mysql -u root && \
		echo "grant all privileges on *.* to 'jsimelio'@'localhost';"| mysql -u root && \
		echo "flush privileges;"| mysql -u root
		# echo "update mysql.user set plugin='' where user='root';"| mysql -u root --skip-password

# INSTALL PHPMYADMIN
RUN 	wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz && \
		tar -xf phpMyAdmin-5.1.0-english.tar.gz -C /root && \
		mkdir /var/www/html/phpmyadmin && \
		cp -a /root/phpMyAdmin-5.1.0-english/. /var/www/html/phpmyadmin/ && \
		rm -rf /root/phpMyAdmin-5.1.0-english && \
		rm -rf phpMyAdmin-5.1.0-english.tar.gz && \
		mv /root/config.inc.php /var/www/html/phpmyadmin/

# CONFIGURE WORDPRESS
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \	
		chmod +x wp-cli.phar && \
		mv wp-cli.phar /usr/local/bin/wp && \
		wp core download --allow-root --path=var/www/html && \
		mv /root/wp-config.php /var/www/html && \
		service mysql restart && \
		wp core install --allow-root --url=localhost --path=/var/www/html --title=Wordpress --admin_user=jsimelio \
		--admin_password=password --admin_email=jsimelio@student.codam.nl --skip-email

# GRANT PERMISSIONS
RUN 	chown -R www-data:www-data /var/www/* && \
		chmod -R 755 /var/www/*

# START SERVICES
CMD 	service mysql restart && service php7.3-fpm start && nginx -g 'daemon off;'

# EXPOSE 80 443

# # Autoindex can be turned off at the time of running the container
# # sed -i "18 s/on/${AUTOINDEX}/g" /etc/nginx/sites-available/nginx.conf



# service mysql start
# service php7.3-fpm start


# bash