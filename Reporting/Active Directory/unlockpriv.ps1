function Unlock-Priv
{
  <#
    .SYNOPSIS
    Short Description
    .DESCRIPTION
    Detailed Description
    .EXAMPLE
    Unlock-Priv
    explains how to use the command
    can be multiple lines
    .EXAMPLE
    Unlock-Priv
    another example
    can have as many examples as you like
  #>
  #Requires -RunAsAdministrator
  $key =  "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\CentraStage"
  $value = "DisplayVersion"
  
  $version = (Get-ItemProperty -Path $key -Name $value).$value
  
  $path = "C:\Windows\System32\config\systemprofile\AppData\Local\CentraStage\CagService.exe_Url_nin2uaxj2lsg1o0rsz2amvmcciusvum4\"
  $file = "\user.config"
  
  $combo = "$($path)$($version)$($file)"
  
  $xml = [xml](Get-Content "$($path)$($version)$($file)")
  
  
  $node = $xml.configuration.usersettings."CentraStage.Cag.Core.Settings".setting | where {$_.Name -eq 'PrivacyMode'}
  
  If ($node.value -eq 'False')
  {
    $node.value = 'True'
  }
  Else
  {
    $node.value = 'False'
  }
  
  $xml.Save($combo)
  
  Stop-Process -Name "CagService" -force
  
  Start-Service "Cagservice"
  Break
  Exit
}
