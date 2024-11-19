# Utiliser l'image de base PHP 8.3 avec les outils nécessaires
FROM php:latest

# Installer les dépendances système nécessaires
RUN apt-get update && apt-get install -y \
    libpq-dev \
    unzip \
    git \
    curl \
    npm \
    && docker-php-ext-install pdo_pgsql pgsql

# Installer Composer globalement
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Créer un répertoire de travail pour le projet Laravel
COPY app /app
WORKDIR /app


# Installer les dépendances Node.js
RUN npm install
# RUN npm run build

# Donner les permissions nécessaires
RUN chmod -R 775 storage bootstrap/cache && \
    chown -R www-data:www-data storage bootstrap/cache

# Exposer le port 8080 pour le serveur
EXPOSE 8080

# Démarrer le serveur Laravel
CMD ["sh", "-c", "sleep 2 && php artisan migrate && php artisan db:seed && php artisan serve --host=0.0.0.0 --port=8080"]