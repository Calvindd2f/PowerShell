get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct
Get-Service | Select-Object -Property DisplayName,ServiceType,StartType,Status | Sort-Object -Property Status -Descending

$myFirstName | Select-Object -Property Length
#
#Length
#------
#9
Get-Service | Get-Member
Get-Service | Select-Object -Property "DisplayName","MachineName","ServiceType","StartType","Status"
Get-Service | Select-Object -Property DisplayName,ServiceType,StartType,Status | Sort-Object -Property Status -Descending | Where-Object StartType -EQ Automatic
Get-Service | Select-Object -Property ServiceName,DisplayName,ServiceType,StartType,Status | Sort-Object -Property Status -Descending | Where-Object {$_.StartType -EQ "Automatic" -And $_.ServiceName -Match "^s"}
Get-Service | Select-Object -Property ServiceName,DisplayName,ServiceType,StartType,Status | Sort-Object -Property Status -Descending | Where-Object {$_.StartType -EQ "Automatic" -And $_.ServiceName -Match "^s"} | Format-Table
Get-Process | Select-Object -Property ProcessName,SessionID | Sort-Object -Descending | Where-Object -Property 'SessionID' -EQ -Value '2'

Get-Process | Select-Object -Property ProcessName,SessionID | Sort-Object -Property ProcessName -Descending | Where-Object {$_.FileName -eq "svchost.exe" -and $_.Id -eq 2} | Format-Table
