# Apache Tomcat 7

## Basic Setup

```bash
scp apache-tomcat-7.0.90.tar.gz oplat@34.240.75.88:/home/user

#On a target machine
tar zxvf jdk-10.0.2_linux-x64_bin.tar.gz
sudo mv jdk-10.0.2/ /opt
sudo alternatives --install /usr/bin/java java /opt/jdk-10.0.2/bin/java 2
sudo alternatives --config java

java -version
sudo alternatives --install /usr/bin/jar jar /opt/jdk-10.0.2/bin/jar 2
sudo alternatives --install /usr/bin/javac javac /opt/jdk-10.0.2/bin/javac 2

sudo alternatives --set jar /opt/jdk-10.0.2/bin/jar
sudo alternatives --set javac /opt/jdk-10.0.2/bin/javac

export JAVA_HOME=/opt/jdk-10.0.2/
export JRE_HOME=/opt/jdk-10.0.2/jre
export PATH=$PATH:/opt/jdk-10.0.2/bin:/opt/jdk-10.0.2/jre/bin

tar zxvf apache-tomcat-7.0.90.tar.gz
sudo mv apache-tomcat-7.0.90/ /opt

cd /opt/apache-tomcat-7.0.90/bin
sudo ./startup.sh

ps -aux | grep tomcat
curl http://localhost:8080
```

## User Management

Add code below to **/opt/apache-tomcat-7.0.90/conf/tomcat-users.xml**

```xml
 <role rolename="manager-gui" />
        <user username="user" password="P@ssw0rd" roles="manager-gui" />
 <role rolename="admin-gui" />
        <user username="admin" password="P@ssw0rd" roles="manager-gui,admin-gui" />
```

## Server configuration

