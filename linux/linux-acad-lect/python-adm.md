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