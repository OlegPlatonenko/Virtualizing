# Linux Installation and Package Management

## Table of contents

- [1. Logical Volume Manager](#LVM)
- [2. Boot Manager Installation](#BMI)
- [3. Manage Shared Libraries](#MSL)
- [4. Debian Package Management](#DPM)

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