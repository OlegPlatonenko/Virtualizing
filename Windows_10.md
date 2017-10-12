# Supporting and Troubleshooting Windows 10

## DEPLOYMENT
----------------------------------
- boot.wim - Windows PE 
- install.wim - Windows 10

## PORTS
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
|                   | <--- Windows RE 
---------------------
```

- **winlogon** - if startup
- **winresume** - if hybernation

## ACCEESS TO WINDOWS RE
----------------------------------
- **reagentc.exe** - command line utility [REAgentC on TechNet](https://technet.microsoft.com/en-us/library/dd799242(v=ws.10).aspx)
- **bootrec /scanos** |
- **rebuild bcd**     | - cmd options

C:\Windows\System32\LogFiles\srt\SrtTrail.txt 
1. bootrec /rebuild bcd
2. restore mbr
3. fix boot

## WINDOWS SNAPP-INS
----------------------------------
- **gpmc.msc** - Group Policy manager (DC)
- **dsa.msc** - Active Directory users and Computers
- **certmger.msc** - Certificates management
- **diskmagmt.msc** - Disk management
- **rsop.msc** - result of group policy

## COMMAND LINE UTILITES
----------------------------------

1. WINDOWS
- **sc.exe** - working with services
- **dism.exe** - working with images
- **devcon.exe** - device manager in cmd
- [**driverquery**](https://technet.microsoft.com/en-us/library/bb490896.aspx) - working with drivers in cmd
- **nltest** 

2. NETWORK
- **ipconfig** - working with network settings
- **arp** - working with ARP cache
- **tracert** - trace root to point
- **pathping** - mix of *tracert* and *ping* commands
- **ping** (Test-Connection) - send ICMP echo request to host
- [**nbtstat**](https://technet.microsoft.com/en-us/library/cc940106.aspx) - help to troubleshoot NetBIOS name resolution problems
- **nslookup** (Resolve-DnsName) - resolve DNS name or IP

## HARDWARE AND DEVICE DRIVERS
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

 ## HOW **DNS** WORKS
 ----------------------------------
 1. DNS Cache
 2. Request to DNS Server
 3. [LLMNR](https://blogs.technet.microsoft.com/networking/2008/04/01/how-to-benefit-from-link-local-multicast-name-resolution/)
 4. NetBIOS cache (nbtstat -c)
 5. NetBIOS broadcast
 6. wins server (optional)
 7. lmhosts (C:\Windows\System32\drivers\etc\lmhosts.sam)

 ## GROUP POLICY
 ----------------------------------
 
