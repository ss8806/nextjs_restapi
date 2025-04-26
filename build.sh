#!/usr/bin/env bash
# exit on error
set -o errexit

export DJANGO_SETTINGS_MODULE=rest_api.settings

pip install -r requirements.txt

python manage.py collectstatic --noinput
python manage.py migrate
python manage.py createsuperuser --username admin --email admin@test.com --noinput
