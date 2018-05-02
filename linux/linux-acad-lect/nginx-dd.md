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
