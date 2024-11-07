# Usar la imagen oficial de PHP con Apache y PHP 8.2
FROM php:8.2-apache

# Instalar dependencias necesarias para Laravel y las extensiones de PHP que faltan
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    git \
    libicu-dev \
    libxml2-dev \
    libexif-dev \
    && apt-get install -y libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql exif intl calendar zip

# Establecer el directorio de trabajo
WORKDIR /var/www/html

# Copiar los archivos del proyecto al contenedor
COPY . /var/www/html

# Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instalar las dependencias de Laravel
RUN composer install --no-dev --optimize-autoloader

# Exponer el puerto 80
EXPOSE 80

# Hacer que Apache se ejecute en segundo plano
CMD ["apache2-foreground"]
