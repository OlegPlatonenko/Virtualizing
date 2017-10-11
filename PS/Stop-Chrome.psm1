function Stop-Chrome {
    get-process -Name chrome | Stop-Process
}