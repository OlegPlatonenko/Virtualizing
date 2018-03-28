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











