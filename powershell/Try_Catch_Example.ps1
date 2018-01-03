<#To use Try/Catch first set $ErrorActionPreference to Stop to make all errors terminating. So if error appears it will stop the script running#>
function Run-Example {
    param()

    $ErrorActionPreference = 'Stop'

    try {
        ##Script Text

        ##Return an error
        Write-Error -Message 'Error!'
    }
    catch {
        Write-Host $_.Exception.Message -ForegroundColor Green
    } 
    finally {
        Write-Host -Object 'Code after error'
    }
}

Run-Example