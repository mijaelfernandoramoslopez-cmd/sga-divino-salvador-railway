#!/bin/sh
set -e

echo ">>> [railway-start] Iniciando SGA Divino Salvador..."

# Importar el dump SQL solo si la tabla 'roles' no existe (idempotente)
php artisan db:import-schema || true

# Enlace de storage (por si acaso)
php artisan storage:link || true

# Puerto por defecto si Railway no lo pasa
: "${PORT:=8080}"

echo ">>> [railway-start] Servidor escuchando en 0.0.0.0:${PORT}"
exec php -S 0.0.0.0:${PORT} -t public
