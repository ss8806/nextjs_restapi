#!/usr/bin/env bash
# exit on error
set -o errexit
# settings.py の場所を明示的に設定
export DJANGO_SETTINGS_MODULE=rest_api.settings # 修正箇所
pip install -r requirements.txt
python manage.py collectstatic --noinput
python manage.py migrate
python manage.py createsuperuser --username admin --email admin@test.com --noinput