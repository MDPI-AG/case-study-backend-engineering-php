FROM php:8.2-cli

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    curl \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
    libicu-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libxslt-dev \
    libpq-dev \
    zlib1g-dev \
    libmcrypt-dev \
    libssl-dev \
    libsqlite3-dev \
    && docker-php-ext-configure zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
    intl \
    pdo \
    pdo_mysql \
    zip \
    opcache \
    gd \
    xsl \
    sockets \
    pcntl

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Create working directory
WORKDIR /var/www/html

# Copy the entire project
COPY . .

# Install PHP dependencies via Composer
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Set permissions (dev setup — adjust for production as needed)
RUN chown -R www-data:www-data /var/www/html/var /var/www/html/vendor \
    && chmod -R 755 /var/www/html

# Expose port for Symfony
EXPOSE 8000

# Start the Symfony app using the built-in server
CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
