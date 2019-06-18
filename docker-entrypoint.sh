#!/bin/sh
# Change permission for all folders that might cause issues
umask 022
chown ${HOST_USER}:${HOST_USER} -R ${SHARED_PATH}/application
chown ${HOST_USER}:${HOST_USER} -R ${SHARED_PATH}/log
chown ${HOST_USER}:${HOST_USER} -R ${SOURCE_PATH}/vendor

# Warm everything up
su ${HOST_USER} -c "composer install --prefer-dist"

# We handle every process with supervisor because ORO CRM requires multiple services
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
