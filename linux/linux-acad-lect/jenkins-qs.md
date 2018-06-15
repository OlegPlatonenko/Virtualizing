# Jenkins Quick Start

```bash
#Add repo
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo

#Add keys
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

#Jenkins setup
yum install jenkins

#Install java
yum install java-1.8.0-openjdk
```
```bash
systemctl enable jenkins
systemctl start jenkins
```
```bash
yum install nginx

#Setup proxy
vim /etc/nginx/nginx.conf

#--------------------------
#location / {
#            proxy_pass http://127.0.0.1:8080;
#        }
#--------------------------
```
```bash
yum install elinks
```
```bash
#If you have error with connection to webserver via 8080
getenforce
setenforce 0
systemctl restart nginx jenkins

yum install -y setroubleshoot-server selinux-policy-devel
sepolicy network -t http_port_t
semanage port -a -t http_port_t -p tcp 8080

setenforce 1
systemctl restart nginx jenkins
```
```bash
#Set /bin/bash as default shell for 'jenkins' user
```




