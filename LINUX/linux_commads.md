# Common Linux command

-----------------------------------------

## 1. SERVICES

service --status-all - get status list

## 2. NETWORK

ifconfig -a - get list of network adapters
lshw -class network - ----"----
netstat -a - list of ports
ip route | grep default - get default gateway
cat /etc/resolv.conf - DNS info

```bash
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
iface eth0 inet static
    address 10.0.0.41
    netmask 255.255.255.0
    network 10.0.0.0
    broadcast 10.0.0.255
    gateway 10.0.0.1
    dns-nameservers 10.0.0.1 8.8.8.8
    dns-domain acme.com
    dns-search acme.com
```

## 3. INSTALLERS

wget  -O /home/omio/Desktop/ "http://thecanadiantestbox.x10.mx/CC.zip" - download file from internet
tar xvzf file.tar.gz - unzip file

## 4. SETUP SSH

```bash
- sudo apt-get install openssh-server
- sudo  service ssh status - must be running
- check port settings
- sudo lsof -i | grep ssh
- netstat -l --numeric-ports | grep 22

-----------------------------------------

- mkdir ~/.ssh
- chmod 0700 ~/.ssh
- touch ~/.ssh/authorized_keys
- chmod 0644 ~/.ssh/authorized_keys
- paste ssh key in format ssh-rsa SSH_KEY
```

## 5. INSTALL POWERSHELL (UBUNTU)

-----------------------------------------

- **Import the public repository GPG keys**
- curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

- **Register the Microsoft Ubuntu repository**
- curl https://packages.microsoft.com/config/ubuntu/17.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft.list

- **Update the list of products**
- sudo apt-get update

- **Install PowerShell**
- sudo apt-get install -y powershell

- **Start PowerShell**
- powershell

## 6. APACHE2

- Install Apache2 package
    sudo apt-get install apache2

- Show Apache2 cache
    apt-cache show apache2

- Apache2 service status
    service apache2 status

- Create own simple site

```bash
    sudo mkdir -p /var/www/test.com
    cd /var/www/test.com
    sudo nano index.html
```

- Create virtual host file

```bash
    cd /etc/apache2/sites-available/
    sudo nano test.com.conf

Inside file:

<VirtualHost *:80>
    ServerAdmin carla@localhost
    DocumentRoot /var/www/test.com
    ServerName test.com
    ServerAlias www.test.com
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

    sudo a2ensite test.com.conf
```

## 7. UPGRADE

sudo do-release-upgrade -d

## 8. INSTALL DESKTOP ENVIRONMENT

- Unity (The Default Desktop)
    * sudo apt-get install ubuntu-desktop
- KDE
    * sudo apt-get install kubuntu-desktop
- LXDE (Lubuntu)
    * sudo apt-get install lubuntu-desktop
- MATE
    * sudo apt-get install mate-desktop
- Gnome
    * sudo apt-get install ubuntu-gnome-desktop
- XFCE (Xubuntu)
    * sudo apt-get install xubuntu-desktop

## 9. DEPLOY APPLICATION

1. install python-pip
    sudo apt-get install python pip

## GREP

- find string in file
```bash
grep <string> <file name> 
```

- find word in file
```bash
grep -i <string> <file name> 
```

- common egrep using
```bash
egrep --color -i -n -A <number> -B <number> <string to find> <file path>

i.e.
egrep --color -i -n -A 5 -B 5 "Error" /var/log/messages
```

- -i - return lines with string as whole word
- -n - return line numbers
- -A - print number of lines after match
- -B - print number of lines before match
- --color - mark with color string match

## DNS

```bash
sudo vi /etc/network/interfaces
```

- Set IP to static

```
sudo apt-get -y update
sudo apt-get -y install bind9 bind9utils bind9-doc
```

- Configure BIND9 to run in IPv4
```
$ sudo vi /etc/default/bind9

# run resolvconf?
RESOLVCONF=no

# startup options for the server
OPTIONS="-4 -u bind"  
``` 

### DNS Configuration

The primary configuration file for the BIND DNS server named process is **/etc/named.conf** (**/etc/bind/named.conf** in Ubuntu/Debian). 

It includes three additional configuration files: **named.conf.options, named.conf.local, and named.conf.default-zones**.

### DNS Server logs

```

```

### DNS Zones

- **Zone** is a part of domain name system tree which is located on one DNS-server. It also may be called *zone of responsibility*.

#### Difference between zone and domain

If we have domain *boston.edu* with 1 DNS-zones *math.boston.edu* so all machines are members of boston.edu domain but some of them are members of math.boston.edu DNS zone, not boston.edu

### FQDN (Fully Qualified Domain Name)

```
host.systems.com.
 |      |   | | |
 |      |   | |  +- root domain
 |      |   | +---- first level domain (TLD - top level domains)
 |      |   +------ dot between domains, parts of FQDN
 |      +---------- second level domain
 +----------------- subdomain/third level domain, maybe hostname
```
### Resource entry

- NAME - domain name or IP address
- TTL (Time to Live) - time for storing entry in DNS cache
- CLASS - network type (in 99% cases IN (Internet) is used)
- TYPE - entry type, syntax and purpose
- DATA - different info which format and syntax is defined by type

Current symbols may be used:
- ;  - comment
- @  - name of current domain
- () - data may use a few rows
- *  - metasymbol (only in NAME field)

#### Resource entries types

## Folder permissions 

```
sudo chown -R <username> <folder path>
```