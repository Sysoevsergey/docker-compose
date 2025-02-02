#!/bin/sh

python manage.py migrate

python manage.py collectstatic --noinput

gunicorn stocks_products.wsgi:application --bind 0.0.0.0:8000 --timeout 60

exec "$@"