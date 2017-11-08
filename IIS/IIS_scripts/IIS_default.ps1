Add-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST/Default Web Site'  -filter "appSettings" -name "." -value @{key='test';value='test2'}

#---------------------------------------------------------------------------------------------------------------------------------------------------

Import-Module IISAdministration
Reset-IISServerManager -Confirm:$false
Start-IISCommitDelay
$webConfig = Get-IISConfigSection -SectionPath "appSettings" -CommitPath "Default Web Site"
$collection = Get-IISConfigCollection -ConfigElement $webConfig
New-IISConfigCollectionElement -ConfigCollection $collection -ConfigAttribute @{key = 'test'; value = 'test2'}
Stop-IISCommitDelay
Remove-Module IISAdministration