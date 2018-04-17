# Ansible Quick Start

## Installation and Configuration

```bash
#Install repository
yum install epel-release
yum update

#Install system components
yum install git python python-devel python-pip openssl ansible

#Define Ansible version
ansible --version

#Config file
/etc/ansible/ansible.cfg

#---------------------------
#For quick start uncomment 
- inventory section
- sudo user - root
#---------------------------

#Ansible nodes are defined by names and listed in
/etc/ansible/hosts

#---------------------------
#hosts file example
[local]
localhost

[group_name]
server.domain.com
#---------------------------

#You need to be sudo or root to run Ansible
adduser ansible
passwd ansible

visudo

#---------------------------
## Allow root to run any commands anywhere
root    ALL=(ALL)   ALL
ansible ALL=(ALL)   NOPASSWD: ALL
#---------------------------

#Setup SSH key exchange
ssh-keygen

#Become an ansible user
su ansible -

#Setup SSH key exchange again
ssh-keygen
ssh-copy-id ansible@server-domain.com
ssh-copy-id localhost
```

## Ansible Documentation

- http://docs.ansible.com/

## Running Ansible Commands

```bash
#Command for using module
ansible all -m ping

- all - to all hosts
- m - use module

#Command for executing command
ansible all -a "ls -al /home/ansible"

- s - run as sudo

#Copy file to remote machine
ansible <remote_machine_name> -m copy -a "src=<file_name> dest=<folder_path>"

#Install package
ansible -m -a "name=<package_name> state=<state_available>"

#Create user
ansible -s -m user -a "name=<user_name>"
```
