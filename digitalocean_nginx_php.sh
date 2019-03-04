#!/bin/bash
PHP_VERSION="7.3"
LANG=en_GB.UTF-8

# Add PHP 7.x.x Repository
sudo add-apt-repository ppa:ondrej/php -y

echo "----------------------"
echo "Apt get update"
echo "----------------------"
sudo apt-get -y update

echo "----------------------"
echo "Apt get upgrade"
echo "----------------------"
sudo apt-get -y upgrade

echo "----------------------"
echo "Install NGINX"
echo "----------------------"
sudo apt-get -y install nginx
rm -f /etc/nginx/sites-enabled/*
rm -f /etc/nginx/sites-available/*
rm -f /var/www/html/*

echo "----------------------"
echo "Add ufw rule for nginx : Nginx HTTP"
echo "----------------------"
sudo ufw allow 'Nginx HTTP'

# Add Module for php ${PHP_VERSION}
echo "----------------------"
echo "Install PHP ${PHP_VERSION} packages"
echo "----------------------"
sudo apt-get -y install php${PHP_VERSION}-pdo
sudo apt-get -y install php${PHP_VERSION}-mbstring
sudo apt-get -y install php${PHP_VERSION}-tokenizer
sudo apt-get -y install php${PHP_VERSION}-xml
sudo apt-get -y install php${PHP_VERSION}-curl
sudo apt-get -y install php${PHP_VERSION}-cli 
sudo apt-get -y install php${PHP_VERSION}-dev
sudo apt-get -y install php${PHP_VERSION}-gd 
sudo apt-get -y install php${PHP_VERSION}-intl 
sudo apt-get -y install php${PHP_VERSION}-mcrypt 
sudo apt-get -y install php${PHP_VERSION}-json
sudo apt-get -y install php${PHP_VERSION}-opcache
sudo apt-get -y install php${PHP_VERSION}-bcmath
sudo apt-get -y install php${PHP_VERSION}-soap
sudo apt-get -y install php${PHP_VERSION}-zip
sudo apt-get -y install php${PHP_VERSION}-sqlite
sudo apt-get -y install php${PHP_VERSION}-mysql
sudo apt-get -y install php${PHP_VERSION}-fpm
sudo apt-get -y install unzip

echo "----------------------"
echo "Change opcache config"
echo "----------------------"
echo "[opcache]" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo "opcache.enable=1" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo "opcache.enable_cli=0" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo "opcache.memory_consumption=128" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo "opcache.interned_strings_buffer=16" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo "opcache.max_accelerated_files=20000" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.max_wasted_percentage=5" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.use_cwd=1" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo "opcache.validate_timestamps=1" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo "opcache.revalidate_freq=3600" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.revalidate_path=0" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo "opcache.save_comments=0" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo "opcache.enable_file_override=1" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.optimization_level=0x7FFFBFFF" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.dups_fix=0" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.blacklist_filename=" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.max_file_size=0" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.consistency_checks=0" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.force_restart_timeout=180" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo "opcache.error_log=/var/www/html/.opcache_logs" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo "opcache.log_verbosity_level=4" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.preferred_memory_model=" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.protect_memory=0" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.restrict_api=" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.mmap_base=" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo "opcache.file_cache=/var/www/html/.opcache" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.file_cache_only=0" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.file_cache_consistency_checks=1" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.file_cache_fallback=1" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.huge_code_pages=1" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.validate_permission=0" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.validate_root=0" >> /etc/php/${PHP_VERSION}/fpm/php.ini 
echo ";opcache.opt_debug_level=0" >> /etc/php/${PHP_VERSION}/fpm/php.ini 


echo "----------------------"
echo "Remove useless packages"
echo "----------------------"
sudo apt-get -y autoremove

echo "----------------------"
echo "Composer install"
echo "----------------------"
sudo rm -rf $HOME/.composer
sudo rm -f /usr/bin/composer
sudo curl -sS https://getcomposer.org/installer | php
sudo cp composer.phar /usr/bin/composer

echo "PHP version : "
php -v |head -1

echo "NGINX version : "
nginx -v

# End
echo
echo "done!"



exit 0
