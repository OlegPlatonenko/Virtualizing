# Automating Administration with PowerShell

## TABLE OF CONTENTS
- [Common Aliases](#CommonAliases)
- [Define Powershell Version](#PSVersion)
- [Useful Shortcuts](#Shortcuts)
- [Help Explanation](#Help)
- [Comments](#Comments)
- [Common Parameters](#Parameters)
- [Variables](#Variables)
- [Hash tables](#HashTables)
- [Execution Policy](#ExecPolicy)


## COMMON ALIASES <a name="CommonAliases"></a>
-------------------------------
- Set-Location --> cd
- Get-ChildItem --> dir
- New-Item --> mkdir

                 | --> sed (in Linux)
- Select-Object  |  
                 | --> awk (in Linux)

- Start-Transcript - use to record all made in console
- *Start-Transcript -Path C:\Users\oleg.platonenko\Documents\Transcript.txt*

- in PS 3.0 variaple **$_** received one more form: **$PSItem**

## DEFINE POWERSHELL VERSION <a name="PSVersion"></a>
-------------------------------
- $PSVersionTable
```
Name                           Value
----                           -----
PSVersion                      5.1.15063.608
PSEdition                      Desktop
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
BuildVersion                   10.0.15063.608
CLRVersion                     4.0.30319.42000
WSManStackVersion              3.0
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
```

## USEFUL SHORTCUTS <a name="Shortcuts"></a>
-------------------------------
- Ctrl+Home - Delete command entered
- Ctrl - Jump throw command 

## HELP EXPLANATION <a name="Help"></a>
-------------------------------
- parameter <value> - Mandatory Parameter
- [parameter] <value> - Positional, Mandatory Parameter
- [[parameter] <value>] - Optional Parameter
- parameter <value[]> - value may be an array

- Get-Help
- Get-Command
- Get-Help About_*

## COMMENTS <a name="Comments"></a>
-------------------------------
- <# #> - multi row comment 
- <sharp> - single row comment 
 
## COMMON PARAMETERS <a name="Parameters"></a>
-------------------------------
- Passthru - write command execution to console
- WhatIf - return possible command result
- Confirm - Promt user for confirmation

## VARIABLES <a name="Variables"></a>
-------------------------------
- Get-Variable - get list of PS Build-in variables
- Get-Item -Path Env: - get list of Evironmental variables 

## HASH TABLES <a name="HashTables"></a>
-------------------------------
- Syntax : @{ }
- n - Name
- e - Expression
- f - format

- **Example:**
```
Get-Process | 
Select-Object -Property ProcessName, CPU, @{n="Memory (MB)"; e={($_.PagedMemorySize)/1MB}} | 
Sort-Object -Property "Memory (MB)" -Descending | 
Where-Object -FilterScript {$_.CPU -gt 1000}
Format-Table -AutoSize
```

## EXECUTION POLICY TIPES <a name="ExecPolicy"></a>
-------------------------------
- Restricted
- AllSigned
- RemoteSigned
- Unrestricted
- Bypass