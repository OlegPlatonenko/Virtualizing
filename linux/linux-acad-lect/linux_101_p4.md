# Devices, Linux Filesystems, Filesystem Hierarchy Standard

## 1. Create Partitions and Filesystems (FS Hierarchy standard)

- FS Hierarchy Standard defines the directory structure and contents in Unix-like operating systems
- Is maintained by **Linux Foundation**. Current is v.3
- https://wiki.linuxfoundation.org/lsb/fhs

### Directory structure

- / - root directory
- /bin - Command binaries
- /boot - Boot files
- /dev - Device files
- /etc - Host-specific config files
    - /etc/opt - Config for packages for /opt
    - /etc/sqgm - Config for SW that processes SGML
    - /etc/X11 - Configs for X Windows
    - /etc/xml - Config for XML
- /home - user home directies
- /lib - Libraries 
- /lib64 - For 64-bit systems
- /media - Mount point for CD, DVD
- /mnt - Temp mounted filesystems
- /opt - Optional app SW (often 3rd party)
- /proc - Wirtual FS providing process and kernel info 
- /root - Root user home directory
- /run - Run-time variable data
- /sbin - Essential system binaries
- /srv - Site-specific data server by the local system
- /sys - Info about devices connected
- /tmp - Temporary files
- /usr - Secondary hierarchy for read-only user data
    - /usr/bin - Non-essential command binaries
    - /usr/include - Standard include files (C/C++.h etc.)
    - /usr/lib - Libraries for the binaries in /usr/bin(sbin)
    - /usr/lib64 - For 64-bit systems
    - /usr/local - Tertiary hierarchy for local data
    - /usr/sbin - Non-essential system binaries
    - /usr/share - Architecture independent shared data
    - /usr/src - Source code (i.e. kernel)
    - /usr/X11R6 - Older X Windows configuration (optional)
- /var - Variable files whose content is expected to change
    - /var/cache - App cache data
    - /var/lib - State info
    - /var/lock - Lock files that keep track resources in use
    - /var/log - Log files
    - /var/mail - Mailbox files
    - /var/opt - Variable data from packages in /opt
    - /var/run - Run-time variable data (replaced by /run)
    - /var/spool - Spool for tasks
    - /var/tmp - Temporary files

