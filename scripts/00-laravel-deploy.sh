#!/usr/bin/env bash
echo 'Running composer'
cp /etc/secrets/.env .env
composer install --no-dev --working-dir=/var/www/html
 
echo 'Caching config...'
php artisan config:cache
 
echo 'Caching routes...'
php artisan route:cache
 
echo 'Running migrations...'
php artisan migrate --force

echo 'Seeding tables...'
php artisan db:seed