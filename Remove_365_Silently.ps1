# SaRACMD Office Scrub Tool [interactive]

iwr -Uri https://aka.ms/SaRA_EnterpriseVersionFiles -OutFile C:\SaRACMD.zip
Add-Type -AssemblyName 'System.IO.Compression.Filesystem'
[System.IO.Compression.ZipFile]::ExtractToDirectory("$env:HOMEDRIVE\SaRACMD.zip","$env:windir\SARACMD\")
echo "waiting 2 sec for shits n gigs"
Sleep -Seconds 2
iex ("SaRACMD.exe  '-AcceptEula' '-CloseOffice'")
