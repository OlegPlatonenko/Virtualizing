# Supporting and Troubleshooting Windows 10

## TABLE OF CONTENTS
[Deployment](#Deployment)
[Ports](#Ports)
[DNS](#DNS)
[Event Viewer](#EV)
[Sysinternal](#Sysinternal)
[Windows Startup](#Startup)
[Access to Windows RE](#WinRE)
[Windows Snapp-Ins](#SnappIns)
[Command line utilites](#CMD)
[Hardware and device drivers](#Drivers)
[How DNS works](#DNS2)
[Group policy](#GP)
[User settings](#UserSettings)
[VPN](#VPN)
[Windows Imaging and Configuration Designer](#WinICD)
[Configuring AD CS](#Certificates)
[Scripting](#Scripting)
[Remoting](#Remoting)

## DEPLOYMENT <a name="Deployment"></a>
----------------------------------
- boot.wim - Windows PE 
- install.wim - Windows 10

## PORTS <a name="Ports"></a>
----------------------------------
- **20** - FTP Data
- **21** - FTP Control
- **22**- SSH
- **23** - Telnet
- **80** - HTTP
- **443** - HTTPS
- **445** - Group Policy 9Folder Sharing)
- **3389** - Remote Desktop
- **5985** - WinRM service (Windows PowerShell Default psSession Port) 
- **5986** - WinRM service (Windows PowerShell Default psSession Port)
- **20694** - Easy Print (Forwarded printers)

- [List of all TCP/UDP Ports](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers) 

## DNS <a name="DNS"></a>
----------------------------------
- **Resolve-DnsName**
- **Clear-DnsCache**
- **ipconfig flushdns**

## EVENT VIEWER <a name="EV"></a>
----------------------------------
- ! Read about views in EV 
- ! Attach Task scheduler to Event in EV 

- ! Message analizer
- ! Reliability history

- ! Event trays in Windows 10

## SYSINTERNAL <a name="Sysinternal"></a>
----------------------------------
- Procmon
- Process Explorer

```
DART --> MDOP <-- AGPM
        ^    ^
        |    |
     APP-V  UE-V
```

## WINDOWS STARTUP <a name="Startup"></a>
----------------------------------
```
BIOS
  |
---------------------
| 512 b | boot.mgr  |
---------           | ---> winload.exe core drivers (HKEYLM\SYSTEM\Current Control Set\Services\atapi) --> Kernel, session manager --> 3rd party drivers --> winlogon or winresume
|                   | <--- Windows RE 
---------------------
```

- **winlogon** - if startup
- **winresume** - if hybernation

## ACCEESS TO WINDOWS RE <a name="WinRE"></a>
----------------------------------
- **reagentc.exe** - command line utility [REAgentC on TechNet](https://technet.microsoft.com/en-us/library/dd799242(v=ws.10).aspx)
- **bootrec /scanos** |
- **rebuild bcd**     | - cmd options

C:\Windows\System32\LogFiles\srt\SrtTrail.txt 
1. bootrec /rebuild bcd
2. restore mbr
3. fix boot

## WINDOWS SNAPP-INS <a name="SnappIns"></a>
----------------------------------
- **gpmc.msc** - Group Policy manager (DC)
- **dsa.msc** - Active Directory users and Computers
- **certmgr.msc** - Certificates management
- **diskmagmt.msc** - Disk management
- **rsop.msc** - result of group policy
- **dsa.msc** - Active Directory users and Computers
- **wf.msc** - Windows Firewall

## COMMAND LINE UTILITES <a name="CMD"></a>
----------------------------------

1. WINDOWS
- **sc.exe** - working with services
- **dism.exe** - working with images
- **devcon.exe** - device manager in cmd
- [**driverquery**](https://technet.microsoft.com/en-us/library/bb490896.aspx) - working with drivers in cmd
- **nltest** - working wirh GP
- **gpresult** - return Group Policy result file
- **gpupdate (Invoke-GPUpdate)** - update group policy
- **repadmin** - see pbject replication in AD
- [**dfsdiag**](https://technet.microsoft.com/en-us/library/hh875626(v=ws.11).aspx) - provides diagnostic information for DFS Namespaces
- [**dfsrdiag**](https://technet.microsoft.com/en-us/library/cc732006(v=ws.10).aspx) - Performs diagnostic tests of DFS Replication
- **whoami** - request logon information (<domain>\<username>)
- [**klist**](https://technet.microsoft.com/en-us/library/hh134826(v=ws.11).aspx) -  Displays a list of currently cached Kerberos tickets
- **runas** - Allows a user to run specific tools and programs with different permissions than the user's current logon provides
- **dsget** - Displays the selected properties of a specific object in the directory (using for AD)

2. NETWORK
- **ipconfig** - working with network settings
- **arp** - working with ARP cache
- **tracert** - trace root to point
- **pathping** - mix of *tracert* and *ping* commands
- **ping** (Test-Connection) - send ICMP echo request to host
- [**nbtstat**](https://technet.microsoft.com/en-us/library/cc940106.aspx) - help to troubleshoot NetBIOS name resolution problems
- **nslookup** (Resolve-DnsName) - resolve DNS name or IP

## HARDWARE AND DEVICE DRIVERS <a name="Drivers"></a>
----------------------------------
- **.inf - Class ID* - f.e for disable digital signature check via Gp
- *bcdedit /set loadoptions disable_integrity_checks*
- *bcdedit /set testsignition*

- **C:\Windows\System32\DriverStore\FileRepository** - Driver store in Wondows
- Add driver to wim     --> **dism**
- Add driver to Windows --> **pnputil**

- wbemtest.exe - Windows build in util to check WMI connection
- **sigverif.exe** - GUI util for checking unsigned files
- ! [PowerShell Remoting](https://github.com/OlegPlatonenko/Virtualizing/tree/master/PS)

 ## HOW **DNS** WORKS <a name="DNS2"></a>
 ----------------------------------
 1. DNS Cache
 2. Request to DNS Server
 3. [LLMNR](https://blogs.technet.microsoft.com/networking/2008/04/01/how-to-benefit-from-link-local-multicast-name-resolution/)
 4. NetBIOS cache (nbtstat -c)
 5. NetBIOS broadcast
 6. wins server (optional)
 7. lmhosts (C:\Windows\System32\drivers\etc\lmhosts.sam)

 ## GROUP POLICY <a name="GP"></a>
 ----------------------------------

1. Policy is AD member
2. Policy is sysvol files

- Domain GP --> Global GP --> Admin GP --> Users
 
- GPO = GPC + GPT

``` 
         __________                ________
GPC --> |          | --> LDAP --> |        |
        | DATABASE |              |        |
GPT --> |__________| <-- DFS <--  |________|
```

## USER SETTINGS <a name="UserSettings></a>
----------------------------------
1. Authentication
2. Authorization

ntuser.dat (location: C:\users\username) - file maps HKEY\Current_user branch. 
```
1. Open regedit.exe.
2. make sure HKEY_LOCAL_MACHINE is selected on the left panel.
3. click File -> Load Hive in the main menu.
4. open ntuser.dat file in common dialog.
5. specify some temporary name, like USER1.
6. make changes.
7. make sure HKEY_LOCAL_MACHINE\USER1 is selected on the left panel and then unload hive from main menu.
```

## VPN <a name="VPN"></a>
----------------------------------
- SSTP Protocol (Cisco VPN SSL)
- MC-CHAPv2

- EAP Framework - best desicion for corp. VPN 

```
 ___________
|           | <--- VPN
| NPS (IAS) |
|___________| <--- VPN

```
- NPS - RADIUS Server
- RADIUS Clients - Servers need for authentication
- Using L2TP Ports

**Direct Access** - On *Direct Access* server you need to install DNS64 and NAT64 for converting IPv4 to IPv6 and vise versa. 

## WINDOWS IMAGING AND CONFIGURATION DESIGNER <a name="WinICD"></a>
----------------------------------
Use the Windows Configuration Designer tool to create provisioning packages to easily configure devices running Windows 10. 
Windows Configuration Designer is primarily designed for use by IT departments for business and educational institutions who need to provision bring-your-own-device (BYOD) and business-supplied devices.

## CONFIGURING AD CS <a name="Certificates"></a
----------------------------------
1. Add AD CS Role
2. Configure AD CS
3. Tools -> certsrv
4. Browse...
5. Cert. Templates
6. RMB --> Manage
7. Code signing
8. Properties --> Security
9. Enroll
10. RMB --> New --> Certificate Template to issue --> Code signing
11. certmgr.msc
12. Personal
13. All Tasks --> Request New cert. --> Active Directory --> Code signing
14. RMB on Cert. --> Export --> PS.cer
15. Server Management  
16. Tool --> GP Manager --> Default Domain Policy --> CS Policy --> WS --> Secure --> Policy key --> Prusted Publishers --> Export

## SCRIPTING <a name="Scripting"></a>
----------------------------------
- ! About_Functions_Advanced
- ! About_Functions_Advanced_Parameters
- ! [Throw](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_throw?view=powershell-5.1)

## PS REMOTING <a name="Remoting"></a>
----------------------------------
1. Open ports: 5985 - for WinRM / HTTP, 5986 - for WinPM / HTTPS
2. Enable-PSRemoting (WinRM service - Enabled)

- wsmprovhost.exe - service for WinRM

- ! About_Session_Configuration_Files