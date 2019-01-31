# Bunch of useful scripts for Laravel installations

## Script to clean caches of a Laravel installation
```
wget -O cleanLaravel.sh https://github.com/fla91fr/laravel-scripts/raw/master/cleanLaravel.sh
chmod +x cleanLaravel.sh
```
### What it does :
Clears :

 - cache
 - cache facade
 - compiled pages
 - views cache
 - config cache
 - route cache

Caches routes
Runs composer dump-autoload

### How to use : 
```
./cleanLaravel.sh
```
