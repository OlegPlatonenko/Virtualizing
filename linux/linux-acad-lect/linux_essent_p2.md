# Linux Essentials Part 2

## 1. Command line basics

### ls

```bash
#Show content
ls

#Show all files
ls -a

#Detailed view
ls -l

#.<file name> - hidden files

#Soft detailed view by file size
ls -Sl

#Sort in reverse
ls -lrS

#Show directory content
ls -l directory_name

#Show sub-directory content
ls -R directory_name

#Sort items by time
ls -lt
```

### $PATH

```bash
#Define directory which soft was installed
which program_name

#F.E.
which ls
/bin/ls

#Get list of environment variables
env
set

#See environment variable PATH
echo $PATH

```

### Basic commands

```bash
#Show username of the current user
whoami
echo $LOGNAME

#Login as another user
su user_name

#Logoff from user
exit

#Login as root
su -

#Reboot
reboot
init 6
shutdown -r

#Shutdown
halt
poweroff
init 0
shutdown -H

#Show top running processes
top
```

### uname

```bash
#Kernel name
uname
uname -s

#Release number
uname -r

#Build version
uname -v

#Machine type
uname -m

#processor info
uname -p

#Official name
uname -o

#All info
uname -a
```

### cd and pwd

```bash
#Print working directory
pwd
echo $PWD

#Change directory to home
cd
cd ~

#Change directory
cd folder_name

#Return to previous
cd -
```

### Command history

```bash
#All comamnds are stored in file in home directory
.bash_history

#Show content of file
cat file_name

#Number of saved commands
echo $HISTFILESIZE

#Some settings for writing history
echo $HISTCONTROL

#Get commands history
history

#Run particular comand
!<command_number>
```

### Shell config files

- **Login shell** - shell when connecting via SSH
- **Non login shell** - native terminal

#### Login shell

- /etc/profile

- ~/.bash_profile
- ~./bash_login
- ~/.profile
- ~/.bashrc

- /etc/bashrc

- ~/.bash_logout - some actions for logout if needed

### Non-login shell

- ~/.bashrc

### Shell variables

```bash
echo $PWD
echo $OLDPWD - to execute cd - commands

TEST="testing"
echo $TEST

#Export variable
export variable_name

#Append variable
variable_name=$variable_name "new content" 

#F.E.
PATH=$PATH:/opt
```

### Globbing

```bash
#Any characters number
ls *.txt
ls test*

#One character
ls ?.txt
ls ????.txt

#Upper-or-lovercase
ls [Pp]*.csv

#Complex search
ls [Ww]eather [Rr]eport199[0-9]?2017.*

Exclude character
ls [^WtTJP]*
```

### Quoting

```bash
#Print the variable value with comment
echo "This is path variable $PATH"

#Print string
echo 'This is $PATH variable'

#Escape character
echo "Plane costs $300"
echo "Plane costs \$300"

ls \
-l
```

### Formatting commands

ls - l Domuments/

**ls** - command - *What to do?*
**-l** - paramenter - *How to do it?*
**Documents/** - argument - *What to do it on?*

### Search for files and dirs

```bash
#Search for files and folders
locate search_word
find containing_folder -name 'file_name'

#Search comamnds
whereis command_name
```

## 2.man

### Manual Sections

- 1 - Executable programs and shell commands
- 2 - System calls provided by kernel
- 3 - Library calls provided by program libraries
- 4 - Device file (usually stored in /dev)
- 5 - File formats
- 6 - Games
- 7 - Miscellaneous
- 8 - Sysadmin commands
- 9 - Kernel routines

```bash
man <command_name>
man <section_number> <config file>

#F.e.
man 5 passwd

#If we dont know which section to use
whatis <command_name/config file>

#F.e.
whatis passwd
man -f passwd

#Search for command by word
apropos <command_word>
man -k <command_word>

#Search in man
/
n - next item
? - previous
```

## 3. info

### Navigation

- ? - Display help information
- N - Moves to the next level
- P - Moves back
- U - Moves up one level
- Arrow keys - move the cursos around the screen
- PgUp PgDn  - Scroll up/down within node
- Enter - Moves to a new selected node
- L - Display the last info page
- T - Display the top page for topic
- Q - Exits from info page system 


## 4. More local documentation

### Common locations

- **/usr/doc/package_name**
- **/usr/share/doc/packagename**
- **/usr/share/doc/packages/packagename**

## 5. File system

- Filesystem Hierarchy Standard (FHS)
- http://www.pathname.com/fhs

### Directory structure

- 'inverted tree' with a single root
- Case sensitive
- Paths are deliminated by a / (forward slash)
- Any folder or file whose name is preceded by a . (dot) are hidden
- A single . (dot) in a directory refers tj the current directory
- A double .. (dot) refers to the parent or directory up in the hierarchy

### Linux file sysytem main directories

- **bin** - contains executable files
- **boot** - booting files + Linux kernel
- **dev** - devices (HDDs, Keyboards, etc.)
- **etc** - system services and system info
- **home** - regular user has folders
- **lib, lib64** - library files
- **media** - cd mounted
- **mnt**- connect other harddrives
- **opt** - optional location for applications
- **proc** - info about running linux system
- **root** - home directory for root 
- **sbin** - sysadmin tools location
- **srv** - server applications location
- **sys** - information about hardware on the system
- **tmp** - store temporary data
- **usr** - contains the mirror of root (/) directory tree
- **var** - contain logs, printer files etc.

## 6. Files manipulation

```bash
#Create folder
mkdir <folder_name1> <folder_name2>
mkdir -p <parent_folder>/<sub_folder>

#remove folder
rmdir <folder_name>

#Create file
touch <file_name>

#Copy file
cp <file_name> <destination>

-R - copy folder recursivly
-v - show what is copying

#Move file
mv <file_name> <destination>

#Renaming
mv <old_name> <new_name>

#Deleting
rm <file/folder_name>
-r - deleting recursivly
```

## 7. Archivation

### tar (tape archive)

```bash
#Creating archive

tar -cf <Archive name> <Archiving folder name> (.tar extension)

- c - Archive
- f - Name archive

#Look inside archive
tar -tf <Archive>

- t - look inside archive

#Extract content
tar -xf <Archive_name>

- x - extract content

#Compress file
tar -czf <Archive_name> (.tgz or .gz extension)

- z - use gzip compression

tar -cjf <Archive_name> (.bz2 extension)

- j - compress with bzip2

#Extract archive
tar -xzf <Archive_name>
tar -xvjf <Archive_name> 

- v - Verbose

#ZIP file
zip -r <Archive_name> <Archiving_content>
gzip <File_name>
bzip2 <File_name>

- r - Recursivly

#Unzip file
unzip <Archive_file>
gunzip <Archive_file>
bunzip2 <Archive_file>
```

## 8. Viewing and Analyzing Text

```bash
#Get file content and scroll it
less <File_name>

#View first lines of the file
head -n <Number> <File_name>

#View last lines of the file
tail -n <Number> <File_name>

#Follow file with it gets updated
tail -f <File_name>

#F.e.
tail -f /var/log/secure
```

```bash
#Redirect stdout (standard output) to text file
echo "Hello Linux!" > Hello.txt

##Uppend stdout to text file
echo "Hi" >> Hello.txt

#Remove text
cut -d" " -f <Number-range> <File_name>

- d - delimiter symbol (symbol, which separates the groups)
- f - Range of fields which needs to keep

#Sort file content
sort <File_name>

#Get number of lines, words and characters
wc -lw <File_name>

- l - number of lines
- w - number of words
```

### grep

```bash
#Simple grep using
grep <pattern> <file to search>
- i - cases insensitive

#Search patterns
grep -i '^error' file.txt
- ^ - beginning of the line

grep -i 'error$' file.txt
- $ - end of the line

grep '^[ABCabc]' file.txt
- [] - search special sharacters


grep '^[^ABCabc]' file.txt
- [^] - exclude symbols from search

grep '^.[h]' file.txt
- . - replace one unknown character

grep 'www*' file.txt
- * - exactly what before the star

#Search for word (boundary)
grep '\b<serach_word>\b' file.txt
- \b \b - boundaries
```

## 9. vi/vim Text editor

```bash

- i       - insert mode
- esc     - leave insert mode
- o       - enter below current line
- hjkl    - move cursor
- v       - visual mode
- y       - yank/copy
- p       - put/paste
- u       - undo
- :w      - save
- Shift+q - go down
- gg      - go up
- Shift+a - uppend
- d       - delete
- :q      - quit

#Vim tutor
vimtutor
```

## 10. Scripting

```bash
#!/bin/bash

#Comments
```

```bash
chmod +x <File to change the mode>
```

```bash
if <something>
then
    <action>
fi

if <something>
then
    <action1>
else
    <action2>
fi
```

```bash
for <variable> in <set of values>
do
    <action>
done
```

## 11. Lifecycle management

### Lifecycle steps

- Design
- Develop
- Deploy
- Manage
- Retire

## 12. Hardware

```bash
#CPU info file
cat /proc/cpuinfo

#RAM
free -m
free -g
- m - show megabytes
- g - show gigabytes

#Motherboard/BIOS
dmidecode

#HDD info
lsblk

#Wiew free space
df -f 
- f - human readable format

#Show all info
top
```

## 13. Linux processes

- Process is set of instructions loaded into memory

- PID1 - **init/systemd** - main process

```bash
#Winew process tree
ps -eH | less

#Processes by user
ps -u <username>

#Process from all users
ps -eH
- e - all processes
- H - show Hierarchy
- --forest - show Hierarchy

ps -efH
- f - full format listing

#Process folder
ls /proc

#Show al processes
top
```

## 14. System logging

- **/var/log** - log directory

- boot.log - Records information from system boot
- messages/syslog - what is going on in system
- secure - defence report
- dmesg - utility to view kernel ring buffer info

```bash
dmesg | grep console
```

## 15. Linux Networking

```bash
#Show network interface info
ip addr show
ifconfig

#Get default GW address
ip route show
route
netstat -r

#Test DNS
host <website_name>

#DNS config fiel
cat /etc/resolv.conf
cat /etc/hosts

#Ping in Linux
ping -c N <host name otr IP>
N - number of packages
```

## 16. User accounts

### User account types

- root
- regular user
- system user

```bash
#logged users
who
w

#User info
id

sudo - superuser-do

#sudo config file
/etc/sudoers

#Account info file
/etc/passwd - main account info
<user_name>:x:user_id:group_id:<comment>:<path to home directory>:<users login default shell>

/etc/group
<group_name>:x:<group_id>:<users_list>

#Create user group
groupadd <group_name>

#Create account
useradd -G <group_id> -c "Full Name" -m <user_name>
- G - add to secondary group id 
- m - create home directory
- c - full user name

#Default settings for user creation
/etc/default/useradd

#Set of default folders for new users
/etc/skel

Password file
/etc/shadow

<user_name>:<encrypted_password>:<number of days since January 1st 1970>:<days before to change the password>:<password age>:<password warning period>

#Wiew who loged in system and when
last

#Modiry user settings
usermod

#See groups of user
groups <user_name>
```

## 17. Permissions

- "-" - file
- d   - directory
- b   - block (drives)
- c   - terminal, monitor, etc.
- l   - link file

- r   - read
- w   - write
- x   - execute
- "-" - no permission
- t   - sticky bit (anyone can delete only own files and folders)

- 4 - read
- 2 - write
- 1 - execute
- 0 - no permission

```bash
#Change permission
chmod o-<permission letter> <file_name> 
- u - user
- g - group
- o - other

- "-" - substitute permission
- "+" - add permission

- R - change permission recursivly

#Change owner
chown <user_name>:<group_name> <file_name>
chgrp <group_name> <file_name>
```

## 18. Symbolic links

```bash
#Create link
ln -s <file_name> <link_name> 
- s - symbolic link to the file

#Unlink link
unlink <link_file>
```

## 19. Different files and directories

### Temp files

- /var/tmp - do not get deleted during reboot
- /tmp     - get deleted during reboot

```bash
#Apply sticky bit
chmod o+t <path to file/folder>
chmod 1777 <path to file/folder>












