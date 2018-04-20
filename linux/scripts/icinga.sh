#!/bin/bash

sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config
reboot

#Install NTP (Network time service)
yum install ntp.x86_64

#Start service
systemctl start ntpd

#Check NTP service working
ntpq -p

#Change /etc/php.ini file (set time)
#!!! /etc/opt/rh/rh-php71/php.ini
# Find date.timezone row and set f.e. America/Boston

#Install php-ldap package
yum install php-ldap

#Install PHP Devel
yum install php-devel

#Install repository
rpm -i http://packages.icinga.com/epel/7/release/noarch/icinga-rpm-release-7-2.el7.centos.noarch.rpm

#Verify repository installation
ls -l /etc/yum.repos.d/

#Install icinga
yum install icinga2

#Enable service
systemctl enable icinga2

#Syart service
systemctl start icinga2

#Verify service start
systemctl status icinga2

#MySQL setup
mysql -u root -p

#MySQL Commands
CREATE DATABASE icinga;
GRANT INSERT, UPDATE, DELETE, DROP, CREATE VIEW, INDEX, EXECUTE ON icinga.* to 'icinga'@'localhost' IDENTIFIED BY 'P@ssw0rd';
flush privileges;
exit

#Install ido module
yum install icinga2-ido-mysql

#Run SQL sxript
mysql -u root -p icinga < /usr/share/icinga2-ido-mysql/schema/mysql.sql

#Edit ido conf file
#/etc/icinga2/features-available/ido-mysql.conf
#set correct password!

#Check icinga features
icinga2 feature list

#Enable "command" feature
icinga2 feature enable command

#Restart Icinga service
systemctl restart icinga2

#Install CentOS SCLo RH x86_64 Repository
yum install centos-release-scl-rh

#Install icinga2-web and icinga2-CLI
yum install icingaweb2 icingacli

#Give Apache permissions for icinga
chcon -R -t httpd_sys_rw_content_t /etc/icingaweb2

#Install PHP ImageMagick module
yum install ImageMagick*

#Restart Apache
systemctl restart httpd

#Start PHP service
systemctl start rh-php71-php-fpm

#Give Apache user permissions to Icinga
groupadd -r icingaweb2;
usermod -a -G icingaweb2 apache;

#IcingaCLI post install
icingacli setup config directory --group icingaweb2;
icingacli setup token create;

#Install nagio plugin
yum install nagios-plugins-all

#Fix http warning
#Create empty file at
#/var/www/html/index.html