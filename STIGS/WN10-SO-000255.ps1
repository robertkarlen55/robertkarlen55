<#
.SYNOPSIS
    This PowerShell script ensures that User Account Control will automatically deny elevation requests for standard users.

.NOTES
    Author          : Robert Karlen
    LinkedIn        : www.linkedin.com/in/robert-karlen-910794209
    GitHub          : https://github.com/robertkarlen55
    Date Created    : 2025-05-06
    Last Modified   : 2024-05-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000255

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>
# Set registry path and values
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$valueName = "ConsentPromptBehaviorUser"
$valueData = 0

# Ensure the registry path exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set registry to automatically deny elevation requests for standard users
Set-ItemProperty -Path $regPath -Name $valueName -Value $valueData -Type DWord -Force

Write-Output "Configured User Account Control to automatically deny elevation requests for standard users."
