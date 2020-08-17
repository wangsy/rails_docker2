#!/usr/bin/env bash

# Precompile assets
yarn install
bundle exec rails assets:precompile

# Wait for database to be ready
until nc -z -v -w30 $MYSQL_HOST $MYSQL_PORT; do
 echo 'Waiting for MySQL...'
 sleep 1
done
echo "MySQL is up and running!"

# Run the Rails server
bundle exec sidekiq