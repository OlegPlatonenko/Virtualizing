# Common Linux commands

-----------------------------------------

## TABLE OF CONTENTS
- [1.  SERVICES/PROCESSES](#ServProc)
- [14. PERMISSIONS](#Perm)

## 1. SERVICES/PROCESSES <a name="ServProc"></a>

service --status-all - get status list
ps fawx - return list of processes
ps aux  - ---"---

## 2. NETWORK

ifconfig -a - get list of network adapters
lshw -class network - ----"----
netstat -a - list of ports
ip route | grep default - get default gateway
cat /etc/resolv.conf - DNS info

### Disable wain online network service

```
systemctl disable systemd-networkd-wait-online.service
systemctl mask systemd-networkd-wait-online.service
```

### Network config file

```bash
/etc/network/interfaces

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
tar -xvzf file.tar.gz - unzip file

sudo dpkg -i /path/to/file *.deb

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
- pwsh

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

## 10. GREP

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


## 11. FOLDER PERMISSIONS

```
sudo chown -R <username> <folder path>
```

## 12. ADD USER TO SUDOERS

```
usermod -aG sudo username
```

- At **/etc/sudoers** file add line
```
<username>   ALL=(ALL:ALL) ALL
```

## 13. USER MANAGEMENT

```bash
#Get list of local users
cut -d: -f1 /etc/passwd
```

```bash
#Add new user
sudo adduser new_username
sudo useradd new_username
```

```bash
#Delete user
sudo userdel user_name

#Delete home directory for user account
sudo rm -r /home/user_name
```

```bash
#Modify username or user
usermod -l new_username old_username
```

```bash
#Change a password for user
sudo passwd user_name
```

```bash
#Change a shell for user
sudo chsh user_name
```

```
#Change detail for user
sudo chfn user_name
```
## 14. PERMISSIONS <a name="Perm"></a>

### Permission types

- Read
- Write
- Execute

### Users

- Users info is stored at **/etc/passwd** file
- Provided info
    * user_name
    * UID
    * GroupID
    * home_directory

```
root@SRV02:/home/test/net-sys-administration# cat /etc/passwd | grep test
test:x:1000:1000:test,,,:/home/test:/bin/bash
testtest:x:1001:1001:thisis test user:/home/testtest:
```

### Groups

- Groups info is stored at **/etc/group** file
- Provided info
    * group_name
    * GroupID
    * members username

```
adm:x:4:syslog,test
syslog:x:108:
```

### Permission review

```
root@SRV02:~# ls -l /etc/passwd
-rw-r--r-- 1 root root 2972 Mar  5 21:46 /etc/passwd

```

- **-**     passwd is regular file
- **rw-**   permission for the owner
- **r--**   permission for the group
- **r--**   all other users
- **root**  owner
- **root**  group which users can read

```
root@SRV02:~# ls -l /bin/ls
-rwxr-xr-x 1 root root 129696 Oct  4 15:56 /bin/ls
```
- **r-x**  execution permission (read and execute)

```
root@SRV02:~# ls -l /
drwxr-xr-x   2 root root 12288 Mar  2 10:35 bin
```
- **d**    directory

### Permission change (chmod)

```
root@SRV02:~# touch script.sh
root@SRV02:~# ls
example-voting-app  script.sh
root@SRV02:~# ls -l script.sh 
-rw-r--r-- 1 root root 0 Mar 19 22:15 script.sh
root@SRV02:~# chmod 755 script.sh 
root@SRV02:~# ls -l script.sh 
-rwxr-xr-x 1 root root 0 Mar 19 22:15 script.sh
```

- CHMOD settings
    * 0 No permissions granted
    * 4 Execute
    * 2 Write
    * 1 Read

- Another option
```
root@SRV02:~# chmod u+rwx,g+rw,o+rx script.sh 
root@SRV02:~# ls -l script.sh 
-rwxrwxr-x 1 root root 0 Mar 19 22:15 script.sh

root@SRV02:~# chmod u+rwx,go+rw script.sh 

root@SRV02:~# chmod go-w script.sh 
root@SRV02:~# ls -l script.sh 
-rwxr-xr-x 1 root root 0 Mar 19 22:15 script.sh
```

### Default permissions

- Use umask command to manage def permissions

```
root@SRV02:~# umask 777
root@SRV02:~# touch script1.sh
root@SRV02:~# ls -l
total 8
drwxr-xr-x 7 root root 4096 Mar  2 07:30 example-voting-app
---------- 1 root root    0 Mar 19 22:25 script1.sh
-rwxr-xr-x 1 root root   11 Mar 19 22:22 script.sh
```

- To set *umask* forewer add it to *~/.bashrc* file

### Access control lists (ACL)

Use **getfacl** command to view ACL's

```
root@SRV02:~# getfacl script.sh 
# file: script.sh
# owner: root
# group: root
user::rwx
group::r-x
other::r-x
```

Use **setfacl** command to modify ACL
- **-m** flag to add permission
- **-x** flag to remove permission

```
root@SRV02:~# setfacl -m u:test:rwx script.sh 
root@SRV02:~# getfacl script.sh 
# file: script.sh
# owner: root
# group: root
user::rwx
user:test:rwx
group::r-x
mask::rwx
other::r-x
```

```
root@SRV02:~# ls -l script.sh 
-rwxrwxr-x+ 1 root root 11 Mar 19 22:22 script.sh
```
- **+** - ACL is added to the file