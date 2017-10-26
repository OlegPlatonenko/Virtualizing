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

8. Install the Vagrant key
- mkdir -p /home/vagrant/.ssh
- chmod 0700 /home/vagrant/.ssh
- wget --no-check-certificate \
    https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub \
    -O /home/vagrant/.ssh/authorized_keys
- chmod 0600 /home/vagrant/.ssh/authorized_keys
- chown -R vagrant /home/vagrant/.ssh

9. Install and Configure OpenSSH Server
- sudo apt-get install -y openssh-server
- sudo nano /etc/ssh/sshd_config

- Uncomment row
- AuthorizedKeysFile .ssh/authorized_keys

- restart ssh
- sudo service ssh restart

10. Installing guest tools
- sudo apt-get install -y gcc build-essential linux-headers-server

In VirtualBox browse to the Devices menu at the top, then in the drop-down list at the bottom, click on Insert Guest Additions CD Image.
This will add an ISO image to the virtual CDROM running in your server. Run these commands to mount your cdrom and then run the script. NOTE: The message about the cdrom being read-only is fine.

- sudo mount /dev/cdrom /mnt 
- cd /mnt
- sudo ./VBoxLinuxAdditions.run

11. Package the Box
