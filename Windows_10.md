# Supporting and Troubleshooting Windows 10

## DEPLOYMENT
----------------------------------
boot.wim - Windows PE 
install.wim - Windows 10

## PORTS
----------------------------------
- **20** - FTP Data
- **21** - FTP Control
- **22**- SSH
- **23** - Telnet
- **80** - HTTP
- **443** - HTTPS
- **445** - Group Policy
- **3389** - Remote Desktop

## DNS  
----------------------------------
- **Resolve-DnsName**
- **Clear-DnsCache**
- **ipconfig flushdns**

## EVENT VIEWER
----------------------------------
- ! Read about views in EV 
- ! Attach Task scheduler to Event in EV 

- ! Message analizer
- ! Reliability history

- ! Event trays in Windows 10

## SYSINTERNAL
----------------------------------
- Procmon
- Process Explorer

```
DART --> MDOP <-- AGPM
        ^    ^
        |    |
     APP-V  UE-V
```

## WINDOWS STARTUP
----------------------------------
```
BIOS
  |
---------------------
| 512 b | boot.mgr  |
---------           | ---> winload.exe core drivers (HKEYLM\SYSTEM\Current Control Set\Services\atapi) --> Kernel, session manager --> 3rd party drivers --> winlogon or winresume
|                   | <-- Windows RE 
---------------------
```

- **winlogon** - if startup
- **winresume** - if hybernation

## ACCEESS TO WINDOWS RE
----------------------------------
**reagentc.exe** - command line utility [REAgentC on TechNet](https://technet.microsoft.com/en-us/library/dd799242(v=ws.10).aspx)
**bootrec /scanos** |
**rebuild bcd**     | - cmd options

C:\Windows\System32\LogFiles\srt\SrtTrail.txt 
1. bootrec /rebuild bcd
2. restore mbr
3. fix boot

## WINDOWS SNAPP-INS
----------------------------------
- **gpmc.msc** - Group Policy manager (DC)
- **dsa.msc** - Active Directory users and Computers
- **certmger.msc** - Certificates management

## COMMAND LINE UTILITES
----------------------------------
- **sc.exe** - working with services
- **dism.exe** - working with images

## HARDWARE AND DEVICE DRIVERS
----------------------------------
- **.inf - Class ID* - f.e for disable digital signature check via Gp
- *bcdedit /set loadoptions disable_integrity_checks*
- *bcdedit /set testsignition*

**C:\Windows\System32\DriverStore\FileRepository** - Driver store in Wondows
Add driver to wim     --> **dism**
Add driver to Windows --> **pnputil**