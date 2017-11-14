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

## IIS Benefits

- Componentization
- Extensibility
- ASP.NET Integration

## IIS Module setup

- Install module on the server  
- Enable the module in an application

## Installation/Removing modules

- Native Module
    * *globalModule* - section in **applicationhost.config**
    * add it to section *modules* in **web.config** file for current application

- Managed module
    * add it to section *modules* in **web.config** file for current application

### Install/Remove module via AppCmd.exe

```Batch 
AppCmd.exe install module /name:MODULE_NAME /image:PATH_TO_DLL

AppCmd.exe uninstall module MODULE_NAME
```

### Get modules list

```Batch
AppCmd.exe list modules [/app.name:APPLICATION_NAME]
```

### Enable/Disable module

```Batch
AppCmd.exe add module /name:MODULE_NAME /type:MGD_TYPE

Appcmd.exe delete module MODULE_NAME [/app.name:APPLICATION_NAME]
```

### Install/Remove module via PowerShell

```powershell
Get-Command -Module WebAdministration -Name *module*
```

## IIS Config files

- **ApplicationHost.config** - %windir%\system32\inetsrv\config
    * system.pplicationHost - Contains config settings for sites, apps, virtual directories, and app pools. This settings can't be distributed
    * system.webServer - Contains config for all other settings, including global defaults. This settings can be distributed

- **Web.config** - stored directly within the code or in the content directories of a Web site
- **Benefits** 

## AppCmd

- APPCMD (command) (object-type) <identifier> < /parameter1:value1 ... >*

### 3 Help types in AppCmd

1. General Help - appcmd /?
2. Object Help - appcmd (object) /?
3. Command Help - appcmd (command) (object) /?

### Backup

- **appcmd add backup (Name)** - add backup 
- **appcmd list backups** - display backup list
- **appcmd restore backup (Name)** - restore backup

 - **Backup-WebConfiguration** - add backup 
 - **Get-WebConfigurationBackup** - display backup list
 - **Remove-WebConfigurationBAckup** - remove backup
 - **Restore-WebConfiguration** - restore backup

 ```powershell
$Date = Get-Date
$Name = "MySiteBackup "+$Date.ToShortString()
Backup-WebConfiguration -Name $Name -Verbose
``` 