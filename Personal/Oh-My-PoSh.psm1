# oh-my-posh
winget install JanDeDobbeleer.OhMyPosh -s winget
# oh-my-posh update check
winget upgrade JanDeDobbeleer.OhMyPosh -s winget

notepad $PROFILE
# If Errors
New-Item -Path $PROFILE -Type File -Force
# Then
oh-my-posh init pwsh | Invoke-Expression
# & ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" --print) -join "`n"))
