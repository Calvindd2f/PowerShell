# SaRACMD Office Scrub Tool [interactive]

iwr -Uri https://aka.ms/SaRA_EnterpriseVersionFiles -OutFile C:\SaRACMD.zip
Add-Type -AssemblyName 'System.IO.Compression.Filesystem'
[System.IO.Compression.ZipFile]::ExtractToDirectory("$env:HOMEDRIVE\SaRACMD.zip","$env:windir")
echo "Waiting 2 seconds for nothing but shits and gigs."
Sleep -Seconds 2
iex ("SaRACMD.exe '-S' 'OfficeScrubScenario'  '-AcceptEula' '-CloseOffice'")
