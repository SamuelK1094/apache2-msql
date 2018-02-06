#/bin/bash

docker network create a2-mariadb-datacontainerEx2

docker create  --name datacontainerE2 -v /var/lib/mysql -v /var/www/html busybox

docker run --network a2-mariadb-datacontainerEx2 --name=mariadb -p 3308:3308 -d -e MYSQL_ROOT_PASSWORD=mariadb -e MYSQL_DATABASE=db -e MYSQL_USER1=samuel -e MYSQL_PASSWORD1=mariadb --volumes-from datacontainerE2 orboan/dcsss-mariadb

docker run --network a2-mariadb-datacontainerEx2 --name=apache2E2 -p 8083:80 -p 2222:22 -d --volumes-from datacontainerE2 --dns 8.8.8.8 samuelk1094/centos-httpd-php
