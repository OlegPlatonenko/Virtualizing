# NGINX Deep Dive

## NGINX Installation

- See nginx-install.sh script on /scripts folder

## NGINX Web Server Config

- /etc/nginx/nginx.conf

**Config example**
```nginx
user  nginx;
worker_processes  1;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
}
```

- http://nginx.org/en/docs/http/ngx_http_core_module.html#server
- http://nginx.org/en/docs/http/ngx_http_core_module.html#listen
- http://nginx.org/en/docs/http/ngx_http_core_module.html#server_name

```bash
#test NGINX config
nginx -t
```

- **/usr/share/nginx/html** - Default HTML folder


## Error Pages

- In **/etc/nginx/conf.d/default.conf** add rows:
```
error_page 404 /404.html;
error_page 500 501 502 503 504 /50x.html;
```

## Access Control with HTTP Basic Auth

- In **/etc/nginx/conf.d/default.conf** add rows:
```
 location = /admin.html {
        auth_basic "Login Required"; #String which will be displayed
        auth_basic_user_file /etc/nginx/.htpasswd;
    }
```

```bash
htpasswd -c /etc/nginx/.htpasswd admin #'admin' is username
```

## Generating Self-Signed Certificates

```
mkdir /etc/nginx/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \ 
-keyout /etc/nginx/ssl/private.key -out /etc/nginx/ssl/public.pem

- x509 - key structure
- nodes - do not encrypt output keys
- days - expiration period
- newkey - key type
- keyout - key type (private/public)
- out - public key location
```

## Configuring the Host for SSL/TLS/HTTPS

- In **/etc/nginx/conf.d/default.conf** add rows:
```
listen 443 ssl;
...
ssl_certificate /etc/nginx/ssl/public.pem;
ssl_certificate_key /etc/nginx/ssl/private.key;
```

## Cleaning Up URLs

- In **/etc/nginx/conf.d/default.conf** add rows:
```
rewrite ^(/.*)\.html(\?.*)?$ $1$2 redirect;
rewrite ^/(.*)/$ /$1 redirect;

- ^(/.*)\.html(\?.*)?$ - regular expression
- $1$2 - links for 1st and 2nd groups in regular expression

location / {
    try_files $uri/index.html $uri.html $uri/ $uri =404;
}
```

## Redirecting all trafic to HTTPS

- In **/etc/nginx/conf.d/default.conf** add rows:

```
server {
    listen 80 default_server;
    server_name _;
    return 301 https://$host$request_uri;
}
```

## Overview of NGINX Modules

- **/etc/nginx/modules** - default modules location

```bash
#Full nginx config info
nginx -V
nginx -V 2>&1 | tr -- -'\n' | grep _module
```

## Adding Functionality to NGINX with Dynamic Modules

```bash
yum groupinstall 'Development tools'
yum install -y \
geoip-devel \
libcurl-devel \
libxml2-devel \
libxslt-devel \
libgb-devel \
lmdb-devel \
openssl-devel \
pcre-devel \
perl-ExtUtils-Embed \
yajl-devel \
zlib-devel

cd /opt
git clone --depth 1 -b v3/master https://github.com/SpiderLabs/ModSecurity.git

cd ModSecurity
git submodule init
git submodule update
./build.sh
./configure
make
make install
git clone --depth 1 https://github.com/SpiderLabs/ModSecurity-nginx.git
wget http://nginx.org/download/nginx-1.14.0.tar.gz
tar zxvf nginx-1.14.0.tar.gz
./configure --with-compat --add-dynamic-module=../ModSecurity-nginx
make modules
cp objs/ngx_http_modsecurity_module.so /etc/nginx/modules/
cd /etc/nginx/
vim nginx.conf

#Add rows:
# Load ModSecurity dynamic module
load_module /etc/nginx/modules/ngx_modsecurity_module.so;

mkdir /etc/nginx/modsecutiry
cp /opt/ModSecurity/modsecurity.conf-recommended /etc/nginx/modsecutiry/modsecurity.conf

vim /etc/nginx/modsecutiry/modsecurity.conf

#Add /nginx/ to row:
SecAuditLog /var/log/nginx/modsec_audit.log

vim /etc/nginx/conf.d/default.conf
#Add rows to default conf:
modsecurity on;
modsecurity_rules_file /etc/nginx/modsecurity/modsecurity.conf;

nginx -t
systemctl reload nginx.service
systemctl status nginx.service
```

## Preparing a Node.js Sample Application

```bash
curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
yum install nodejs
mkdir /srv/www
git clone https://github.com/CloudAssessment/s3photoapp.git
cd s3photoapp
make install

#Create file
#/etc/systemd/system/photo-storage.service
[Unit]
Description=photo-storage Node.js service
After=network.target

[Service]
Restart=always
User=nobody
Group=nobody
Environment=NODE_ENV=production
Environment=AWS_ACCESS_KEY_ID=AKIAJWOKVAVGNRKGC6KA
Environment=AWS_SECRET_ACCESS_KEY=*******
ExecStart=/bin/node /srv/www/s3photoapp/apps/photo-storage/server.js

[Install]
WantedBy=multi-user.target

#Create file
#/etc/systemd/system/photo-filter.service
[Unit]
Description=photo-filter Node.js service
After=network.target

[Service]
Restart=always
User=nobody
Group=nobody
Environment=NODE_ENV=production
ExecStart=/bin/node /srv/www/s3photoapp/apps/photo-filter/server.js

[Install]
WantedBy=multi-user.target

#Create file
#/etc/systemd/system/web-client.service
[Unit]
Description=web-client Node.js service
After=network.target photo-filter.target photo-storage.target

[Service]
Restart=always
User=nobody
Group=nobody
Environment=NODE_ENV=production
Environment=AWS_ACCESS_KEY_ID=AKIAJWOKVAVGNRKGC6KA
Environment=AWS_SECRET_ACCESS_KEY=*******
ExecStart=/srv/www/s3photoapp/apps/web-client/bin/www

[Install]
WantedBy=multi-user.target

systemctl start photo-storage
systemctl enable photo-storage
systemctl start photo-filter
systemctl enable photo-filter
systemctl start web-client
systemctl enable web-client
```