#!/bin/sh
set -e

echo ">>> [railway-start] Iniciando SGA Divino Salvador..."

# Regenerar autoload y descubrir paquetes (ya hay env vars reales aquí)
composer dump-autoload --optimize --no-interaction --no-scripts || true
php artisan package:discover --ansi || true

# Importar dump SQL solo si la BD está vacía
php artisan db:import-schema || true

# Cachear config, rutas y vistas con las env vars REALES de Railway
php artisan config:cache || true
php artisan route:cache || true
php artisan view:cache || true

# Storage link
php artisan storage:link || true

: "${PORT:=8080}"
echo ">>> [railway-start] Servidor escuchando en 0.0.0.0:${PORT}"
exec php -S 0.0.0.0:${PORT} -t public
