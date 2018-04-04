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
