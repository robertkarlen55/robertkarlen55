<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Robert Karlen
    LinkedIn        : www.linkedin.com/in/robert-karlen-910794209
    GitHub          : https://github.com/robertkarlen55
    Date Created    : 2025-04-25
    Last Modified   : 2024-04-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

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

# YOUR CODE GOES HERE

# Define the Registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Check if the path exists; if not, create it
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force
}

# Set the 'MaxSize' DWORD value to 0x8000 (32768 in decimal)
New-ItemProperty -Path $RegPath -Name "MaxSize" -PropertyType DWord -Value 32768 -Force
