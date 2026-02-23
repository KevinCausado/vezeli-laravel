# Vezeli E-Commerce - Contexto del Proyecto

## ¿Qué es este proyecto?
**Vezeli** es una tienda de e-commerce basada en **Bagisto** (Laravel 10), adaptada para el mercado colombiano. Vende productos de belleza/cosméticos (maquillaje, perfumes, cuidado personal).

- **URL local:** `http://localhost:8000`
- **Admin:** `http://localhost:8000/admin`
- **Idioma:** Español (`es`)
- **Zona horaria:** America/Bogota

## Stack tecnológico
- **Laravel 10** + **PHP 8.1+**
- **Bagisto** (framework e-commerce modular, 30 módulos en `packages/Webkul/`)
- **Vue.js** + **Vite** (frontend)
- **MySQL** → base de datos: `laravel_vezeli`
- **XAMPP** (entorno local, phpMyAdmin en `localhost:8080/phpmyadmin`)

## Cómo ejecutar el proyecto

```bash
# 1. Dependencias (solo si no están instaladas)
composer install
npm install

# 2. Generar key si APP_KEY está vacío
php artisan key:generate

# 3. Levantar servidor
php artisan serve

# 4. Frontend (otra terminal)
npm run dev
```

## Estructura importante

```
vezeli-laravel/
├── packages/Webkul/       # Módulos de Bagisto (NO modificar directamente)
│   ├── Admin/             # Panel de administración
│   ├── Shop/              # Tienda del cliente
│   ├── Product/           # Gestión de productos
│   ├── Category/          # Categorías
│   ├── Customer/          # Cuentas de clientes
│   ├── Checkout/          # Carrito y checkout
│   ├── Sales/             # Órdenes y ventas
│   ├── MagicAI/           # Integración OpenAI
│   └── ...28 módulos más
├── app/                   # Código Laravel personalizado (mínimo)
├── config/                # Configuraciones (28 archivos)
├── lang/                  # Traducciones (20 idiomas)
├── resources/themes/      # Temas personalizados (gitignored)
└── storage/app/public/    # Imágenes (productos, categorías)
```

## Base de datos

- **Conexión:** MySQL en `127.0.0.1:3306`
- **BD:** `laravel_vezeli` (con guion bajo, NO guion)
- **Usuario:** `root` sin contraseña
- **Tablas clave:**
  - `products` → productos principales
  - `product_flat` → datos desnormalizados para búsqueda rápida
  - `product_images` → imágenes
  - `product_inventories` → stock
  - `categories` → categorías

> **Nota:** El nombre `laravel-vezeli` con guion causaba errores `#1932` en MySQL. Se renombró a `laravel_vezeli` con guion bajo.

## Estado actual del proyecto

- 33-34 productos cargados con imágenes
- Localizado en español para Colombia
- Módulos activos: todos los de Bagisto por defecto
- Temas: compilados (build en `public/themes/`) pero sin personalización rastreada en git

## Ramas de git

| Rama | Descripción |
|---|---|
| `main` | Rama principal y más actualizada |
| `feature/traduccion` | Traducciones y sistema de e-commerce |
| `feature/amazon-cloud` | Pruebas de despliegue en cloud |
| `feature/modulo_de_seguridad` | Módulo de usuarios y seguridad |

## Mejoras pendientes / posibles

### Alta prioridad
- [ ] Configurar credenciales de pago (PayPal en `.env`)
- [ ] Personalizar tema de la tienda (`resources/themes/`)
- [x] ~~Configurar correo real (SMTP) para notificaciones a clientes~~ ✓ Hecho (Gmail SMTP)
- [ ] Ajustar precios y moneda a COP

### Media prioridad
- [ ] Configurar MagicAI (OpenAI) para descripciones de productos automáticas
- [ ] Activar caché de página completa (FPC) para mejor rendimiento
- [x] ~~Configurar social login (Google) con credenciales OAuth~~ ✓ Hecho
- [ ] Configurar Elasticsearch para búsqueda avanzada

### Baja prioridad / Futuro
- [ ] Agregar tests con Pest
- [ ] Configurar Redis para sesiones y caché
- [ ] Definir estrategia de despliegue (Docker, Nixpacks, u otro)
- [ ] Crear módulo Webkul personalizado para funciones específicas de Vezeli
- [ ] Configurar sitemap y SEO

## Historial de cambios

| Fecha | Cambio |
|---|---|
| 2026-02-23 | Correo SMTP configurado con Gmail (kevincausado@gmail.com) |
| 2026-02-23 | Social Login con Google configurado y activado en Admin |
| 2026-02-23 | CLAUDE.md creado con contexto del proyecto |
| 2026-02-23 | Remoto `gitea` eliminado, solo se usa GitHub (`origin`) |
| 2026-02-23 | BD renombrada de `laravel-vezeli` a `laravel_vezeli` (fix error #1932) |

## Variables de entorno importantes (`.env`)

```env
APP_NAME="Vezeli E-commerce"
APP_URL=http://localhost:8000
APP_LOCALE=es
APP_TIMEZONE=America/Bogota

DB_DATABASE=laravel_vezeli
DB_USERNAME=root
DB_PASSWORD=          # vacío en local

MAIL_MAILER=log       # solo guarda en log, no envía emails reales
```

## Cosas a tener en cuenta

- Los módulos de Bagisto están en `packages/Webkul/` — son como paquetes de composer pero en el repo. Para personalizarlos, se recomienda sobrescribir vistas/controladores en el `app/` o crear un nuevo módulo Webkul.
- El frontend usa **Vue.js** y **Vite**. Los assets compilados van a `public/themes/`.
- `resources/themes/` está en `.gitignore` — los cambios de tema no se rastrean actualmente.
- El guion en nombres de BD (`laravel-vezeli`) causa problemas en MySQL en Windows. Siempre usar guion bajo.
