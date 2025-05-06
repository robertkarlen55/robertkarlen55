<#
.SYNOPSIS
    This PowerShell script ensures that Windows 10 account lockout duration is configured to 15 minutes or greater.

.NOTES
    Author          : Robert Karlen
    LinkedIn        : www.linkedin.com/in/robert-karlen-910794209
    GitHub          : https://github.com/robertkarlen55
    Date Created    : 2025-05-06
    Last Modified   : 2024-05-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000005

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
# Set Account Lockout Duration to 15 minutes (value is in minutes)
$Duration = 15

# Apply the account lockout duration policy
net accounts /lockoutduration:$Duration

Write-Output "Account lockout duration has been successfully set to $Duration minutes."
