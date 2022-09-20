<# SaRACMD Component


Name	SaRACMD
Icon	$null
Desc	SaRA CMD for very specific office 365 or H&B issues.
        it downloads a new version each time as SaRA stops working after 90 days.
        https://aka.ms/SaRA_EnterpriseVersionFiles
Level 		1
Catagory 	Scripts
Scripts		PowerShell
Sites		default
Variables	@{`
SaRAcmd.exe -S OfficeScrubScenario -AcceptEula`
SaRAcmd.exe -S ExpertExperienceAdminTask -AcceptEula`
SaRAcmd.exe -S TeamsAddinScenario -AcceptEula -CloseOutlook`
SaRAcmd.exe -S OfficeActivationScenario -AcceptEula -CloseOffice`
# -RemoveSCA    This switch removes Shared Computer Activation (SCA) and configures non-SCA activation for Office.`
# -OfflineScan                    `
# -OfficeVersion <version>                    `
#   The allowed values for <version> are: All, M365, 2021, 2019, 2016, 2013, 2010, and 2007                    `
SaRAcmd.exe -S OfficeScrubScenario -AcceptEula -Officeversion 2016`
#`
#`
#   To uninstall all Office versions, run the following command from an elevated Command Prompt window:`
        SaRAcmd.exe -S OfficeScrubScenario -AcceptEula -Officeversion All`
#`
#`
#`
> ExpertExperienceAdminTask`
> OfficeScrubScenario`
> TeamsAddinScenario [-CloseOutlook -AcceptEula ]`
> OutlookCalendarCheckTask`
> OfficeActivationScenario`
> OfficeSharedActivationScenario`
> ResetOfficeActivation`
}

Files
    https://aka.ms/SaRA_EnterpriseVersionFiles
Post-condiitons

Create Component
#>




>   #SCRIPT

(New-Object Net.WebClient).DownloadFile('https://aka.ms/SaRA_EnterpriseVersionFiles','C:\SaRACMD.zip')
Add-Type -Assembly "System.IO.Compression.Filesystem" 
[System.IO.Compression.ZipFile]::ExtractToDirectory('C:\SaRACMD.zip','C:\Windows\SaRACMD')

$1='-S OfficeScrubScenario -AcceptEula'
$2='-S ExpertExperienceAdminTask -AcceptEula'
$3='-S TeamsAddinScenario -AcceptEula -CloseOutlook'
$4='-S OfficeActivationScenario -AcceptEula -CloseOffice'
$5='-S OfficeScrubScenario -AcceptEula -Officeversion All'
$default='-CloseOffice'

Start-Process 'SaRAcmd.exe' -ArgumentList $env:default
