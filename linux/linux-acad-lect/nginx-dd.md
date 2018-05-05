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

