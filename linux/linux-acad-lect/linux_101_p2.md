# Linux Installation and Package Management

## Table of contents

- [1. Logical Volume Manager](#LVM)
- [2. Boot Manager Installation](#BMI)
- [3. Manage Shared Libraries](#MSL)
- [4. Debian Package Management](#DPM)
- [5. RedHat Package Management](#RPM)
- [6. Work on the Command Line](#WCL)
- [7. Environment Variables](#EV)>
- [8. Using Filters 1](#UF1)
- [9. Using Filters 2](#UF2)
- [10. File Management](#FM)

## 1. Logical Volume Manager <a name="LVM"></a>

- Set of tools for allocating disks, striping, mirroring and resizing
- logical volumes

### LVM Components

- PV (Physical Volumes)
- VG (Volume Group)
- LV (Logical Volume)

## 2. Boot Manager Installation <a name="BMI"></a>

- Legacy GRUB Boot Manager
- GRUB2 Boot Manager

### GRUB (Grand Unified Bootloader) Functionality

- Boot OS
- Boot to Kernel
- Add commands

### GRUB Config

- Main config file **grub.conf** (/boot/grub)

### GRUB2 Config

- Main GRUB directory - **/boot**
- Main config file **grub.cfg** (/boot/grub2)
- use **/etc/grub.d** and **/etc/default/grub** for config purposes

- **List of config files (GRUB/GRUB2)**:
- **message** file - binary kernel messages file
- **vmlinz-...** - kernel
- **System.map-...** - File map
- **initrd** - initial RAM disk
- **config-...** - special kernel config files
- **symvers-...** - modules compiled for kernel version

```bash
#Upadate grub config after changes
grub2-mkconfig > /boot/grub2/grub.cfg
```

## 3. Manage Shared Libraries <a name="MSL"></a>

- Files which containes reusable functions (*.so)

### Directories

- /lib/*.so
- /usr/lib/*.so
- /usr/lib64/*.so
- /usr/local/lib/*.so
- /usr/share/*.so

### Application to libraty link types

- **1. Static** - application has full copy of the library
- **2. Dynamic linking** - application use library externally

```bash
#Show all libraries which app use
ldd <app name> / <path to app>

#Configure dynamic ling boundaries
ldconfig

#Conf file
/etc/ld.so.conf

#Config directory
/etc/ld.so.conf.d

#Cache file
/etc/ld.so.cache

#Environment variable
$LD_LIBRARY_PATH
```

## 4. Debian Package Management <a name="DPM"></a>

### Default repositories

- location: **/etc/apt**
- **sources.list** - default repository list file

- **deb-src** - packages with source code

- additional repository location **/etc/apt/sources.list.d**
- you may add you own repository here.

```bash
#Updating local cache
apt-get update

#Install package
apt-get install <package_name>

#Remove package
apt-get remove <package_name>

#Complete remove
apt-get purge <package_name>

#Search for package
apt-cache search <package_name>

#Get more package info
apt-cache show <package_name> 
apt-cache showpkg <package_name>

#Upgrading
apt-get upgrade

#Upgrade to next distribution
apt-get dist-upgrade
```

### dpkg Package Installer

```bash
#Only download package content (*.deb)
apt-get install -d <package_name>

#Default download *.deb files folder
/var/cache/apt/archives/

#Package info
dpkg --info <package_name>
dpkg --status <package_name>

#See content
dpkg --contents <package_name>

#Installation
dpkg -i <package_name>
dpkg --install <package_name>

#Removing
dpkg -r <package_name>
dpkg --remove <package_name>

#Remove everyhing
dpkg -P <package_name>
dpkg --purge <package_name>

#Install all missed dependencies
apt-get install -f

#List files in package
dpkg -L <package_name>
dpkg -list <package_name>

#Serach file in package database
dpkg -S <path to file>
dpkg -search <path to file>

#Force installation
dpkg -i --force-depends <package_name>
dpkg -i --force-conflicts <package_name>
dpkg -i --force-reinstreq <package_name>

#Reconfiguration
dpkg-reconfigure <package_name>
```

## 5. RedHat Package Management <a name="RPM"></a>

- **YUM** - Package Manager
- **RPM** - Package Manager installator

### Config file and directory

- **/etc/yum/conf** - config file for YUM
- **/etc/yum.repos.d/** - config directory
- **/var/log/yum.log** - log file

```bash
#List all installed packages
yum list installed

#Update package cache and upgrade all software
yum update

#Install package
yum install <package_name>

#Enable single package from disabled repository
yum install -enablerepo <repository_name> <package_name>

#Download rpm and dependencies
yum install --downloadonly <package_name>

#Delete with all config files
yum autoremove <package_name>

#Default download directory
/var/cache/yun/x86_64/7/base/packages

#Yumdownloader tool
yumdownloader --source <package_name>
yumdownloader --urls <package_name>
yumdownloader --destdir <path> <package_name>
#Resolve dependencies
yumdownloader --resolve <package_name>
```

### rpm Package Installer

- **rpm database** location - /var/lib/rpm

```bash
#Istallation
rpm -ivh <package_name>

- i - Install
- v - Verbose
- h - Hash (progress bar)

#Remove application
rpm -e <package_name>

#Queries
rpm -q <searching_word>

#Detailed info
rpm -qi <package_name>

#Package files
rpm -ql <package_name>

#Info from file
rpm -qip <file_name *.rpm>

#Requirements
rpm -qR <package_name>

#Force action
--force

#Install without dependencies
--nodeps

#Verify package integrity
rpm -V <package_name>

#Verify all packages
rpm -Va
rpm -Vac

- c - only config files

#Upgrade package
rpm -Uvh <package_name>

#Unpacking rpm archive with cpio
rpm2cpio <package_name> > <file_name>.cpio
cpio -idmv < <file_name>
```

## 6. Work on the Command Line <a name="WCL"></a>

### Shell types

- csh
- ksh
- zsh

- login
- non-login shell

### Scripts execution

- *.sh
- service files (no ext.)
- **/usr/bin** - common script location

### Profile files run order

- All files are located in *Home* directory
- .bash_profile -> .bashrc -> .bash_logout


### Profile files run priority (if previous doesn't exist)

1. .bash_profile
2. .bash_login
3. .profile

### User change!!!

```bash
sudo su -

- "-" - apply all scripts end environmental variables to new user
```

### Executing multiple commands

```bash
& - run in the background
&& - run next if previous true
|| - run next if previous false
; - wharever

/bin/true && echo "This executed"
/bin/false || echo "This executed"

yum update && yum install -y telnet 
```

### Exitcodes

```bash
0 - success
1 - 127 - unsuccess

$? - request exitcode for previous command
```

## 7. Environment Variables <a name="WCL"></a>

```bash
#Show environment variables
set | more
env | more
shopt

#Turn option on
set -o

#Turn option off
set +o

#Adding folder to a PATH variable
export PATH = $PATH:<folder_path>
```

## 8. Using Filters 1 <a name="UF1"></a>

```bash
#Sorting
sort <file_name>

#Sort by number
sort -n <file_name>

#Sort by delimited field
sort -k<field_number> <file_name>

#----------------------------------

#Add line numbering
nl <file_name>

#Assign number to blank lines
nl -ba <file_name>

#----------------------------------

#Count number of lines
wc -l <file_name>

#Count number of words
wc -w <file_name>

#Count number of characters
wc -c <file_name>
cat /var/log/messages | wc -l

#----------------------------------

#Change tabs interval
expand -t <spacing_number> <file_name>

#----------------------------------

#Cut fields
cut -d<delimeter> -f <filed_number> <file_name>
cut -d: -f 1 columns.txt

#----------------------------------

#File concatination
paste <file_name1> <file_name2>

#Combine files with redundance removing
join <file_name1> <file_name2>

#Extract unique data from file
uniq <file_name>

#Return duplicated lines
uniq -d <file_name>
uniq -D <file_name>

#----------------------------------

#Look at the top of the file
head <file_name>
head -n <number_of_lines> <file_name>

#Look at the buttom of the file
tail <file_name>
tail -n <number_of_lines> <file_name>
tail -f head <log_file_name>
```

## 9. Using filters 2 <a name="UF2"></a>

```bash
#Split file
split -a <split_index_number> <file_name>
split -a 4 <file_name>

#Split by size
split -b <bytes> <file_name>
split -K <Kilobytes> <file_name>
split -M <Megabytes> <file_name>

#Split by lines number
split -l <number_of_lines>

#----------------------------------

#Look at binaty file (decimax. hex, etc. format)
od <file_name>

#----------------------------------

#Format output (print format)
pr <file_name>
fmt <file_name>

fmt -15 <file_name> | pr --columns=2 -h "Header text"

#----------------------------------

tr <expression> < <file_name>
tr 'a' 'A' < alpha.txt

sed <expression> <file_name>
sed 's/the/THE/g' example.txt
sed -e 's/the/THE/g' -e 's/NOW/NEVER/g' example.txt
sed -f <options_file_name> <file_name>

#----------------------------------

more -d <file_name> 
- d - display tips options

less <file_name>
```

## 10. File Management <a name="FM"></a>

```bash
#Full directory listing with hidden files
ls -al 

#Create directory with subdirectory
mkdir -p mydir1/dir1/dira/dirA

#Determine file type
file <file_name>

#Set timestamp for file
touch -t YYYYMMDDHHMM <file_name>
touch -t 201801021234 example.txt

#File or system status
stat -f <file_name>
stat -t <file_name>

#Copy directory
cp -r <directory_name> 
cp -i <directory_name> 

- i - ask for overriting
- f - force
- u - update with newer 
- x - ignore other filesystems

#Remove directory
rm -r <directory_name>

- f - force

#Search for file
find <search_path> -name <file_name> -print

- print - is optional
- iname - ignore case sentitivity
- user  - find files belong to user
- exec  - make sime action with search result
- {}    - for each search result 
- \;    - end of exec command

find /home/user -iname "config_*.sh" -exec chmod 777 {} \;

#Create backup images / CD-DVD *.iso
dd if=/dev/sr0 of=imgbkup.iso

#Backup MBR
dd if=/dev/xvde of=mbrbackup.img count=1 bs=512
```