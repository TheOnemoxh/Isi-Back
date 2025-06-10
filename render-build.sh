#!/usr/bin/env bash

echo "📦 Instalando dependencias..."
pip install -r requirements.txt

echo "🔧 Ejecutando migraciones..."
python manage.py migrate

echo "🎨 Recolectando archivos estáticos..."
python manage.py collectstatic --no-input
