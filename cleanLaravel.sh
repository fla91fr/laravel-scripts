#!/bin/bash

composer -v > /dev/null 2>&1
RES=$?
if [[ $RES -ne 0 ]]; then
    echo 'Composer is not installed !'
    exit 1
else
    echo 'Composer is installed'
fi

which php > /dev/null 2>&1
RES=$?
if [[ $RES -ne 0 ]]; then
    echo 'PHP is not installed'
    exit 1
else
    echo 'PHP is installed'
fi


CMDCOMPOSER="composer"
CMDARTISAN="php artisan"

$CMDCOMPOSER clear-cache
$CMDCOMPOSER dump-autoload

echo
echo "Clear Cache facade value:"
STMT="cache:clear"
$CMDARTISAN $STMT
echo "Cache facade value cleared."

echo
echo "Clear compiled pages:"
STMT="clear-compiled"
$CMDARTISAN $STMT

echo
echo "Clear views cache:"
STMT="view:clear"
$CMDARTISAN $STMT

echo
echo "Clear config cache:"
STMT="config:cache"
$CMDARTISAN $STMT

echo
echo "Clear Route cache:"
STMT="route:clear"
$CMDARTISAN $STMT

exit 1
echo
echo "Route cache:"
STMT="route:cache"
$CMDARTISAN $STMT

