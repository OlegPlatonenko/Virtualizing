# Linux Installation and Package Management

## Table of contents

- [1. Logical Volume Manager](#LVM)
- [2. Boot Manager Installation](#BMI)

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

- Main config file **grub.cong** (/boot/grub)

### GRUB2 Config

- Main GRUB directory - **/boot**
- use **/etc/grub.d** and **/etc/default/grub** for config purposes

```bash
#Upadate grub config after changes
grub2-mkconfig > /boot/grub2/grub.cfg
```
