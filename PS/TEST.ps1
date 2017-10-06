$VM = New-VM -Name KaliLinux `
       -MemoryStartupBytes 2GB `
       -BootDevice CD `
       -Generation 1 `
       -NewVHDPath "C:\Users\Public\Documents\Hyper-V\Virtual hard disks\KaliLinux.vhdx" `
       -NewVHDSizeBytes 20GB `
       -Path "C:\Users\Public\Documents\Hyper-V"

$VM | Get-Member
$HDD = $VM.HardDrives | Select-Object -Property Path
$HDD
$HHD
