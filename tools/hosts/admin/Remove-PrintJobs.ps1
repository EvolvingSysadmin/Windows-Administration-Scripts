﻿<#
.SYNOPSIS
    Removes print jobs of specified host
.EXAMPLE
    PS C:\> Remove-PrintJobs.ps1
.LINK
    https://github.com/EvolvingSysadmin/PowerShell/blob/main/scripts/Remove-PrintJobs.ps1 
.NOTES
    Written by https://github.com/EvolvingSysadmin
    MIT License
    Run script and input hostname or IP of target. Change comments to install burnt toast notifications if wanted
#>

# Install-Module -Name BurntToast # Installs optional notification module

$ComputerName = Read-Host -Prompt 'Input remote computer hostname or IP address'

# $ComputerName = "CONTOSO-PC" # Input remote computer name or IP address as variable

 $printers = Get-Printer -ComputerName $ComputerName
foreach ($printer in $printers) {
    $printjobs = Get-PrintJob -PrinterObject $printer 
    foreach ($printjob in $printjobs) {
        Remove-PrintJob -InputObject $printjob # removes all print jobs from all printers of remote computer specified above
    }
}

# New-BurntToastNotification -Text "All print jobs removed" -AppLogo $null -Silent #notification

####### To verify that print jobs have been removed

# Get-Printer -ComputerName
# Get-PrintJob -ComputerName -PrinterName