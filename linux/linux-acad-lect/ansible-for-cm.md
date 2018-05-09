# Ansible for Configuration Management

## Ansible architecture

![Ansible architecture](https://github.com/OlegPlatonenko/net-sys-administration/blob/master/linux/images/ansible_fig.png)

## YAML Structure

```yaml
---# List
- Item_1
- Item_2
- Item_3

#Alternative format (inline)
[Item_1, Item_2, Item_3]
```

```yaml
---# Associative Array/Key Value Pairs
Item_1: Value_1
Item_2: Value_2
Item_3: Value_3

#Alternative format (inline)
{Item_1: Value_1, Item_2: Value_2, Item_3: Value_3}
```

```yaml
123         #Integer
"123"       #String
123.0       #Float
!!float 123 #Float
!!str 123   #String
```

```yaml
---# Playbook Description
- hosts: appserver
  tasks:
  - name: Install Lynx on App Servers
    yum: pkg=lynx state=installed update_cache=true
  - name: Querying to Telnet Install
    yum: pkg=telnet state=present update_cache=true
```

## Ansible Modules

```bash
#Get full list of available modules in the system
ansible-doc -l

#Get info about particular module
ansible-doc <module key_word>
```

## Test Environment Setup

- Create user for Ansible and copy **ssh** to all servers

```bash
#Add user
adduser ans-test
passwd ans-test

#Create folder for playbooks and make Ansible user as owner
mkdir playbook
chown ans-test:ans-test playbook/

#Relogin as ans-test
su - ans-test

#Generate ssh-keys and copy to all servers
ssh-keygen
ssh-copy-id <internal_ip>
ssh <internal_ip> #test connection
```

## Ansible Installation

```bash
#Install repository
yum install epel-release
yum update repolist
yum update
yum install ansible

#For ubuntu see Ansible documentation
```

## Ansible Config File

- /etc/ansible/ansible.cfg
- Enable logging! (log_path = /var/log/ansible.log)

## Ansible Python Dependencies

```bash
#List all Python components
yum list intalled | grep python
dpkg -l | grep python #On Debian/Ubuntu
```

## The HOSTS file

- /etc/ansible/hosts

```bash
#Hosts file example
[local]
localhost

[apacheweb]
192.168.204.129

[appserver]
192.168.204.130
[ans-test@localhost ansible]$
```

## Overriding Default HOSTS File

```bash
#Get list of Ansible environment
ansible all --list-hosts

#Tell Ansible to use local hosts file (by -i key)
ansible myubuntu -i hosts -m ping
```

## Overriding Default System Ansible.cfg File

```bash
#Config file
/etc/ansible/ansible.cfg

#!!!Ansible will look for cfg file in user home directory
export ANSIBLE_CONFIG=<path to new configs folder>
```

- **Ansible config priority**

1. environment variable ANSIBLE_CONFIG
2. folder which command is run
3. user home directory
4. /home/user_name/.ansible.cfg
5. /etc/ansible/ansible.cfg

## Overriding Default Roles Path

- **Ansible.cfg**
```
# additional paths to search for roles in, colon separated
roles_path    = /etc/ansible/roles:<custom path to 'Roles' folder>
```

## Configuring Your 'Ansible' Account

- **Sudoers setup for 'Ansible user'**
```bash
visudo 
#Add rows as below:
root    ALL=(ALL)       ALL
ansible ALL=(ALL)       NOPASSWD: ALL
```
```bash
cd /etc/ansible
vim ansible.cfg

#Comment row below
ask_sudo_pass = True
```
```bash
ssh-copy-id localhost
```

## Ansible Command Line

```bash
ansible all --list-hosts
ansible all -m ping

#Get list of python packages installed
ansible appserver -s -m shell -a 'yum list installed | grep python'

#Install telnet
ansible all -s -m shell -a 'yum install telnet'
```

## System Facts



