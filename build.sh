#!/bin/bash
set -o errexit  # エラーが起きたらすぐ止める！

cd src
export PYTHONPATH=$(pwd)
export DJANGO_SETTINGS_MODULE=rest_api.settings

echo "Installing Python dependencies..."
pip install -r requirements.txt

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Applying migrations..."
python manage.py migrate

echo "Creating superuser if not exists..."
python manage.py shell << 'END'
from django.contrib.auth import get_user_model

User = get_user_model()
username = "admin"
email = "admin@test.com"
password = "adminpass00"  # ここを好きなパスワードに変えてね！

if not User.objects.filter(username=username).exists():
    User.objects.create_superuser(username=username, email=email, password=password)
    print(f"Superuser '{username}' created.")
else:
    print(f"Superuser '{username}' already exists.")
END

echo "Setup complete! 🎉"
