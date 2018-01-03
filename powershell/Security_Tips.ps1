#Create AD group Loca-Admins and add it to machine local admins.
#During script execution add there user which need Admin priviledges and delete after script finished.

#On this script test username will be Dan and SG in AD - local-admins
Add-ADGroupMember -Identity local-admins -Members Dan
Remove-ADGroupMember -Identity local-admins -Members Dan -Confirm:$false

#Another way is to reset password after script execution
function Reset-InvokePassword {
param (
    [Parameter(Mandatory=$true)]
    [string]$UserName 
)    

    $NewSecurePassword = ConvertTo-SecureString -String (New-SWRandomPassword -MaxPasswordLength 14) -AsPlainText -Force
    try {
        Set-ADAccountPassword -Identity $UserName -NewPassword $NewSecurePassword -Reset -Confirm:$false -ErrorAction Stop
    }
    catch {
        Write-Output "Could not change password"
        $ErrorMessage = $_.Exeption.Message
        $ErrorMessage
        break
    }
    New-Object System.Management.Automation.PSCredential($UserName, $NewSecurePassword)
}

#-----------------------------------------------------------------------------------------------------------------------------

Add-ADGroupMember -Identity local-admins -Members Dan -Verbose
$Credential = Reset-InvokePassword -UserName Dan

Invoke-Command -ComputerName Test1, Test2 -Credential $Credential -ScriptBlock {
    Restart-Service wuauserv -Verbose
}

Reset-InvokePassword -UserName Dan | Out-Null
Remove-ADGroupMember -Identity local-admins -Members Dan -Confirm:$false -Verbose