#!/bin/bash

#install Apache
yum install httpd

#Start service
systemctl start httpd

#Enable service
systemctl enable httpd

#Open firewall port
firewall-cmd --permanent --add-service=http

#Restart firewall daemon
systemctl restart firewalld

#Install wget to download files from internet
yum install wget

#Install yum repository for MySQL server (define latest link from web-browser)
wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
rpm -ivh mysql57-community-release-el7-11.noarch.rpm

#Check correct repository installation
ls -l /etc/yum.repos.d/mysql-community*

#Install MySQL Server
yum install mysql-server

#Start and check MySQL status
systemctl start mysqld
systemctl status mysqld

#grep temporary password for MySQL Server
grep 'temporary password' /var/log/mysqld.log

#Start security configuration and set new passwod. Hit "y" to all prompted questions
mysql_secure_installation

#PHP Installation
yum install php php-mysql php-gd php-pear

#Check php correct installation
vim /var/www/html/testphp.php

#Add lines
#<?php
#phpinfo();
#?>

#Restart Apache
systemctl restart httpd 

#Install phpAdmin
yum install http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm
yum install phpmyadmin

#Modify /etc/httpd/conf.d/phpMyAdmin.conf
#Comment section below:

#<Directory /usr/share/phpMyAdmin/>
#   AddDefaultCharset UTF-8
#
#   <IfModule mod_authz_core.c>
#     # Apache 2.4
#     <RequireAny>
#       Require ip 127.0.0.1
#       Require ip ::1
#     </RequireAny>
#   </IfModule>
#   <IfModule !mod_authz_core.c>
#     # Apache 2.2
#     Order Deny,Allow
#     Deny from All
#     Allow from 127.0.0.1
#     Allow from ::1
#   </IfModule>
#</Directory>

#Add section (without comments)

#<Directory /usr/share/phpMyAdmin/>
#        Options none
#        AllowOwerride Limit
#        Require all granted
#</Directory>

#Modify /etc/phpMyAdmin/config.inc.php
#Change 'cookie' to 'http' in $cfg['Servers'][$i]['auth_type'] 

#Restart Apache service
systemctl restart httpd
