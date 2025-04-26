#!/usr/bin/env bash
# exit on error
set -o errexit

echo "=== 現在のディレクトリ ==="
pwd
echo "=== ディレクトリ内容 ==="
ls -l

export PYTHONPATH=$(pwd)

pip install -r requirements.txt

python manage.py collectstatic --noinput
python manage.py migrate
python manage.py createsuperuser --username admin --email admin@test.com --noinput