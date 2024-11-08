# Usamos una imagen oficial de PHP con Apache
FROM php:8.2-apache

# Instalamos las dependencias del sistema
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    git \
    unzip \
    libxml2-dev \
    nodejs \
    npm \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo_mysql zip bcmath opcache

# Instalamos Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Habilitamos mod_rewrite
RUN a2enmod rewrite

# Copiamos el proyecto Laravel al contenedor
COPY . /var/www/html

# Creamos los directorios si no existen (para evitar problemas de permisos)
RUN mkdir -p /var/www/html/storage /var/www/html/bootstrap/cache

# Establecemos los permisos correctos para las carpetas de almacenamiento y caché
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Configuramos el archivo de configuración de Apache para apuntar a 'public'
RUN echo '<VirtualHost *:80>\n\
    ServerAdmin webmaster@localhost\n\
    ServerName localhost/\n\
    DocumentRoot /var/www/html/public\n\
    <Directory /var/www/html/public>\n\
        AllowOverride All\n\
        Options Indexes FollowSymLinks\n\
        Require all granted\n\
    </Directory>\n\
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

# Exponemos el puerto para Railway
EXPOSE 80

# Comando de inicio del contenedor
CMD ["apache2-foreground"]
