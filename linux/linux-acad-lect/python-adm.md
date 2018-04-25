# Python 3 for System Administration

## Install Dev Tools and Python 3 from source

```
yum install -y \
> git \
> wget \
> which \
> words \
> lsof \
> vim
```

```bash
yum groupinstall -y "development tools"
yum install -y \
> libffi-devel \
> zlib-devel \
> bzip2-devel \
> openssl-devel \
> ncurses-devel \
> sqlite-devel \
> readline-devel \
> tk-devel \
> gdbm-devel \
> db4-devel \
> libpcap-devel \
> xz-devel \
> expat-devel 

cd /usr/src/
wget https://www.python.org/ftp/python/3.6.5/Python-3.6.5.tgz
tar xf Python-3.6.5.tgz
cd Python-3.6.5/
./configure --enable-optimizations
make altinstall

chmod +w /etc/sudoers
sudo vim /etc/sudoers
#Search for secure_path
#Add at the end :/usr/local/bin
sudo pip3.6 install --upgrade pip
```

## Python 2 vs 3

- https://wiki.python.org/moin/Python2orPython3
- https://docs.python.org/3/whatsnew/3.0.html

## Script example and comments

- See hello.py in /scripts folder

## Data Types in Python

### String

```python
#String in Python has 'str' type"

"Hello, World!"
"pass" + "word"
"Ha" * 3

"double".find('s')
"TeStInG".lower()

#Escape Sequences

print("Tab\tDelimeted")
print("New\nLine")
print("Slash\\Character")

print("'Single' are fine")
print('"Doble" are fine')
print('Your\'s are awesome')
```

### Int and Float

```python
#Adding
2 + 2

#Substruction
3 - 2

#Multiplying
3 * 2 

#Division
5 / 3
1.666666667

5 // 3
1

5 % 3
2

#Power
2 ** 3
8
```
```python
#Define type
type(3)
type("String")

int(1)
float(2.1)
str("Hello")
```

### Booleans and None

```python
True
type(True)
type(False)

#Nothingness
None
```

## Variables

```python
my_str = "This is a simple string"
my_str
print(my_str)

my_str += " testing"
my_str = my_str + "testing"

my_str = 1 #Variable type live changing
```