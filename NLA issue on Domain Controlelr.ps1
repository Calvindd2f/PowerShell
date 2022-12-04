function Repair-NLA
{
  <#
    .SYNOPSIS
    NLA fix
    .DESCRIPTION
    NLA Fix intended to be ran on a DC
    .EXAMPLE
    Repair-NLA
    #>
  $domain = $env:userdomain
  $netadp = Get-NetAdapter -Physical | Select-Object -ExpandProperty Name
  if ($netadp -notcontains $domain) 
  {
    Restart-Service -Name NlaSvc -Force
  }
  Else 
  {
    Exit
  }
}
