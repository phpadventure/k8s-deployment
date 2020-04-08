FROM php:7.2-fpm

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

RUN apt-get update
RUN apt-get install git-core -y

RUN apt-get install -y \
        zlib1g-dev

RUN docker-php-ext-install pdo pdo_mysql zip

RUN apt-get install libxml2-dev -y \
  && apt-get clean -y \
  && docker-php-ext-install soap

RUN apt-get install default-mysql-client -y

RUN apt-get install nginx -y

COPY nginx-app.conf /etc/nginx/conf.d/nginx-app.conf
RUN rm /etc/nginx/sites-enabled/default

WORKDIR /my-app

COPY . /my-app

RUN chmod +x /my-app/entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/my-app/entrypoint.sh"]
