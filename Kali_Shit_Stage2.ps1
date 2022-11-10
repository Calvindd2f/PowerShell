sleep 2
`
echo 'script restarted'..
`
msiexec.exe /qn /i C:\TemporaryWSLwsl_update_x64.msi
`
winget install -e --id kalilinux.kalilinux
