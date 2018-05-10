# Ansible for Configuration Management

## 1. Ansible architecture

![Ansible architecture](https://github.com/OlegPlatonenko/net-sys-administration/blob/master/linux/images/ansible_fig.png)

## 2. YAML Structure

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

## 3. Ansible Modules

```bash
#Get full list of available modules in the system
ansible-doc -l

#Get info about particular module
ansible-doc <module key_word>
```

## 4. Test Environment Setup

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

## 5. Ansible Installation

```bash
#Install repository
yum install epel-release
yum update repolist
yum update
yum install ansible

#For ubuntu see Ansible documentation
```

## 6. Ansible Config File

- /etc/ansible/ansible.cfg
- Enable logging! (log_path = /var/log/ansible.log)

## 7. Ansible Python Dependencies

```bash
#List all Python components
yum list intalled | grep python
dpkg -l | grep python #On Debian/Ubuntu
```

## 8. The HOSTS file

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
## 9. Overriding defaults

## 9.1 Overriding Default HOSTS File

```bash
#Get list of Ansible environment
ansible all --list-hosts

#Tell Ansible to use local hosts file (by -i key)
ansible myubuntu -i hosts -m ping
```

## 9.2 Overriding Default System Ansible.cfg File

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

## 9.3 Overriding Default Roles Path

- **Ansible.cfg**
```
# additional paths to search for roles in, colon separated
roles_path    = /etc/ansible/roles:<custom path to 'Roles' folder>
```

## 10. Configuring Your 'Ansible' Account

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

## 11. Ansible Command Line

```bash
ansible all --list-hosts
ansible all -m ping

#Get list of python packages installed
ansible appserver -s -m shell -a 'yum list installed | grep python'

#Install telnet
ansible all -s -m shell -a 'yum install telnet'
```

## 12. System Facts

```bash
ansible local -s -m setup > /home/test/net-sys-administration/linux/configs/sysinfo.json

ansible local -s -m setup -a 'filter=*ipv4*
```

## 13. Common Values for Playbooks

```bash
ansible local -m setup -a 'filter=ansible_architecture'
ansible local -m setup -a 'filter=ansible_distribution'
ansible local -m setup -a 'filter=ansible_distribution_version'
ansible local -m setup -a 'filter=ansible_domain'
ansible local -m setup -a 'filter=ansible_fqdn'
ansible local -m setup -a 'filter=ansible_interfaces'
ansible local -m setup -a 'filter=ansible_kernel'
ansible local -m setup -a 'filter=ansible_processor'
ansible local -m setup -a 'filter=ansible_memtotal_mb'
```

## 14. First Playbook

```bash
ansible local -s -m shell -a 'yum install lynx'
ansible local -s -m yum -a 'pkg=lynx state=installed update_cache=true'
```

```yaml
- hosts: appserver
  tasks:
  - name: Install Lynx on App Server
    yum: pkg=lynx state=installed update_cache=true
```
```bash
ansible-playbook -s appserver.yaml

PLAY [appserver] *****************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [192.168.204.130]

TASK [Install Lynx on App Server] ************************************************
changed: [192.168.204.130]

PLAY RECAP ***********************************************************************
192.168.204.130            : ok=2    changed=1    unreachable=0    failed=0
```

## 15. Inclusion Types

```yaml
- hosts: appserver
  vars_files:
  - vars.yaml
  vars: 
    control_server: localhost
    web_root: /var/www/html/
  tasks:
  - name: Install Lynx on App Server
    yum: pkg=lynx state=installed update_cache=true
```
```yaml
control_server: localhost
web_root: /var/www/html/
```

## 16. Playbook Sections

## 16.1 Target Selection

```yaml
--- # My First YAML Playbook for Ansible
- hosts: appserver
  user: ans-test
  sudo: yes
  connection: ssh
  gather_facts: no
```

## 16.2 Variable Section

```yaml
vars:
    playbook_version: 0.1b
  vars_files:
    - conf/copyright.yml
    - conf/webdefaults.yml
  vars_prompt:
    - name: web_domain
      prompt: web domain
```

## 16.3 Task Section

```yaml
tasks:
    - name: Install Lynx Web Browser
      action: yum name=lynx state=installed
    - name: Check for Telnet Client
      action: yum name=telnet state=absent
```

## 16.4 Handler Section

```yaml
- name: Install Apache Web Server
      action: yum name=httpd state=installed
      notify: Restart nginx
  handlers:
    - name: Restart nginx
      action: service name=nginx state=restarted
```

## 17. Outlining Your Playbook

```yaml

```