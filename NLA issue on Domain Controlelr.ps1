$domain = '____'
$netca = Get-NetAdapter -Physical | Select-Object -Property Name
if ($netca -notcontains $domain) {
Restart-Service -Name NlaSvc

}  Else {
Exit-PSHostProcess


}
