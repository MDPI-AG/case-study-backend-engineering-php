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

# Copy existing application directory contents
COPY . .

# Set permissions (for dev environments; use better strategies for prod)
RUN chown -R www-data:www-data /var/www/html/var /var/www/html/vendor \
    && chmod -R 755 /var/www/html

# Optional: Symfony CLI (useful for local dev)
# RUN curl -sS https://get.symfony.com/cli/installer | bash && mv /root/.symfony*/bin/symfony /usr/local/bin/symfony

# Expose port if using PHP's built-in server
EXPOSE 8000

# Default command (you can override in docker-compose)
CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
