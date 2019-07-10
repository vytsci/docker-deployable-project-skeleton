FROM httpd:2.4

# Install selected extensions and other stuff
#RUN apt-get update
#RUN apt-get -y install nano

# Clean up all the mess
#RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Setup apache2
RUN rm -rf /etc/apache2/sites-enabled/*
RUN rm -rf /etc/apache2/sites-available/*
RUN a2enmod proxy_fcgi rewrite vhost_alias speling ssl

VOLUME /var/www/html
