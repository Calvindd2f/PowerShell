#requires -RunAsAdministratorhttps://jasoncoltrin.com/2018/08/02/how-to-set-clock-time-on-ad-domain-controller-and-sync-windows-clients/

<#
   .SYNOPSIS
   Force Time re-sync with PowerShell
   .DESCRIPTION
   Force Time re-sync as a PowerShell script
   .EXAMPLE
   PS C:\> .\ForceTimeResync.ps1
   Force Time Resync as a PowerShell script (Wrapper for w32tm.exe). Most be executed in an elevated shell)
   .NOTES
   Self Explanatory
#>
[CmdletBinding(ConfirmImpact = 'None')]
param ()

process
{
   $null = (& "$env:windir\system32\w32tm.exe" /resync /force)
}
