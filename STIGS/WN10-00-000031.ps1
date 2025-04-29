<#
.SYNOPSIS
    This PowerShell script ensures that Windows system is required to use a BitLocker pin for pre-boot authentication 

.NOTES
    Author          : Robert Karlen
    LinkedIn        : www.linkedin.com/in/robert-karlen-910794209
    GitHub          : github.com/robertkarlen55
    Date Created    : 2025-04-29
    Last Modified   : 2025-04-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000031

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
# Create the required registry path if it doesn't exist
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\FVE" -Force | Out-Null

# Set the required registry values
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\FVE" -Name "UseAdvancedStartup" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\FVE" -Name "UseTPMPIN" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\FVE" -Name "UseTPMKeyPIN" -Type DWord -Value 1
