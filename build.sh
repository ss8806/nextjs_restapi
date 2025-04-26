#!/usr/bin/env bash
# exit on error
set -o errexit

pip install -r requirements.txt

python manage.py collectstatic --noinput
python manage.py migrate

# パスワード付きでスーパーユーザー作成
python manage.py createsuperuser --noinput --username admin --email admin@test.com || true
