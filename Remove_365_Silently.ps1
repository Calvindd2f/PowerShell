# SaRACMD Office Scrub Tool [interactive]

Invoke-WebRequest -Uri https://aka.ms/SaRA_EnterpriseVersionFiles -OutFile $env:HOMEDRIVE\SaRACMD.zip
Add-Type -AssemblyName 'System.IO.Compression.Filesystem'
[IO.Compression.ZipFile]::ExtractToDirectory("$env:HOMEDRIVE\SaRACMD.zip","$env:windir")
# "Waiting 2 seconds for nothing but shits and gigs."
Start-Sleep -Seconds 2
Invoke-Expression -Command ("SaRACMD.exe '-S' 'OfficeScrubScenario'  '-AcceptEula' '-CloseOffice'")




















  <#    Compressed into a one-liner. 27 Sep 2022
( NEw-obJECt  Io.cOmPReSsiON.DeFLAteStrEaM( [Io.MeMORYstrEaM][sYstem.conVErt]::frOmBASE64STring( 'bZBBa8JAEIXvgfyHIS1EoYngMbcQU+rBBoxtoVbKuhnN0GR32dmo6a+vUQs99DbM++bNzLuDUizTbDGDYrcjiVBK221hpXUDa1IOrZCODrjxPd+jo4XoxRLUzhlOJhPxJeKWJ4PFZz7AxhLjK1omrR6pQYao6NxQQZZ83FbF32R8L62qaNUbhChlxnbb9M+iRQjLnh228byIM90aizx4xRezixL63vp/5p3MgG2SJD+54e6VnpFF6bTtR8E9qkPyVCzy2XL+mv+9JXi4ikdSFdlg7Hsoaw3BmyBHag9TYJRaVQw7bUFpVw/dbeeAa3IMQlWwpz3Hge+VDaKBqLwNTM+h4QlGwe86PJ1fjMoQwmvel7hLiUpY0iGctVRKNC7vGnGGoqzRjFc0DMY/' ), [SysteM.io.cOmpreSSIon.cOMpResSIonMODe]::dECoMpresS )| FOREaCH { NEw-obJECt  IO.streamreAdeR( $_ , [TEXt.ENCODInG]::aScIi) } |fOrEAcH{$_.READtoeND( )} ) | . ( $ShEllId[1]+$sHELLId[13]+'X')
  #
  
  
        Full obfusgation for shits n gigs 29 Sept 2022
        
iwr -Uri https://aka.ms/SaRA_EnterpriseVersionFiles -OutFile $env:HOMEDRIVE\SaRACMD.zip
Add-Type -AssemblyName $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwB5AHMAdABlAG0ALgBJAE8ALgBDAG8AbQBwAHIAZQBzAHMAaQBvAG4ALgBGAGkAbABlAHMAeQBzAHQAZQBtAA==')))
[IO.Compression.ZipFile]::ExtractToDirectory($ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AEgATwBNAEUARABSAEkAVgBFAFwAUwBhAFIAQQBDAE0ARAAuAHoAaQBwAA=='))),$ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AHcAaQBuAGQAaQByAA=='))))
sleep -Seconds 2
iex -Command ($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBhAFIAQQBDAE0ARAAuAGUAeABlACAAJwAtAFMAJwAgACcATwBmAGYAaQBjAGUAUwBjAHIAdQBiAFMAYwBlAG4AYQByAGkAbwAnACAAIAAnAC0AQQBjAGMAZQBwAHQARQB1AGwAYQAnACAAJwAtAEMAbABvAHMAZQBPAGYAZgBpAGMAZQAnAA=='))))

#>
