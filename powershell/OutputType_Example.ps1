function ListOfItems {
    ##Define type of output object, so f.e. hitting Tab will return list of Paramerets for var $_
    [OutputType('System.IO.FileInfo')]  
    [CmdletBinding()]
    param (
        [string]$Path 
    )
        Get-ChildItem -Path $Path
    }

##Example: ListOfItems -Path C:\ | Where-Object -FilterScript {$_.FullName}