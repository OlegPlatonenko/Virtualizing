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