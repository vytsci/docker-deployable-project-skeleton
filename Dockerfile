FROM yourdockerregistrey/projectname/base:latest

ARG HOST_USER
ARG HOST_UID
ARG HOST_GID

# Prepare user and group
RUN groupadd -g ${HOST_GID} ${HOST_USER}
RUN useradd -mr -g ${HOST_GID} -u ${HOST_UID} ${HOST_USER}

# Setup supervisor
COPY ./.docker/config/supervisor/conf.d/application.conf /etc/supervisor/conf.d/application.conf
COPY ./.docker/config/supervisor/conf.d/crontab.conf /etc/supervisor/conf.d/crontab.conf

# Setup cron
COPY ./.docker/config/crontab/application /var/spool/cron/crontabs/application

# Make sure we run PHP-FPM with proper user
RUN sed -i "s/www-data/${HOST_USER}/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/\/proc\/self\/fd\/2/\/home\/${HOST_USER}\/log\/php-fpm.log/g" /usr/local/etc/php-fpm.d/docker.conf

# Make php-fpm.log writable for our user
RUN mkdir -p /home/${HOST_USER}/log
RUN touch /home/${HOST_USER}/log/php-fpm.log
RUN chown ${HOST_USER}:${HOST_USER} /home/${HOST_USER}/log/php-fpm.log

# Prepare directories
RUN mkdir -p /usr/local/apache2/htdocs
WORKDIR /usr/local/apache2/htdocs

# Warmup should be done on build time, but ORO requires database to be available
ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["su ${HOST_USER}", "-c", "bash"]
