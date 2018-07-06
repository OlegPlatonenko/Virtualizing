```bash
#Fetch HTML for current page 
curl www.httpbin.org
```
```bash
#Request HTML headers
curl -I www.httpbin.org
curl --head www.httpbin.org

HTTP/1.1 200 OK
Connection: keep-alive
Server: gunicorn/19.8.1
Date: Fri, 06 Jul 2018 11:20:58 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 8344
Access-Control-Allow-Origin: *
Access-Control-Allow-Credentials: true
Via: 1.1 vegur

#Verbose request
curl -Iv www.httpbin.org

* Rebuilt URL to: www.httpbin.org/
*   Trying 52.1.35.184...
* Connected to www.httpbin.org (52.1.35.184) port 80 (#0)
> HEAD / HTTP/1.1
> Host: www.httpbin.org
> User-Agent: curl/7.47.0
> Accept: */*
> 
< HTTP/1.1 200 OK
HTTP/1.1 200 OK
< Connection: keep-alive
Connection: keep-alive
< Server: gunicorn/19.8.1
Server: gunicorn/19.8.1
< Date: Fri, 06 Jul 2018 11:22:47 GMT
Date: Fri, 06 Jul 2018 11:22:47 GMT
< Content-Type: text/html; charset=utf-8
Content-Type: text/html; charset=utf-8
< Content-Length: 8344
Content-Length: 8344
< Access-Control-Allow-Origin: *
Access-Control-Allow-Origin: *
< Access-Control-Allow-Credentials: true
Access-Control-Allow-Credentials: true
< Via: 1.1 vegur
Via: 1.1 vegur
```
```bash
#Send data
curl -d 'name=john+doe&course=linux' httpbin.org/post
curl -d '{"name":"John Doe","course":"Linux"}' httpbin.org/post

#Define header
curl -H 'Content-Type: application/json' -d '{"name":"John Doe","course":"Linux"}' httpbin.org/post
```
```bash
#Authentication 
curl -u john:abc123 httpbin.org/basic-auth/john/abc123
curl john:abc123@httpbin.org/basic-auth/john/abc123
```
```bash
#Header definition
curl -Iv www.httpbin.org

* Rebuilt URL to: www.httpbin.org/
*   Trying 52.1.35.184...
* Connected to www.httpbin.org (52.1.35.184) port 80 (#0)
> HEAD / HTTP/1.1
> Host: www.httpbin.org
> User-Agent: curl/7.47.0
> Accept: */*                             #Accept header
> 
< HTTP/1.1 200 OK
HTTP/1.1 200 OK
< Connection: keep-alive                  #Connection header
Connection: keep-alive 
< Server: gunicorn/19.8.1
Server: gunicorn/19.8.1
< Date: Fri, 06 Jul 2018 11:22:47 GMT
Date: Fri, 06 Jul 2018 11:22:47 GMT
< Content-Type: text/html; charset=utf-8  #Content-Type header
Content-Type: text/html; charset=utf-8
< Content-Length: 8344                    #Content-Length header
Content-Length: 8344  
< Access-Control-Allow-Origin: *
Access-Control-Allow-Origin: *
< Access-Control-Allow-Credentials: true
Access-Control-Allow-Credentials: true
< Via: 1.1 vegur
Via: 1.1 vegur
```



