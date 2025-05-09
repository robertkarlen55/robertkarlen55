<#
.SYNOPSIS
    This PowerShell script ensures that Autoplay is disabled for all drives.

.NOTES
    Author          : Robert Karlen
    LinkedIn        : www.linkedin.com/in/robert-karlen-910794209
    GitHub          : https://github.com/robertkarlen55
    Date Created    : 2025-05-08
    Last Modified   : 2025-05-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000190

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
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
                 -Name "NoDriveTypeAutoRun" `
                 -Value 255 `
                 -Type DWord
