##Cmd to uninstall office automatically
## Needed to be done fast

$im = '/im'
$f = '/f'
$365_Kill = "$env:windir\system32\taskkill.exe"
$SaRA_dir = "$env:HOMEDRIVE\Tools\SaRACmd"
${SaRA.zip} = "$env:HOMEDRIVE\SaRACmd.zip"
iwr https://aka.ms/SaRA_CommandLineVersionFiles -OutFile ${SaRA.zip}
start-sleep 8
mkdir -Path $SaRA_dir
start-sleep 1
Expand-Archive -LiteralPath ${SaRA.zip} -DestinationPath $SaRA_dir -Force
cd $SaRA_dir
Start-Sleep 2
& $365_Kill $f, $im, 'excel.exe'
& $365_Kill $f, $im, 'winword.exe'
Start-Sleep -Seconds 1
start-process 'SaRAcmd.exe' -ArgumentList '-S', 'OfficeScrubScenario',' -AcceptEula',' -Officeversion',' All'
