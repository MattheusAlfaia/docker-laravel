FROM php:fpm-alpine3.20

# Instalar dependências
RUN apk add --no-cache \
    bash \
    curl \
    libpng-dev \
    libzip-dev \
    zlib-dev

# Instalar extensões PHP
RUN docker-php-ext-install gd \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql

# configurar Alias do laravel sail
# RUN echo "alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'" >> ~/.bashrc

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Permissões de execução do Composer
RUN chmod +x /usr/bin/composer

# Install node and npm
RUN apk add --no-cache nodejs npm

# Definir diretório de trabalho
WORKDIR /var/www

# Copiar configuração do PHP
COPY dockerfiles/php/custom.ini /usr/local/etc/php/conf.d/custom.ini

EXPOSE 9000