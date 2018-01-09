#Fisrt type of user promt - Read-Host cmdlet
$planeName = Read-Host -Prompt "Airbus or Boeing?"
if ($planeName -eq "Airbus") {
    Write-Host "Great choice!"
}
else {
    Write-Host "Special for US..."
}

#2nd type of user promt is .NET ChoiseDescription object

$Airbus = New-Object System.Management.Automation.Host.ChoiceDescription 'Airbus'
$Boeing = New-Object System.Management.Automation.Host.ChoiceDescription 'Boeing'
$options = [System.Management.Automation.Host.ChoiceDescription[]]($Airbus, $Boeing)

$title = 'Choose a plane'
$message = 'What is you favorite plane?'
$result =$Host.UI.PromptForChoice($title, $message, $options, 0)

switch($result)
{
    0 {'Great choice!'}
    1 {'Special for US...'}
}