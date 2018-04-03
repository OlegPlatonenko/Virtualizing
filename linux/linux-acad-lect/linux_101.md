# Hardware settings

## Special file systems

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


