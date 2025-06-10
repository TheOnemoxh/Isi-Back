#!/usr/bin/env bash

echo "📦 Instalando dependencias..."
pip install -r requirements.txt

echo "🔧 Ejecutando migraciones..."
python manage.py migrate

echo "🎨 Recolectando archivos estáticos..."
python manage.py collectstatic --no-input

echo "👤 Creando superusuario por script..."

echo "
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@example.com', 'admin123')
" | python manage.py shell
