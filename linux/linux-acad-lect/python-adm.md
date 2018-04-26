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

## Lists

```python
#List examples
my_list = [1, 2, 3, 4, 5]
mix_list = [1, 'a', True]

#Call for list element
my_list[0]
my_list[-2]

#List length
len(my_list)

#Call for range
my_list[0:2]
my_list [1:]
my_list[:3]

#Takes step of 2 for each item
my_list[0::2]

#Set items
my_list[0] = 'a'

#Add to the list
my_list.append(6)

my_list + [8, 9, 10]
my_list += [8, 9, 10]

my_list[1:3] = ['b', 'c']
my_list[3:5] = ['d', 'e', 'f']

#Replace entire section with a nothing
my_list = ['a', 'b', 'c', 'd', 5, 6, 7]
my_list[4:] = []

#Remove items from list
my_list.remove('b')
my_list.pop() #remove from the end
my_list.pop(0)#remove from the beginning
```

## Tuples

```python
#Plot using
point = (2.0, 3.0)

#Concatenation
point_3d = point + (4.0,)

#Tuple unpacking
x, y, z = point_3d

print("My name is: %s %s" % ("Oleg", "Platonenko"))
```

## Dictionaries (dicts)

```python
#Create Dictionary
ages ={ 'kevin': 49, 'alex': 29 'bob': 41 }

#Read value
ages['kevin']

#Assign value
ages['kayla'] = 21
ages['kayla'] = 22

#Remove thing
del ages['kevin']
ages.pop() #You need to provide argument
ages.pop('alex')

#Methods
ages.keys()
list(ages.keys())

ages.values()
list(ages.values())

#Alternative creation
weights = dict(kevin=160, bob=240, kayla=135)

#Create dictionary from Tuples
colors = dict([('kevin', 'blue'), ('bob', 'green'), ('kayla', 'red')])
```

## Comparisons and Conditionals

```python
#Comparisons
1 < 2
True
0 > 2
False
2 == 1
False
2 != 1
True
3.0 >= 3.0
True
3.1 <= 3.0
False
1.1 == float("1.1")
True
'this' == 'this'
True
'b' > 'a'
True
'abc' < 'b'
True
2 in [1, 2, 3]
True
2 not in [1, 2, 3]
False
```

```python
#Conditionals
if 1 == 1: 
    print('this is true')

if False:
    print('was true')
else:
    print('was false')

name = 'Kevin'
if len(name) >= 6:
    print('name is long')
elif len(name) == 5:
    print('name is 5 characters')
elif len(name) >= 4:
    print('name is 4 or more')
else:
    print('name is short')
```