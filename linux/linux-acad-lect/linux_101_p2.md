# Linux Installation and Package Management

## Table of contents

- [1. Logical Volume Manager](#LVM)
- [2. Boot Manager Installation](#BMI)
- [3. Manage Shared Libraries](#MSL)
- [4. Debian Package Management](#DPM)
- [5. RedHat Package Management](#RPM)

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
ldd <app name>

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
#Update package cache and upgrade all software
yum update

#Install package
yum install <package_name>

#Enable single package from disabled repository
yum install -enablerepo <repository_name> <package_name>

#Download rpm and dependencies
yum install --downloadonly <package_name>

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