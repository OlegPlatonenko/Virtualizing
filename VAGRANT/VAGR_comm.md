# VAGRANT Commands
-------------------------------
- **/vagrant** - on guest machine is default shared folder

# Commands
- **vagrant box update** - update box version
- **vagrant box list** - list of already created Vagrant boxes
- **vagrant box remove _boxname_** - remove selected box

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

8. Install VirtualBox
- sudo apt-get install virtualbox

9. Install Vagrant
- sudo apt-get install vagrant

10. Install the Vagrant key
- mkdir -p /home/vagrant/.ssh
- chmod 0700 /home/vagrant/.ssh
- wget --no-check-certificate \
    https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub \
    -O /home/vagrant/.ssh/authorized_keys
- chmod 0600 /home/vagrant/.ssh/authorized_keys
- chown -R vagrant /home/vagrant/.ssh

11. Install and Configure OpenSSH Server
- sudo apt-get install -y openssh-server
- sudo nano /etc/ssh/sshd_config

- Uncomment row
- AuthorizedKeysFile .ssh/authorized_keys

- restart ssh
- sudo service ssh restart

12. Installing guest tools
- sudo apt-get install -y gcc build-essential linux-headers-server (generic)

In VirtualBox browse to the Devices menu at the top, then in the drop-down list at the bottom, click on Insert Guest Additions CD Image.
This will add an ISO image to the virtual CDROM running in your server. Run these commands to mount your cdrom and then run the script. NOTE: The message about the cdrom being read-only is fine.

- sudo mount /dev/cdrom /mnt 
- cd /mnt
- sudo ./VBoxLinuxAdditions.run

13. Package the Box
- clean up drive
- sudo dd if=/dev/zero of=/EMPTY bs=1M
- sudo rm -f /EMPTY

- (On Host machine)
- mkdir ~/code/personal/vagrant_boxes
- cd ~/code/personal/vagrant_boxes
- vagrant package --base <VM Name>

15. Testing
- vagrant box add ubuntu64 package.box
- vagrant init ubuntu64
- vagrant up
- vagrant ssh