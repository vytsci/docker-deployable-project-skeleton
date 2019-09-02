FROM php:7.2-fpm

# Install selected extensions and other stuff
RUN apt-get update

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash

RUN apt-get -y install supervisor
RUN apt-get -y install cron
RUN apt-get -y install unzip
RUN apt-get -y install nano
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
RUN apt-get -y install nodejs
RUN apt-get -y install yarn
RUN apt-get -y install git
RUN apt-get -y install netcat

# Clean up all the mess
RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Prepare supervisor
RUN groupadd -g 1100  supervisor
COPY ./config/supervisor/supervisord.conf /etc/supervisor/supervisord.conf

# Install & configure php extensions
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) pdo_mysql mysqli bcmath intl mbstring zip soap tidy opcache gd
RUN pecl install xdebug
RUN pecl install redis
RUN docker-php-ext-enable xdebug
RUN docker-php-ext-enable redis
COPY ./config/php/7.2/php.ini $PHP_INI_DIR/php.ini

# Install composer
RUN curl -ksS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
ENV PATH /root/.composer/vendor/bin:$PATH

# Install dependencies
RUN composer global require hirak/prestissimo
RUN composer global require phing/phing
