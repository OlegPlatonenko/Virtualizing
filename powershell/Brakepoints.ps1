$action = {
    if ($_ -and ($stacktrace -notmatch '^\s*at System\.Management\.Automation\.ExceptionHandlingOps\.CheckActionPreference') -and ($stacktrace -notmatch '^\s*at System\.Management\.Automation\.MshCommandRuntime\.ThrowTerminatingError\(ErrorRecord errorRecord\)\s*$')) {
        break
    }
}

$null = Set-PSBreakpoint -Variable stacktrace -Mode Write -Action $action