#!/bin/bash
PHP_VERSION="7.3"
LANG=en_GB.UTF-8

# Add PHP 7.x.x Repository
sudo add-apt-repository ppa:ondrej/php -y

#Install MySQL APT GPG key
sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 5072E1F5

# Copy filename from http://dev.mysql.com/downloads/repo/apt/
mysql_apt_deb_file=mysql-apt-config_0.8.9-1_all.deb

# Add MySQL 5.7.x Repository
curl -LO http://repo.mysql.com/${mysql_apt_deb_file}
echo mysql-apt-config mysql-apt-config/select-product          select Apply              | sudo debconf-set-selections
echo mysql-apt-config mysql-apt-config/select-server           select mysql-5.7          | sudo debconf-set-selections
echo mysql-apt-config mysql-apt-config/select-connector-python select none               | sudo debconf-set-selections
echo mysql-apt-config mysql-apt-config/select-workbench        select none               | sudo debconf-set-selections
echo mysql-apt-config mysql-apt-config/select-utilities        select none               | sudo debconf-set-selections
echo mysql-apt-config mysql-apt-config/select-connector-odbc   select connector-odbc-x.x | sudo debconf-set-selections
export DEBIAN_FRONTEND=noninteractive
sudo -E dpkg -i ${mysql_apt_deb_file}

# Update
sudo apt-get -y update

# PHP Modules for Apache
#sudo apt-get -y install libapache2-mod-php7.2
#sudo a2dismod php5
#sudo a2enmod php7.2

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

# Upgrade MySQL Version 5.7.x
sudo apt-get -y install mysql-server
sudo service mysql start
sudo mysql_upgrade -u root --force --upgrade-system-tables

# Create User and Database
mysql -u root -e "create user homestead;create database homestead;grant all on homestead.* to homestead@localhost identified by 'secret';"

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
