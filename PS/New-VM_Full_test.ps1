<#
.Synopsis
   New Hyper-V VM Function
.DESCRIPTION
   Functions promts user for VM Parameters and creates new VM in Hyper-V Manager. Virtualization must be enabled in BIOS!
.EXAMPLE
   New-VM -Name KaliLinux `
       -MemoryStartupBytes 2GB `
       -BootDevice CD `
       -Generation 1 `
       -NewVHDPath "C:\Users\Public\Documents\Hyper-V\Virtual hard disks\KaliLinux.vhdx" `
       -NewVHDSizeBytes 20GB `
       -Path "C:\Users\Public\Documents\Hyper-V"
#>
function New-HyperVVM {
    [string]$Def = Read-Host -Prompt "If you want to use default configuration, enter 'd'"
    if ($Def.ToLower() -eq 'd') {
        $VMname = "New_VM"
        $VMMemory = 2GB
        $VMBootDeviceType = "CD"
        $VMGeneration = 1
        $VMVHDPath = "C:\Users\Public\Documents\Hyper-V\Virtual hard disks\New_VM.vhdx"
        $VMVHDSize = 30GB
        $VMPath = "C:\Users\Public\Documents\Hyper-V"

        New-VM -Name $VMname `
           -MemoryStartupBytes $VMMemory `
           -BootDevice $VMBootDeviceType `
           -Generation $VMGeneration `
           -NewVHDPath $VMVHDPath `
           -NewVHDSizeBytes $VMVHDSize `
           -Path $VMPath
    }
    else {
        $VMname = Read-Host -Prompt "Enter Virtual Machine name"
        [int64]$VMMemory = Read-Host -Prompt "Enter Virtual Machine startum memory amount (GB)"
        $VMBootDeviceType = Read-Host -Prompt "Enter boot device type CD or anything else"
        $VMGeneration = Read-Host -Prompt "Enter VM Generation 1 or 2"
        $VMVHDPath_Temp = Read-Host -Prompt "Enter path to VHD will be stored"
        $VMVHDPath = $VMVHDPath_Temp + '\' + $VMname + ".vhdx"
        [int64]$VMVHDSize = Read-Host -Prompt "Enter VHD amount (GB)"
        $VMPath = Read-Host -Prompt "Enter path to VM will be stored"

        New-VM -Name $VMname `
           -MemoryStartupBytes ($VMMemory*1GB) `
           -BootDevice $VMBootDeviceType `
           -Generation $VMGeneration `
           -NewVHDPath $VMVHDPath `
           -NewVHDSizeBytes ($VMVHDSize*1GB)`
           -Path $VMPath
    }
}
New-HyperVVM

<#
.Synopsis
   Delete chosen VM's
.DESCRIPTION
   Function returns list of VM's and promt user for enter name to delete
.EXAMPLE
   Remove-VM -Name KaliLinux -Force
#>
function Remove-HyperVVM {
    $VMList = Get-VM | Select-Object -Property Name, State, Uptime | Format-Table
    $VMList
    $VMName = Read-Host -Prompt "Enter Virtual Machine Name for delete (listed above)"
    Remove-VM -Name $VMName -Force
    [string]$Def = Read-Host -Prompt "If path to VHDX file is default, please, ented 'd'"
    if ($Def.ToLower() -eq "d") {
        $VMPath_Temp = "C:\Users\Public\Documents\Hyper-V\Virtual hard disks"
        $VMPath = $VMPath_Temp + '\' + $VMName + ".vhdx"
        Remove-Item -Path $VMPath -Force
    }
    else {
        $VMPath_Temp = Read-Host -Prompt "Enter path to VHD file location"
        $VMPath = $VMPath_Temp + '\' + $VMName + ".vhdx"
        Remove-Item -Path $VMPath -Force
    }
}
Remove-HyperVVM