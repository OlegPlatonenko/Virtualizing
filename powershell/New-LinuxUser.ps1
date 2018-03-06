function New-LinuxUser
{
	(
		[Parameter(Mandatory=$true)]
		[string]$Name,
		[Parameter(Mandatory=$true)]
		[string]$Description,
		[Parameter(Mandatory=$true)]
		[pscredential]$Password
	)

	/usr/bin/useradd $Name --comment $Description
	echo $Password.GetNetworkCredential().Password | passwd --stdin $Name
}

New-LinuxUser -Name test1 -Description 'test' -Password (Get-Credential -UserName test1)