# Linux Essentials

## 1. Typical commands

- **Alt + F2** - open command box

## 2. Linux concepts

- GNU is not UNIX
- GNU/Linux - makes fully operating system

- Soft should be free
- All apps shoul be distributed with source code

## 3. Linux distributions

### Linux distribution architecture

1. Linux Cernel
2. Core utilities (bash, networking, file system tools)
3. Supplemental Software
4. System Services
5. Software Management

### Common linux distribution

- Slackware - Compile yourself all soft
- Debian - Servers
- RedHat - Servers, DataCenter
- SUSE - Server, DataCenter
- Ubuntu - Usability, Desktop
- Fedora - Desktop
- OpenSUSE - Desktop
- CentOS -  Servers

### Embedded Systems

- SmartTV
- Vehicle
- Set-top-box
- GPS
- Medical
- Space
- Networking

## 4. Open source applications

### Environments

- GNOME Classic (RH7, CentOS7, Ubuntu)
- KDE (OpenSUSE)
- XFCE (Fedora)
- Enlightement
- LXDE

### User Applications

- Firefox
- Terminal
- Libre Office (Open Office)
- GIMP (graphic Image Manipulation Program)

### Server Applications

Server is a powerful computer that 'serves' data from itself to client systems

#### Common network ports

```
-----------------------------------------------
Port number | Protocol | Server Application   |
-----------------------------------------------
|    22     |  SSH     |    OpenSSH           |
|    23     | TELNET   |    telnetd           |
|    25     |  SMTP    | PostFix, Sendmail    |
|    53     |  DNS     | BIND, named, unbound |
|    67     |  BOOTP   |   dnsmasq, dhcpd     |
|    80     |  HTTP    |   Apache, nginx      |
|    443    | HTTPS    |   Apache, nginx      |
-----------------------------------------------
```

#### Applications

1. File sharing - NFS, Samba/CIFS
2. Database Server - MySQL/MariaDB/PostgreSQL
3. Printing Server - CUPS


## 5. Development languages

- Cathedral Model
- Bazaar Model

### Compiled Languages

- C
- C++

### Interpreter Languages

- Python
- Java
- Perl
- PHP

### Assembly Languages

## 6. Package management Tools

### a) Package parts

- Dependency information (software, libraries)
- Version information
- Architecture information 932/64 bit, ARM, RapsberryPi)

### b) Installation way

- **Installing from Source** *tar/gz files* (Slack,Gentoo Linux distributions)
- **Pre-built Packages** *.RPM/.deb files*

#### RPM (RedHat package manager) .rpm

**Distributions**

- RedHat Enterprise Linux
- Fedora
- CentOS
- SUSE
- openSUSE

**Package managers**

- YUM (command line) - RH Ent, Fedora, CentOS
- Zyper (command line) - SUSE, openSUSE
- GNOME Software (graphical) - RH Ent, Fedora, CentOS
- YaST (graphical) - SUSE, openSUSE

#### Debian .deb

**Distributions**

- Debian
- Ubuntu
- LinuxMint
- Elementary OS

**Package managers**

- Aptitude (command line)
- GNOME Software (graphical)

### YUM commands

```bash
#YUM repository folder
cd /etc/yum.repos.d

#Search for package
yum serach search_word

#Get info for package
yum info package_name

#Install package
yum install package_name

#Check installation
yum list installed package_name

#See package dependencies
yum deplist package_name

#Remove software
yum remove package_name

#Remove software with not used dependencies
yum autoremove package_name

#Check for deleted software
which package_name
yum list installed package_name

#get repository list
yum repolist

#Clear yum updates database
yum clean all

#System update
yum update
```

### RPM

```bash
#Install package
rpm -ivh package_name (rpm file)

- i - install
- v - Verbose
- h - progress bar (command operation

#Query package
rpm -q package_name
rpm -qi package_name
rpm -ql package_name
rpm -qd package_name
rpm -qR package_name
rpm -qpR package_name (rpm file)

- i - more details
- l - list of files installed
- d - documentation
- R - requirements (dependencies)

#Software update
rpm -Uvh package_name (rpm file)

#Remove sotware
rpm -e --test package_name
```

### APT

```bash
#APT repository file
/etc/apt/sources.list

#Update repository info
apt update

#Update system
apt upgrade
apt full-upgrade

#Search for package to install
apt-cache search package_name

#Install software
apt install package_name

#Remove software
apt remove package_name
apt remove --purge package_name

--purge - remove all config files

#Remove unused files
apt autoremove


