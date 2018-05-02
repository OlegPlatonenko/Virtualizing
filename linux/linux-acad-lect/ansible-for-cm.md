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


