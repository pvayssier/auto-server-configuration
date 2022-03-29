#!/usr/bin/env bash

if [[ ! -d /srv/backup/ ]]
then
    sudo mkdir /srv/backup
fi
if [[ ! -d /srv/backup/server/ ]]
then
    sudo mkdir /srv/backup/server
fi
if [[ ! -d /srv/backup/log/ ]]
then
    sudo mkdir /srv/backup/log
fi
if [[ ! -d /srv/backup/db/ ]]
then
    sudo mkdir /srv/backup/db
fi
if [[ ! -d /srv/backup/conf/ ]]
then
    sudo mkdir /srv/backup/conf
fi

if [ "$(ls -A /var/www/ 2> /dev/null)" ]
then
    name=("/srv/backup/server/server_$(date +"%y%m%d_%H%m%S").tar.gz")
    cd /var/www/
    /usr/bin/tar -czvf "$name" * &> /dev/null
fi

if [ "$(ls -A /var/log/nginx/ 2> /dev/null)" ]
then
    name=("/srv/backup/log/lognginx_$(date +"%y%m%d_%H%m%S").tar.gz")
    cd /var/log/nginx/
    /usr/bin/tar -czvf "$name" * &> /dev/null
fi

if [ "$(ls -A /var/lib/mysql 2> /dev/null)" ]
then
    name=("/srv/backup/db/db_$(date +"%y%m%d_%H%m%S").tar.gz")
    cd /var/lib/mysql
    /usr/bin/tar -czvf "$name" * &> /dev/null
fi

