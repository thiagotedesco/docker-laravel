
#!/bin/sh

# Navegar para o diretório de trabalho
cd /var/www/html

# Instalar Laravel na pasta atual
composer create-project --prefer-dist laravel/laravel temp
mv temp/* temp/.* .
rm -rf temp

# Ajustar permissões das pastas
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
chmod -R 775 /var/www/html/storage
chmod -R 775 /var/www/html/bootstrap/cache
