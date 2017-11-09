# MICROSOFT IIS

## IIS Management
1. https://manage.iis.net
2. IIS Manager

## IIS Components
- **HTTP.sys** - protocol listener. Supports SSL in IIS 7.0 and later
- **Services**:
* WWW (W3SVC)
    - HTTP administration and configuration - (HTTP.sys) config
    - Process management
    - Performance monitoring
    - Notifying WAS when a request enters the request queue 

* WAS (Windows Process Activation Service)
    - Manages application pool configuration and worker process
    - configuration in **ApplicationHost.config**
        * Config file information
            - Global config information
            - Protocol config info for HTTP and non-HTTP
            - App pool config
            - Site config (bindings, apps)
            - App config (protocols, app pools for current app) Located: *%systemroot%\system32\inetsrv\config*

WWW and WAS - both run as **LocalSystem** in **svchost.exe** process

## Modules in IIS

IIS include **Web server engine** in which you can add or remove modules, depenging on your needs.
**MOdules** are individual features that the server uses to process requests.

### Module types

- HTTP Modules
- Security Modules
- Content Modules 
- Compression Modules
- Caching Modules
- Logging and Diagnostic Modules
- Managed Support Modules

## Request Processing in IIS

In IIS, the IIS and ASP.NET request pipelines combine to process with an integrated approach.

## Application Pools in IIS

App pools separate applications by process boundaries to prevent an app from affecting another app on the server.

### Integrated app pool mode

When an application pool is in integrated mode, you can take advantage of the integrated request-processing architecture of IIS and ASP.NET.

### Classic application pool mode

When an application pool is in Classic mode, IIS handles requests in the same way as in IIS 6.0 worker process isolation mode (duplicates some functions of IIS and ASP.NET, f.e.e Authentication)

## HTTP Request processing in IIS

1. When a client browser initiates an HTTP request for a resource on the Web server, HTTP.sys intercepts the request.
2. HTTP.sys contacts WAS to obtain information from the configuration store.
3. WAS requests configuration information from the configuration store, applicationHost.config.
4. The WWW Service receives configuration information, such as application pool and site configuration.
5. The WWW Service uses the configuration information to configure HTTP.sys.
6. WAS starts a worker process for the application pool to which the request was made.
7. The worker process processes the request and returns a response to HTTP.sys.
8. The client receives a response.

![IIS-Scheme](https://github.com/OlegPlatonenko/Virtualizing/blob/master/IIS/images/iis_scheme.png)

![IIS-Modules_scheme](https://github.com/OlegPlatonenko/Virtualizing/blob/master/IIS/images/IIS_Modules_scheme.png)