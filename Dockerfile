# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: jsimelio <jsimelio@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2021/04/19 16:06:28 by jsimelio      #+#    #+#                  #
#    Updated: 2021/04/22 15:18:50 by jsimelio      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

ENV AUTOINDEX on

RUN apt-get update && apt-get install -y \
	wget \
	nginx

    # mariadb-server \
	# php7.3 \
	# php-mysql \
	# php-fpm \
	# php-pdo \
	# php-gd \
	# php-cli \
	# php-mbstring

WORKDIR /var/www/html/

# COPY ./srcs/init.sh /var/www/html/

COPY ./srcs/nginx.conf /etc/nginx/sites-available

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

CMD service nginx start

nginx -d 'daemon off;'

# # RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
# # RUN tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
# # RUN mv phpMyAdmin-5.0.1-english phpmyadmin

# # COPY PHPMYADMIN CONF FILE
# COPY ./srcs/config.inc.php phpmyadmin

# #INSTALL WORDPRESS
# RUN wget https://wordpress.org/latest.tar.gz
# RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz

# #COPY WP CONFIG FILE 
# COPY ./srcs/wp-config.php /var/www/html

# #SSL
# RUN openssl req -x509 -nodes -days 365 -subj "/C=KR/ST=Korea/L=Seoul/O=innoaca/OU=42seoul/CN=forhjy" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

# RUN chown -R www-data:www-data *
# RUN chmod -R 755 /var/www/*
# COPY ./srcs/init.sh ./
# CMD bash init.sh

EXPOSE 80 443

# Autoindex can be turned off at the time of running the container
# sed -i "18 s/on/${AUTOINDEX}/g" /etc/nginx/sites-available/nginx.conf