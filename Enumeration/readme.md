available as a one liner as well.

PS:> IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/Calvindd2f/PowerShell/main/Enumeration/WindowsEnumeration.ps1')

or

CMD:> powershell "IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/Calvindd2f/PowerShell/main/Enumeration/WindowsEnumeration.ps1')"



IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/Calvindd2f/PowerShell/main/Enumeration/WindowsEnumeration.ps1') > Enum.txt
