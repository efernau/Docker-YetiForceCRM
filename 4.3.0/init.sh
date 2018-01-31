#!/bin/sh


# Remove Apache PID lock file so apache can start next time
rm -f /run/apache2/apache2.pid

# Start Apache
apachectl -DFOREGROUND
