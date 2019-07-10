#!/bin/sh
# Change permission for all folders that might cause issues
umask 022
#chown ${HOST_USER}:${HOST_USER} -R ${SHARED_PATH}/tmp

# Warm everything up
su ${HOST_USER} -c "composer install --prefer-dist"

# We handle every application specific process with supervisor
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf

