#!/bin/sh
set -e

echo "Directory Permission for Storage and Bootstrap"
sudo chmod 777 -R ./storage/
sudo chmod 777 -R ./bootstrap/cache/

echo "Installing Dependencies"
sudo composer install

echo "Migrating Database"
sudo php artisan migrate

echo "Refreshing Configuration"
sudo php artisan config:clear
sudo php artisan config:cache
sudo php artisan optimize:clear

echo "Deployed"
