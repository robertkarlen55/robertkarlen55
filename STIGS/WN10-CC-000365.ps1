<#
.SYNOPSIS
    This PowerShell script ensures that Windows 10 is configured to prevent Windows apps from being activated by voice while the system is locked.

.NOTES
    Author          : Robert Karlen
    LinkedIn        : www.linkedin.com/in/robert-karlen-910794209
    GitHub          : https://github.com/robertkarlen55
    Date Created    : 2025-05-07
    Last Modified   : 2024-05-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000365

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
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"
New-Item -Path $RegPath -ErrorAction SilentlyContinue | Out-Null
Set-ItemProperty -Path $RegPath -Name "LetAppsActivateWithVoiceAboveLock" -Value 2 -Type DWord
