<#
.Synopsis
   Start Hyper-V VM Function
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
    Param
    (
        <# Virtual machine name
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $VMname = "Default-VM",

        # Amount of startup memory
        [int]
        $VMMemory = 2.5GB,

        # Boot device type 
        [int]
        $VMMBootDevType = "CD"#>

    )
    $VMname = Read-Host -Prompt "Enter Virtual Machine name"
}
New-HyperVVM