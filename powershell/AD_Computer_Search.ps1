Get-ADComputer -Filter 'Name -like "*KYIV*"' | Select-Object -Property name

Get-ADComputer -Filter 'Name -like "*dc*"' | Select-Object -Property name

Get-ADComputer -Filter 'Name -like "*dc*" -and operatingssytem -like "*server*"' -Properties operatingsystem | 
Select-Object -Property name, operatingsystem

Get-ADComputer -Filter 'operatinsystem -like "*server*" -and managedby -eq "OlegPlatonenko"' -Properties * |
Select-Object -Property name, managedby | Format-Table

Get-ADComputer -Filter 'operatingsystem -like "*server*"' -Properties operatingsystem, managedby |
Sort-Object managedby

Get-ADComputer -Filter 'operatingsystem -like "*server*"' -Properties operatingsystem, managedby |
Select-Object -Property name, managedby | Export-Csv C:\Temp\ServerOwners.csv

Get-ADComputer -Filter 'operatingsystem -like "*server*"' -Properties whenCreated, description |
Where-Object {((Get-Date) - $_.whenCreated).Days -lt 40} | select name, description, whencreated |
Sort-Object whencreated | Format-Table

Get-ADComputer -Filter 'operatingsystem -like "*server*"' -Properties whenCreated, description |
Where-Object {((Get-Date) - $_.whenCreated).Days -lt 40} | select name, description, whencreated |
Sort-Object whencreated | Export-Csv C:\Temp\server-report.csv