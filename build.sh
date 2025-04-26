#!/usr/bin/env bash
# exit on error
set -o errexit

export PYTHONPATH=$(pwd)

echo "=== 現在のディレクトリ ==="
pwd
echo "=== ディレクトリ内容 ==="
ls -l
echo "=== rest_api内容 ==="
ls -l rest_api

pip install -r requirements.txt

python manage.py collectstatic --noinput
python manage.py migrate
# 初回デプロイの時のみ
# python manage.py createsuperuser --username admin --email admin@test.com --noinput