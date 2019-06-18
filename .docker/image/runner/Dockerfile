FROM php:7.2-cli-alpine3.9

# Install selected extensions and other stuff
RUN apk update
RUN apk add bash
RUN apk add ca-certificates
RUN apk add curl
RUN apk add openssh-client
RUN apk add wget
RUN apk add git
RUN apk add rsync
RUN apk add docker
RUN apk add composer

COPY ./config/php/7.2/php.ini $PHP_INI_DIR/php.ini

RUN composer global require hirak/prestissimo
RUN composer global require phing/phing

ENV PATH="$PATH:/root/.composer/vendor/bin"
