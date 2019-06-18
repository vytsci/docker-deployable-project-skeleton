FROM php:7.2-apache

# Install selected extensions and other stuff
RUN apt-get update
RUN apt-get -y install nano
RUN apt-get -y install unzip
RUN apt-get -y install nodejs
RUN apt-get -y install libaio-dev
RUN apt-get -y install libfreetype6-dev
RUN apt-get -y install libjpeg62-turbo-dev
RUN apt-get -y install libpng-dev
RUN apt-get -y install zlib1g-dev
RUN apt-get -y install libicu-dev
RUN apt-get -y install libxml2-dev
RUN apt-get -y install libtidy-dev
RUN apt-get -y install libldb-dev
RUN apt-get -y install libpq-dev

# Clean up all the mess
RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Prepare php
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) pdo_mysql mysqli bcmath intl mbstring zip soap tidy opcache gd

# Setup apache2
RUN rm -rf /etc/apache2/sites-enabled/*
RUN rm -rf /etc/apache2/sites-available/*
RUN a2enmod proxy_fcgi rewrite vhost_alias speling ssl

VOLUME /var/www/html
