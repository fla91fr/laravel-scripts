#!/bin/bash
PHP_VERSION="7.3"
LANG=en_GB.UTF-8

echo "Remove mysql"
sudo apt-get remove -y mysql-*
echo "Remove traces of mysql"
sudo apt-get purge -y mysql-*

#Remove useless packages
sudo apt autoremove

# Add PHP 7.x.x Repository
sudo add-apt-repository ppa:ondrej/php -y

# Update
sudo apt-get -y update

#upgrade OS
sudo apt-get upgrade

# Add Module for php ${PHP_VERSION}
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

#Remove useless packages
sudo apt autoremove

# Composer install 
sudo rm -rf $HOME/.composer
sudo rm -f /usr/bin/composer
sudo curl -sS https://getcomposer.org/installer | php
sudo cp composer.phar /usr/bin/composer

# Remove File and Folder
rm ${mysql_apt_deb_file}

echo "PHP version : "
php -v |head -1

echo
echo "Mysql version : "
mysql -V |head -1

# End
echo
echo "done!"



exit
