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

## 2. Partitions and Filesystem creation (fdisk, gdisk, parted)

For details see the Lab

```bash
#Get list of disk devices
fdisk -l
gdisk -l
```

## 3. Filesystem Types and Creating Them on Partitions

For details see the Lab

- 

```bash
#Get inodes (index number) which related to a file
ls -i <file_path>
stat <file_path> #more detailed
df -i
```

### ext File system

- ext2 - Linux Extended
- ext3 - Linux Extended with journalling
- ext4 - Linux Extended with journalling with performance improvements

### xfs File System

- Has enhance performance (IO Block:2049)

### btr File System

- Special for large files

### Format drive with particular filesystem

```bash
#Create filesystem in partition (eample)
mkfs -t ext3 /dev/xvdg1
mkfs -t xfs /dev/xvdg1

#Use config file
/etc/mke2fs.conf
mke2fs -t ext3 /dev/xvdg1

#Override config file
mkfs -t ext4 -b 8192 -m 10 -L LargeData - O sparse_super /dev/xvdg2
- b - change block size
- m - 10% space for root user
- L - disk label
- O - override config file
```

## 4. Maintein the Integrity of Filesystems

```bash
#Define how mutch space dir use
du <dir_path>
du -h <dir_path>
- h - show values (K,M,G)

du -sh <dir_path>
- sh - total for directory
- ah - show for all files
```

```bash
#Work with filesystem
df -h
- h - human readable foramt

df -ah 
- ah - show for all (even empty) systems
- th - show total
```

```bash
#File system debugger
debugfs <partition>
```

```bash
#File system check (generally used for ext FS)
fsck <partition>
fsck -f <partition>
- f - force check
- C - progress bar
- N - drive run (what might been run)
- V - verbose output

#!!! Not run on MOUNTED FS
``` 

```bash
#Tune filesystem
tune2fs -c <partition>
- c - number of mount counts before fsck will be run automatically

tune2fs -e <continue/panic/remount-ro> <partition>
```

```bash
#xfs utilities
yum install xfsprogs
```

## 5. Control the Mounting and Unmounting of FS

- **Mount points**
- /media - for CD, DVD, USB
- /mnt - for Drives

```bash
#Mount info
mount
cat /etc/mtab
cat /proc/mounts

#Mount FS
mount -t <FS type> <partition> <device>
mount -t ext4 /dev/xvdf1 /mnt/part1

#Define UUID
ll /dev/disk/by-uuid
blkid

#fstab file
/dev/mapper/centos-root /                       xfs     defaults        0 0

0 - do not dump a FS as a file
0 - order in what FS will be checked

#Unmount partition
umount <partition_point>

#Define who is using a partition
fuser -m <partition_point>
```

## Manage Disk Quotas

```bash
#When partition is used for user quotas, two parameters need to be added to fstab
UUID=5a5686c5-4938-4ca2-b125-72d0aaffeade   /mnt/part1   ext4 defaults,usrquota, grpquota 1 2

#Set 777 permission to partition
chmod 777 part1

#Running quotacheck task
quotacheck -avugc

- a - all partitions
- v - verbose
- u - users
- g - groups
- c - create quota file

#Editing quota
edquota -u myuser 

#Quota status
quotaon -p /mnt/part1

#Turn quota ON
quotaon -uagv

#Quota report
repquota -a

#ON quotas after system start
#add command
quotaon -uagv
#to
/etc/rc.d/rc.local
```

## Manage File Permissions and Ownership

```bash
chmod 766 file_name
chmod u+x file_name
chmod u-x file_name

#Change permission not for directory but for all files inside
chmod g+w Desktop/ -R

#!!!!Default permissions
file: 666
directory: 777

#umask is set in 'bashrc' file
```

- Permission hierarchy

1. Owner
2. Group
3. User (Everyone else)