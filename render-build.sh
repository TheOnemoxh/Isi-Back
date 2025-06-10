#!/usr/bin/env bash

echo "📦 Instalando dependencias..."
pip install -r requirements.txt

echo "🔧 Ejecutando migraciones..."
python manage.py migrate

echo "🎨 Recolectando archivos estáticos..."
python manage.py collectstatic --no-input

echo "👤 Creando superusuario por script personalizado..."

echo "
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(correo='admin@example.com').exists():
    User.objects.create_superuser(
        correo='admin@example.com',
        password='admin123',
        nombres='Admin',
        apellidos='Dev',
        celular='1234567890',
        es_conductor=False
    )
" | python manage.py shell
