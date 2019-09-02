#!/bin/sh
# Change permission for all folders that might cause issues
umask 022
#chown ${HOST_USER}:${HOST_USER} -R tmp

# Wait for database to be imported
until /bin/nc -z -v -w30 projectname_server_database 3306
do
  echo "Waiting for database connection..."
  # wait for 5 seconds before check again
  sleep 5
done

# Warm everything up
su ${HOST_USER} -c "composer install --prefer-dist"

# We handle every application specific process with supervisor
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
