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

### IIS Hierarchy

- WebSite
- Application
- Virtual Directory

### Working with Sites, Directories, AppPools

- http://www.mysite.com:81 - site
- http://www.mysite.com:81/app1 - app
- http://www.mysite.com:81/app1/vdir1 - virtual dir

App pool is outside this hierarchy. 

**App pool defines**
- number of worker proces settings (version of CLR loaded)
- .NET integration mode
- account under which the worker process runs
- process cycle settings

* **CLR** - Common language runtime

```bat
appcmd list sites
appcmd list apps /site.name:"MySite"
appcmd list vdirs /app.name:"MySite/"
appcmd list apppolls
```
```powershell
Get-Website - Name "MySite"
Get-WebApplication -Site "MySite"
Get-WebVirtualDirectory -Site "MySite" -Application "MyApp"
Get-Childitem IIS:\AppPools
```

#### Create a WebSite

binding format for HTTP: **IP:PORT:HOSTHEADER**
```
appcmd add site /name:MySite2 /id:4 /bindings:http/*:82: /physicalPath:C:\Git\Virtualizing\IIS\MySite2
```
```powershell
New-Website -Name "MySite3" -Id 5 -Port 83 -PhysicalPath "C:\inetpub\MySite3"
```

#### Adding Application

```bat
appcmd add app /site.name:MySite /path:/app1 /physicalPath:C:\inetpub\mysite\app1
```
```powershell
New-WebApplication -Site MySite3 -Name app2 -PhysicalPath C:\inetpub\MySite3\app2 -ApplicationPool DefaultApplicationPool
```

### Creating new Virtual Directory

```bat
appcmd add vdir /app.name:"MySite/app1" /path:/vdir1 /physicalPath:C:\inetpub\mysite\app1\vdir1
```

```powershell
New-WebVirtualDirectory -Site MySite3 -Application app2 -Name vdir1 -PhysicalPath C:\inetpub\MySite3\app2\vdir1
```

### Creating AppPool

```bat
appcmd add apppool /name:MyAppPool
```

```powershell
New-WebAppPool -Name MyAppPool
```

### Configuring sites, apps, virtual directories

```bat
appcmd <object> <id> [ /property:value ]*
```

Changing AppPool
```bat
appcmd set app "MySite/" /applicationPool:MyAppPool
```

```powershell
Get-WebApplication | Where-Object -FilterScript {$_.path -eq "\app2"} | Format-List -Property *

(Get-WebApplication | Where-Object -FilterScript {$_.path -eq "\app2"}).applicationPool = "MyAppPool"

Get-WebApplication | Where-Object -FilterScript {$_.path -eq "\app2"} | Add-member -NotePropertyName applicationPool -NotePropertyValue "MyAppPool" -Force
```

get AppPlool current properties
```
appcmd list apppool "MyAppPool" /text:*
```

### Inspecting Configuration State

View configuration
```bat
appcmd list config <URL> /section:SectionName

appcmd list config "MySite"
appcmd list config "MySite/" /section:asp
appcmd list config "MySite/" /section:asp /config:*
```

### Editing Configuration Properties

```bat
appcmd set config <URL> /section:SectionName [ /property:value ]

appcmd set config "http://localhost/app1" /section:asp /appAllowClientDebug:false
APPCMD set config "http://localhost/app1" /section:asp /limits.requestQueueMax:4000
```

### Editing Configuration Collections

```bat
appcmd set config /section:system.webServer/modules /[name='FormsAuthentication'].type:System.Web.Security.FormsAuthenticationModule

appcmd set config /section:system.webServer/modules /+[name='MyModule',type='MyType']
```

To delete a collection element, prefix the element path notation with a minus sign, -:

```bat
appcmd set config /section:system.webServer/modules /-[name='MyModule']
```

### Controlling Location of Configuration

AppCmd provides this capability through its **commit** parameter.
The **commit** parameter can be set to one of the following:

- (omitted) — default; write configuration at the level for which it is set
- url — same as default; write configuration at the level for which it is set
- site — write configuration in the Web.config at the site root of the url for which it is set
- app — write configuration in the Web.config at the app root of the url for which it is set
- apphost — write configuration at the server level, in the applicationHost.config file
- ```<PATH>``` — write configuration at the specified config path

```bat
appcmd set config http://localhost/app1/ /section:directoryBrowse /enabled:false /commit:site
```

### Locking and Unlocking Configuration

```bat
appcmd unlock config /section:asp

appcmd lock config /section:asp
```

### Searching Configuration

```bat
appcmd search config
appcmd search config "MySite3/"
appcmd search config "MySite3/" /section:directoryBrowse
appcmd search config "MySite3/" /section:directoryBrowse /enabled
appcmd search config "MySite3/" /section:directoryBrowse /enabled:true
```
### Control Output

```bat
appcmd list site "MySite3" /text:*
appcmd list site "MySite3" /config
appcmd list vdirs /text:physicalPah
```
```
appcmd list sites /xml
```

## IIS Hierarchy

![IIS-Hierarchy_scheme](https://github.com/OlegPlatonenko/Virtualizing/blob/master/IIS/images/iis_config-hierarchy.png)

