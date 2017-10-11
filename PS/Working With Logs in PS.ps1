#LOG SEARCHING 
#-----------------------------------------------------------------------------------------------------

Get-WinEvent -ListLog * #Show all available logs
Get-WinEvent -ListLog *powershell* #Find log with specific word
Get-WinEvent -LogName 'System' #Display defined log
Get-WinEvent -LogName 'Microsoft-Windows-PowerShell/Operational' #Request log from log tree

Get-WinEvent -LogName 'System' | Out-Host -Paging #Display log by pages !!Works only in console
Get-WinEvent -LogName 'System' -MaxEvents 10 #Limit events number

Get-WinEvent -FilterHashtable @{LogName ='System'} #Search for log using hash table
Get-WinEvent -FilterHashtable @{LogName ='System'; ID='104'} #Adding additional search parameters
Get-WinEvent -FilterHashtable @{LogName ='System'; ID='16','7040'}

<#
LogAlways 0
Critical 1
Error 2
Warning 3
Informational 4
Verbose 5
#>

Get-WinEvent -FilterHashtable @{LogName = 'System'; Level='2'} #Define event Level

Get-WinEvent -FilterHashtable @{LogName = 'System'} | 
Where-Object -FilterScript {($_.Level -eq 2) -or ($_.Level -eq 3)} #Define different event levels

<#
Failure Audit 4503599627370496
Success audit 9007199254740992
#>

Get-WinEvent -FilterHashtable @{LogName= 'Security'; Keywords = '4503599627370496'} #Example of using failure audit
Get-WinEvent -FilterHashtable @{LogName= 'System'} | Where-Object -Property Message -Match 'the system has resumed' #search event with specific word

$StartTime = Get-Date -Year 2017 -Month 10 -Day 11 -Hour 12 -Minute 00 #Set time variable
$EndTime = Get-Date -Year 2017 -Month 10 -Day 11 -Hour 12 -Minute 45   #Set time variable
Get-WinEvent -FilterHashtable @{LogName='System'; StartTime=$StartTime; EndTime=$EndTime;} #Search event in specific period of time
Get-WinEvent -FilterHashtable @{LogName='System'; StartTime=$StartTime; EndTime=$EndTime; Level='4'; ID='1501'} #Search event with multiple parameters

Get-WinEvent -LogName 'System' -MaxEvents 10 | Format-List #Display events in list format
Get-WinEvent -FilterHashtable @{LogName='Security'; Keywords = '4503599627370496'} | Format-Table -Property RecordId, TimeCreated, ID, LevelDisplayName, Message
Get-WinEvent -FilterHashtable @{LogName ='Security'} | Where-Object -Property RecordId -eq 792140

#LOG PARSING
#-----------------------------------------------------------------------------------------------------

Get-EventLog -LogName System -Newest 10000 > C:\Users\oleg.platonenko\Documents\test_log.log

Get-Content -Path C:\Users\oleg.platonenko\Documents\test_log.log -Tail 10 #displaying last 10 lines from file
Get-Content -Path C:\Users\oleg.platonenko\Documents\test_log.log -Tail 10 -Wait # ---"--- and waiting for future events

Select-String -Path C:\Users\oleg.platonenko\Documents\test_log.log -Pattern 'disabled' #search for specific words in log
Select-String -Path C:\Users\oleg.platonenko\Documents\test_log.log -Pattern 'disabled', 'log' | Format-List #multiple conditions

#Look for 'err' word in log and return definately this fow, 5 before and 5 after
Select-String -Path C:\Users\oleg.platonenko\Documents\test_log.log -Pattern ' Error ' -Context 5

Get-Content -Path C:\Users\oleg.platonenko\Documents\test_log.log | Select-Object -First 10 -Skip 10 #Return rows from 10 to 20
