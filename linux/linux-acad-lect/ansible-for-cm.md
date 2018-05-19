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

- /configs/webserver.txt
- /configs/webserver.original

## 18. Optimizing Your Playbook

- /configs/webserver.yml

## 19. Taking Playbook for Dry Run

```bash
ansible-playbook <playbook_name> --check
```

## 20. Asychronous Polling

```yaml
tasks:
    - name: Install Lynx Web Browser
      action: yum name=lynx state=installed
      async: 300
      poll: 3
```

- async: - ansible wait the command to complete (milisecinds)
- poll: - how often to check for command completion (seconds)

## 21. Simple Variable Substitution

- {{ variable_name }} - use variable

```yaml
tasks:
    - name: Install Some package
      action: yum name={{ pkg_name }} state=installed
```

## 22. Lookups

- Use environment variable in lookups

```yaml
--- # LOOKUP PLAYBOOK EXAMPLE
- hosts: appserver
  user: ans-test
  sudo: yes
  connection: ssh
  gather_facts: no
  tasks:
   - debug: msg="{{ lookup('env', 'HOME') }} is the value listed"
```

## 23. RunOnce

```yaml
--- # RUN ONCE PLAYBOOK EXAMPLE
- hosts: all
  user: ans-test
  sudo: yes
  connection: ssh
  gather_facts: no
  tasks:
  - name: Run the uptime command on all hosts and log it
    raw: /usr/bin/uptime >> /home/ans-test/uptime.log
  - name: List the /var directory and log it
    raw: ls -al /var >> /home/ans-test/dir.lost
    run_once: true
```

## 24. Local Actions

```yaml
--- # LOCAL ACTION PLAYBOOK
- hosts: 127.0.0.1
  connection: local
  tasks:
  - name: Install Telnet Client
    yum: pkg=telnet state=present
```

## 25. Loops

```yaml
  tasks:
  - name: Add a list of users
    user: name={{ item }} state=present      
    with_items:
    - user1
    - user2
    - user3
```

## 26. Conditionals

```yaml
tasks:
  - name: Install Apache Appropriate to the Distribution Type
    command: apt-get -y install apache2
    when: ansible_os_family == "Debian"
  - name: Install Apache Appropriate to the Distribution Type (RedHat/CentOS)
    command: yum -y install httpd
    when: ansible_os_family == "RedHat"
```

## 27. Until

```yaml
tasks:
  - name: Installing Apache Web server
    yum: pkg=httpd state=latest
  - name: Verify Service Status
    shell: systemctl status httpd
    register: result
    until: result.stdout.find("active (running)") != -1
    retries: 5
    delay: 5
  - debug: var=result
```

## 28. Notify

```yaml
tasks:
  - name: Install HTTPD Server
    action: yum pkg=httpd state=installed
    notify: Restart HTTPD
  handlers:
  - name: Restart HTTPD
    action: service name=httpd state=restarted
```

## 29. Vault

```bash
#Create encrypted file
ansible-vault create secure.yml

#Edit encrypyted file
ansible-vault edit secure.yml

#Change password
ansible-vault rekey secure.yml

#Unencrypt file
ansible-vault decrypt secure.yml

#Encrypt file
ansible-vault encrypt accounts.yml 

#Run vault file
ansible-playbook waitfor.yml --ask-vault-pass
```

## 30. Prompt - Interactive Playbook

```yaml
vars_prompt:
  - name: pkgtoinstall
    prompt: Install Which Package?
    default: telnet
    private: no
  tasks:
  - name: Install indicated package
    yum: pkg={{ pkgtoinstall }} state=latest
```

## 31. Basic Include Statements

```yaml
#plays/packages.yml
- name: Install telnet
  yum: pkg=telnet state=latest
- name: Install lynx
  yum: pkg=lynx state=latest
```

```yaml
tasks:
  - include: plays/packages.yml
```

## 32. Tags

```yaml
--- # TAG FUNCTIONALITY EXAMPLE
- hosts: appserver
  user: ans-test
  sudo: yes
  connection: ssh
  gather_facts: no
  tasks:
  - name: Install the telnet and lynx packages
    yum: pkg={{ item }} state=latest
    with_items:
    - telnet
    - lynx
    tags:
    - packages
  - name: Verify telnet was installed
    raw: yum list installed | grep telnet > /home/ans-test/pkg.log
    tags:
    - verification
  - name: Verify lynx was installed
    raw: yum list installed | grep lynx > /home/ans-test/pkg.log
    tags:
    - always
```
```bash
ansible-playbook tags.yml --tags "verification"
ansible-playbook tags.yml --skip-tags "packages"
```

## 33. Basic Error Handling

```yaml
tasks:
  - name: Execute a command that will fail
    command: /bin/false
    ignore_errors: yes
  - name: Install telnet client
    yum: package=telnet state=latest
```

## 34. Breaking Your Playbook Into Discrete Plays

```yaml
vars_files:
  - variables/variables.yml
  tasks:
  - include: packages/packages.yml
  - include: commands/commands.yml
  handlers:
  - include: handler/handler.yml
```

## 35. Starting At Task or Stepping Through All Tasks

```bash
#Start from some step
ansible-playbook startat.yml --start-at-task='Install lynx'

#Ask for each task
ansible-playbook startat.yml --step

```
```yaml
--- # START AT PLAYBOOK EXAMPLE
- hosts: appserver
  user: ans-test
  sudo: yes
  connection: ssh
  gather_facts: no
  tasks:
  - name: Install telnet
    yum: pkg=telnet state=latest
  - name: Install lynx
    yum: pkg=lynx state=latest
  - name: List HOME
    command: ls -al /home/ans-test
    register: result
  - debug: var=result
```

## 36. Passing Variables Into Playbooks at the Command Line

```bash
ansible-playbook FromCommandLine.yml --extra-vars "hosts=appserver user=ans-test pkg=telnet"
```
```yaml
--- # VARIABLES FROM COMMAND LINE EXAMPLE
- hosts: '{{ hosts }}'
  user: '{{ user }}'
  sudo: yes
  connection: ssh
  gather_facts: no
  tasks:
  - name: Install package
    yum: pkg={{ pkg }} state=latest
```

## 37. Using Jinja2 Templates

```yaml

```





