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
function New-HyperVVM
{
    [CmdletBinding()]
    <# Param
    (
        Virtual machine name
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $VMname = "Default-VM",

        # Amount of startup memory
        [int]
        $VMMemory = 2.5GB,

        # Boot device type 
        [int]
        $VMBootDevType = "CD"

    ) 
    #>
    [string]$Def = Read-Host -Prompt "If you want to use default configuration, enter 'd'"
    if ($Def.ToLower() -eq 'd') {
        $VMname = "New_VM"
        $VMMemory = 2.5GB
        $VMBootDeviceType = "CD"
        $VMGeneration = 1
        $VMVHDPath = "C:\Users\Public\Documents\Hyper-V\Virtual hard disks\New_VM.vhdx"
        $VMVHDSize = 30GB
        $VMPath = Read-Host -Prompt "C:\Users\Public\Documents\Hyper-V"
    }
    else {
        $VMname = Read-Host -Prompt "Enter Virtual Machine name"
        $VMMemory = Read-Host -Prompt "Enter Virtual Machine startum memory amount (GB)"
        $VMBootDeviceType = Read-Host -Prompt "Enter boot device type CD or anything else"
        $VMGeneration = Read-Host -Prompt "Enter VM Generation 1 or 2"
        $VMVHDPath = Read-Host -Prompt "Enter path to VHD will be stored"
        $VMVHDSize = Read-Host -Prompt "Enter VHD amount (GB)"
        $VMPath = Read-Host -Prompt "Enter path to VM will be stored"
    }

    New-VM -Name $VMname `
       -MemoryStartupBytes $VMMemory `
       -BootDevice $VMBootDeviceType `
       -Generation $VMGeneration `
       -NewVHDPath $VMVHDPath `
       -NewVHDSizeBytes $VMVHDSize `
       -Path $VMPath
}
New-HyperVVM