# Despliegue en Railway — SGA Divino Salvador

## Requisitos
- Cuenta de GitHub
- Cuenta de Railway (railway.com)

## Pasos

### 1. Subir código a GitHub
```bash
git init
git add .
git commit -m "Deploy inicial"
git branch -M main
git remote add origin https://github.com/TU-USUARIO/sga-divino-salvador.git
git push -u origin main
```

### 2. Crear proyecto en Railway
1. Ir a https://railway.com/new
2. **Deploy from GitHub repo** → seleccionar tu repo
3. Railway detectará Nixpacks automáticamente

### 3. Agregar base de datos MySQL
1. En el proyecto: `+ New` → `Database` → `Add MySQL`
2. Railway creará las variables `MYSQL_*` automáticamente

### 4. Variables de entorno del servicio web
En el servicio de la app (no en el de MySQL), pestaña **Variables**:

```
APP_NAME=SGA Divino Salvador
APP_ENV=production
APP_KEY=              ← genera con: php artisan key:generate --show
APP_DEBUG=false
APP_URL=https://${{RAILWAY_PUBLIC_DOMAIN}}

APP_LOCALE=es
APP_FALLBACK_LOCALE=es

LOG_CHANNEL=stack
LOG_STACK=single
LOG_LEVEL=error

DB_CONNECTION=mysql
DB_HOST=${{MySQL.MYSQLHOST}}
DB_PORT=${{MySQL.MYSQLPORT}}
DB_DATABASE=${{MySQL.MYSQLDATABASE}}
DB_USERNAME=${{MySQL.MYSQLUSER}}
DB_PASSWORD=${{MySQL.MYSQLPASSWORD}}

SESSION_DRIVER=database
CACHE_STORE=database
QUEUE_CONNECTION=database
FILESYSTEM_DISK=local
```

### 5. Generar dominio público
Pestaña **Settings** del servicio web → **Networking** → **Generate Domain**

### 6. Primer deploy
Railway hace deploy automático al push. El script `railway-start.sh` importa el schema SQL en el primer arranque (idempotente: no vuelve a correr si ya existe la tabla `roles`).

## Comandos útiles
- Forzar reimport del SQL: `railway run php artisan db:import-schema --force`
- Limpiar caches: `railway run php artisan optimize:clear`
