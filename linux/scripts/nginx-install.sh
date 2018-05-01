#Add repository
vim /etc/yum.repos.d/nginx.repo

#Paste in file:
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/$basearch/
gpgcheck=0
enabled=1

#Update repository
yum update

#Install Nginx
yum install nginx

#Start nginx service
systemctl start nginx
systemctl enable nginx