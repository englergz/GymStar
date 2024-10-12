#!/bin/bash

# Iniciar PHP-FPM
php-fpm &

# Iniciar Nginx
nginx -g 'daemon off;'
