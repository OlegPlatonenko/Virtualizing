<# At first we need to activate virtualization in BIOS. Unfortunately we can't do it with PS :(
The next action is to enable Hyper-V Windows Feature#>

Get-WindowsOptionalFeature -Online -FeatureName *Hyper* #Searching for Hyper-V features
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All #Enabling all of them

<# Check again that all requested features are enabled #>
Get-WindowsOptionalFeature -Online -FeatureName *Hyper* | Select-Object -Property FeatureName, DisplayName, State