Function Invoke-Mimicry{
  <#
      .SYNOPSIS
      Describe purpose of "Mimic-Permissions" in 1-2 sentences.
        
      .DESCRIPTION
      Add a more complete description of what the function does.

      .EXAMPLE
      Mimic-Permissions


      .NOTES
       $GlobalAlias = New-Alias -Name 'immcry' -Value 'Invoke-Mimicry' -Scope Global -Description 'Invoke-Mimicry Alias; aka the function that copies attributes from one user to another.'
        Add-Content -Path $PSHOME\profile.ps1 -Value $GlobalAlias

      .LINK
      URLs to related sites
      The first link is opened by Get-Help -Online Mimic-Permissions

      .INPUTS
      List of input types that are accepted by this function.

      .OUTPUTS
      List of output types produced by this function.
  #>
}
#########################
#               INTO HERE                                     #
#########################

$Mimic_User = Read-Host -Prompt 'Domain User to Copy'

Write-Progress -Activity 'copying non-unique attributes and memes' -PercentComplete '62' 
Start-Sleep -Seconds 4 
Write-Progress -Activity 'copying non-unique attributes and memes' -PercentComplete '90' -Completed
Start-Sleep -Seconds '1'
Write-Host 'Done!' 
Start-Sleep -Seconds '2'

function Show-Menu
  {
      param (
          [string]$Title = 'Invoke-Mimicry'
      )
      Clear-Host
      Write-Host "================ $Title ================"
    
      Write-Host '1: Show selected users attributes'
      Write-Host '2: Copy non-unique attributes from copied user to existing user'
      Write-Host '3: Copy non-unique attributes from copied user to new user [lazy fuck].'
      Write-Host "Q: Press 'Here' to die."
  }

 

<#
    foreach($user in (Get-ADUser -Identity $mimic_user -Properties * | fl)){
    Set-ADUser $user -replace @{ xxxxxxxxx = "$($_.facsimileTelephoneNumber)" } -verbose
    }
#>
