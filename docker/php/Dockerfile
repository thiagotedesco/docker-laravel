FROM php:8.2-fpm
LABEL authors="thiago.tedesco"

# Atualizar e instalar dependências
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libonig-dev \
    libzip-dev \
    libgd-dev

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instalar extensões PHP
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
RUN docker-php-ext-configure gd --with-external-gd
RUN docker-php-ext-install gd

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Copiar o script e ajustar permissões
COPY install_laravel.sh /var/tmp/install_laravel.sh
RUN chmod +x /var/tmp/install_laravel.sh

# Adicionar e configurar o usuário
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# Alterar o usuário atual para www
USER www

# Definir o diretório de trabalho
WORKDIR /var/www/html

# Comando de inicialização padrão (se aplicável)
CMD ["php-fpm"]