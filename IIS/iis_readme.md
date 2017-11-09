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
            - App config (protocols, app pools for current app)



WWW and WAS - both run as **LocalSystem** in **svchost.exe** process

## IIS Main scheme

----------------------------------------------------------------------------------------------------
![IIS-Scheme](https://github.com/OlegPlatonenko/Virtualizing/blob/master/IIS/images/iis_scheme.png)

## IIS Modules workflow scheme

----------------------------------------------------------------------------------------------------
![IIS-Modules_scheme](https://github.com/OlegPlatonenko/Virtualizing/blob/master/IIS/images/IIS_modules_scheme.png)
