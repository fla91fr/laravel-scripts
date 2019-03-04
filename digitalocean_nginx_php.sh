#!/bin/bash
PHP_VERSION="7.3"
LANG=en_GB.UTF-8

# Add PHP 7.x.x Repository
sudo add-apt-repository ppa:ondrej/php -y

# Update
echo "----------------------"
echo "Apt get update"
echo "----------------------"
sudo apt-get -y update

echo "----------------------"
echo "Install NGINX"
echo "----------------------"
sudo apt install nginx

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
sudo apt-get -y install unzip

echo "----------------------"
echo "Remove useless packages"
echo "----------------------"
sudo apt autoremove

echo "----------------------"
echo "Composer install"
echo "----------------------"
sudo rm -rf $HOME/.composer
sudo rm -f /usr/bin/composer
sudo curl -sS https://getcomposer.org/installer | php
sudo cp composer.phar /usr/bin/composer

echo "PHP version : "
php -v |head -1

# End
echo
echo "done!"



exit 0
