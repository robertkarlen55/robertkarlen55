<#
.SYNOPSIS
    This PowerShell script ensures that Windows 10 is configured to prioritize ECC curves with longer key lengths first

.NOTES
    Author          : Robert karlen
    LinkedIn        : www.linkedin.com/in/robert-karlen-910794209
    GitHub          : github.com/robertkarlen55
    Date Created    : 2025-04-29
    Last Modified   : 2025-04-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000052

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
# Set ECC Curve Order to prioritize stronger curves first
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002" -Name "EccCurves" -Type MultiString -Value @("NistP384", "NistP256")
