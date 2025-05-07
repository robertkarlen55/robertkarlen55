<#
.SYNOPSIS
    This PowerShell script ensures that back up files and directories user right must only be assigned to the Administrators group.

.NOTES
    Author          : Robert Karlen
    LinkedIn        : www.linkedin.com/in/robert-karlen-910794209
    GitHub          : https://github.com/robertkarlen55
    Date Created    : 2025-05-07
    Last Modified   : 2024-05-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-UR-000030

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#># Define the privilege and the group
$Privilege = "SeBackupPrivilege"
$Admins = "Administrators"

# Get current assignments
$current = (secedit /export /cfg $env:TEMP\secpol.cfg) | Out-Null
$secpol = Get-Content $env:TEMP\secpol.cfg

# Modify the policy line directly
if ($secpol -match "^$Privilege"){
    $secpol = $secpol -replace "^$Privilege.*", "$Privilege = *S-1-5-32-544"
} else {
    $secpol += "$Privilege = *S-1-5-32-544"
}

# Save the modified policy file
$secpol | Set-Content $env:TEMP\secpol.cfg -Encoding Unicode

# Apply the modified security policy
secedit /configure /db $env:TEMP\secedit.sdb /cfg $env:TEMP\secpol.cfg /areas USER_RIGHTS

# Cleanup temporary files
Remove-Item $env:TEMP\secpol.cfg -Force
Remove-Item $env:TEMP\secedit.sdb -Force
