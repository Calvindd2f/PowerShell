##################################################
#                                                        
#                                                
#                                                   JML - Leaver - Release Edition                                
##################################################

    # Base OU for searching for expired accounts
    $BaseSearchOU='OU=Users,DC=Domain,DC=Local'

    # OU that the expired accounts will be moved to
    $DestinationOU='OU=DisabledUsers,DC=Domain,DC=Local'

    # Imports the PowerShell AD module **NOTE** RSAT needs to be installed on the system running the script
    if (Get-Module -ListAvailable -Name ActiveDirectory) {

    Import-Module -Name ActiveDirectory

    #  If the module is not available, inform executioner & terminate
    } else {
    Write-Verbose -Message 'No Active Directory Module found. RSAT tools need to be installed. If you are editing this script on a workstation, try to load the module from Nishang Github'

    throw 'Error'
    }


    # Function to generat a new random password
	    function script:New-SWRandomPassword {
	[CmdletBinding(DefaultParameterSetName='FixedLength',ConfirmImpact='None')]
        [OutputType([String])]
        Param
        (
            # Specifies minimum password length
            [Parameter(ParameterSetName='RandomLength')]
            [ValidateScript({$_ -gt 0})]
            [Alias('Min')] 
            [int]$MinPasswordLength = 12,
            
            # Specifies maximum password length
            [Parameter(ParameterSetName='RandomLength')]
            [ValidateScript({
                    if($_ -ge $MinPasswordLength){$true}
                    else{Throw 'Max value cannot be lesser than min value.'}})]
            [Alias('Max')]
            [int]$MaxPasswordLength = 20,
    
            # Specifies a fixed password length
            [Parameter(ParameterSetName='FixedLength')]
            [ValidateRange(1,2147483647)]
            [int]$PasswordLength = 8,
            
            # Specifies an array of strings containing charactergroups from which the password will be generated.
            # At least one char from each group (string) will be used.
            [String[]]$InputStrings = @('abcdefghijkmnpqrstuvwxyz', 'ABCEFGHJKLMNPQRSTUVWXYZ', '23456789', '!#%&'),
    
            # Specifies a string containing a character group from which the first character in the password will be generated.
            # Useful for systems which requires first char in password to be alphabetic.
            [Parameter(Mandatory=$true,HelpMessage='Add help message for user')][String] $FirstChar,
            
            # Specifies number of passwords to generate.
            [ValidateRange(1,2147483647)]
            [int]$Count = 1
        )
        Begin {
            
                                   function Select-Something
                                   {
                                     param
                                     (
                                       [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage='Data to process')]
                                       $InputObject
                                     )
                                     process
                                     {
                                       [Char[]]$InputObject
                                     }
                                   }

Function Get-Seed{
                # Generate a seed for randomization
                $RandomBytes = New-Object -TypeName 'System.Byte[]' -ArgumentList 4
                $Random = New-Object -TypeName 'System.Security.Cryptography.RNGCryptoServiceProvider'
                $Random.GetBytes($RandomBytes)
                [BitConverter]::ToUInt32($RandomBytes, 0)
            }
        }
        Process {
            For($iteration = 1;$iteration -le $Count; $iteration++){
                $Password = @{}
                # Create char arrays containing groups of possible chars
                [char[][]]$CharGroups = $InputStrings
    
                # Create char array containing all chars
                $AllChars = $CharGroups | Select-Something
    
                # Set password length
                if($PSCmdlet.ParameterSetName -eq 'RandomLength')
                {
                    if($MinPasswordLength -eq $MaxPasswordLength) {
                        # If password length is set, use set length
                        $PasswordLength = $MinPasswordLength
                    }
                    else {
                        # Otherwise randomize password length
                        $PasswordLength = ((Get-Seed) % ($MaxPasswordLength + 1 - $MinPasswordLength)) + $MinPasswordLength
                    }
                }
    
                # If FirstChar is defined, randomize first char in password from that string.
                if($PSBoundParameters.ContainsKey('FirstChar')){
                    $Password.Add(0,$FirstChar[((Get-Seed) % $FirstChar.Length)])
                }
                # Randomize one char from each group
                Foreach($Group in $CharGroups) {
                    if($Password.Count -lt $PasswordLength) {
                        $Index = Get-Seed
                        While ($Password.ContainsKey($Index)){
                            $Index = Get-Seed                        
                        }
                        $Password.Add($Index,$Group[((Get-Seed) % $Group.Count)])
                    }
                }
    
                # Fill out with chars from $AllChars
                for($i=$Password.Count;$i -lt $PasswordLength;$i++) {
                    $Index = Get-Seed
                    While ($Password.ContainsKey($Index)){
                        $Index = Get-Seed                        
                    }
                    $Password.Add($Index,$AllChars[((Get-Seed) % $AllChars.Count)])
                }
                Write-Output -InputObject $(-join ($Password.GetEnumerator() | Sort-Object -Property Name | Select-Object -ExpandProperty Value))
            }
        }
    }

    # Searches the set base OU for accounts that have passed their expiry date
    $Users=Search-ADAccount -AccountExpired -UsersOnly -SearchBase $BaseSearchOU

    # Goes through each account and check to see if it is disabled or not
    ForEach ($user in $Users) 
    {
        $Status=Get-ADUser -Identity $user -Properties *
        $SAM=$user.SamAccountName
            
    # If the account is not currently disabled this statement will disable it        
            If ($Status.Enabled -eq $True)
                {
                Disable-ADAccount -Identity $user
                }
           
    # A check to confirm that the account was successfully disabled and saves the result to a variable 
        $disabled = If ($Status.Enabled -eq $False)
                    {       
                    continue  
                    }
                
                    Else
                   {
                    Write-Verbose -Message ('There was an issue with disabling {0}' -f $SAM)
                   }                   
                   
    # If there was an issue with disabling the account an error will be displayed in the terminal            
            If($disabled){
               $disabled
                }
            
    # If no error continue with the password reset and OU move            
                Else{

                    # Uses the New-Password function to generate a secure password and store in a variable
                    $newpass = New-RandomPa
                   
    # Rest the accounts password with one created by the New-Password function
                    Set-ADAccountPassword -Identity $user -Reset -NewPassword (ConvertTo-SecureString -AsPlainText -String $newpass -Force)

    # Moves the account to the selected Destination OU        
                    Move-ADObject -Identity $user -TargetPath $DestinationOU
     
    # Outputs the results to the PowerShell terminal        
                    Write-Verbose -Message ('{0} was moved to {1} is the new password of {2} , copy pasta this, then [Start-ADSyncCycle -Type Delta] if available' -f $SAM, $DestinationOU, $newpass)                   
                }
    }
