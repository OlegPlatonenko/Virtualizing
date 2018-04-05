# Hardware settings

## Table of contents

- [1. Special file systems](#SFS)
- [2. Hardware Settings Configuration](#HSK)
- [3. Boot the system](#BTS)

## 1. Special file systems <a name="SFS"></a>

- **SUDO file system** - file system whcih contains info about hardware and the state of the sytem

- **proc fs** - system hardware and state

```bash
#Short file system info 
df -f

#Full info
cat /etc/fstab
```
- Every subfolder in **/proc** folder is responsible for process PID

```bash
#Get info about processor interrupts
cat /proc/interrupts

#Get info about I/O ports
cat /proc/ioports
```

- DMA (Direct memory access) is a feature for a driver to access memory without calling a processor

```bash
cat /proc/dma
```

- **sys fs** - responsible for kernel modules and hardware associated to system

```bash
#Working directory
/sys
```

- **udev** - is system (device manager) which is responsible for all devices. 

```bash
#Device file
/dev
```

## 2. Hardware Settings Configuration <a name="HSK"></a>

```bash
#Show the status of modules in the linux kernel
lsmod

#Show CPU architecture
lscpu
lscpu -ae

#Disk info
lsblk
lsblk -f
lsblk -t

#PCI bus info
lspci
lspci -v
lspci -m

#SCSI and SATA devices
lsscsi

#USB devices info
lsusb

#RAID info
lsraid

#List all devices
lsdev
```

## 3. Boot the system <a name="BTS"></a>

### a) sysvinit

- Package, containing a group of processes that are responsible 
- for controlling the basic functions of the system

- It includes the *init* app, which is very first app started by 
- the kernel after the boot loader starts the boot process

- *Init* program controlls the startup, running and stutdown of
- all the programs

#### sysvinit runlevels

- 0 - HALT (Shutdown)
- 1 - Single User
- 2 - Multi-User (w/a networking)
- 3 - Full Multi-User
- 4 - Unused
- 5 - X11 (full Multi-User with GUI)
- 6 - Reboot

```bash
#Config files
cat /etc/inittab
```

#### Boot process 

1. Power on
2. BIOS (EFI)
3. Primary disk's 'boot sector'
4. Boot sector provides MBR (Master Boot Record)
5. Boot loader is executed
6. LILO/GRUB/GRUB2 begins
7. User Input
8. Linux kernel is read and executed
9. Device initialization, module loading, initial RAM is loaded
10. Root filesystem is mounted
11. The 'init' program loads (/sbin/init)
12. /etc/inittab is read and run appropriate scripts
13. Modules indicated
14. Root filesystem checked
15. Remaining local filesystem are mounted
16. Network devices are started
17. Remote filesystems are mounted
18. Init process rescans /etc/inittab for complete script exec
19. Runlevel scripts are executed in numeric order
20. TTY sessions are loaded
21. System login promt is displayed

### b) systemd

- Initialization system for bootstrapping the user space
- and managing all processes subseqent to system start.

- Designed to replace *sysvinit*

#### Systemd runlevels

- 0 - poweroff.target (Sutdown)
- 1 - single.target (Single User/Rescue Shell)
- 2 - multi-user.target(Non-Graphical, Full Network, Multi-User)
- 3 - multi-user.target(Non-Graphical, Full Network, Multi-User)
- 4 - multi-user.target(Non-Graphical, Full Network, Multi-User)
- 5 - graphical.target (Graphica Desktop, Multi-User)
- 6 - reboot.target (Reboot)

```bash
#Config files
cd /usr/lib/systemd/system
ls -al *.target

ls -al default.target
```

#### Boot process

1. Power on
2. BIOS (EFI) 
3. Primary disk's 'boot sector'
4. Boot sector provides MBR (Master Boot Record)
5. Boot loader is executed
6. LILO/GRUB/GRUB2 begins
7. User Input
8. Linux kernel is read and executed
9. Device initialization, module loading, initial RAM is loaded
10. Root filesystem is mounted
11. systemd runs
12. Default run target is executed
13. Modules indicated
14. Root filesystem checked
15. Remaining local filesystem are mounted
16. Network devices are started
17. Remote filesystems are mounted
18. systemd sets the runlevel as indicated in the def target
19. System login promt is displayed

### Init and RC Scripts

```bash
#Debian/Ubuntu init scripts location
/etc/init.d/

#RedHat/CentOS init scripts location
/etc/init.d/rc.d
```

### systemd targets location

```bash
cd /usr/lib/systemd/system
ls -al *.target

ls -al default.target
```






