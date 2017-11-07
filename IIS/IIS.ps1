﻿Rename-Computer -NewName WEBSVR01

#Setup Web-Server Feature
$F_Name = (Get-WindowsFeature -Name Web-Server).Name
Add-WindowsFeature -Name $F_Name

$F_Mgmt_Name = (Get-WindowsFeature -Name *Web-Mgmt-Tools*).Name
Add-WindowsFeature -Name $F_Mgmt_Name

$F_ASP_Name = "web-asp-net"
Add-WindowsFeature -Name $F_ASP_Name

#Add-WindowsFeature -Name web-server -IncludeAllSubFeature

New-IISSite -Name "TestSite" -BindingInformation "*:8080:" –PhysicalPath "$env:systemdrive\inetpub\testsite"
Get-IISSite -Name "TestSite"
Export-IISConfiguration -PhysicalPath "C:\Users\Administrator\Desktop\IIS_Config" -DontExportKeys

#Get-Command *IIS*
#Get-Help Export-IISConfiguration -ShowWindow

Get-Service -Name AppHostSvc, W3SVC, WAS
Get-Module -ListAvailable
Get-Command -Module WebAdministration
Get-ChildItem -Path IIS:

#Review Defaul IIS WebSite
Get-Website -Name 'Default Web Site'
Get-ChildItem -Path IIS:\Sites
Get-ChildItem -Path 'IIS:\Sites\Default Web Site'

Add-Content -Path C:\inetpub\wwwroot\Default.htm -Value "Technet Rocks!"