# VAGRANT Commands
-------------------------------
- **/vagrant** - on guest machine is default shared folder

# Commands
- **vagrant box update** - update box version

# Creating new Box (in VirtualBox)
1. Create new VM 
- Name
- Version
- Memory
- New Virtual Disk (VMDK)

2. Modify settings
- Disable audio
- Disable USB
- NIC set to NAT
- Add port forwarding rule: 
    * Name: SSH 
    * Protocol: TCP
    * Host IP: Blank
    * Host port: 2222
    * Guest IP: Blank
    * Guest port: 22

3. Install OS
- username: vagrant
- password: vagrant

4. Set Root Password
- sudo passwd root

5. Sign is as root
- su -

6. Setup the Super User
- sudo visudo -f /etc/sudoers.d/vagrant
- in opened file write:
```
# add vagrant user
vagrant ALL=(ALL) NOPASSWD:ALL
```

7. Updating the OS
- sudo apt get update -y
- sudo apt-get upgrade -y
- sudo shutdown -r now