function Checker{

$moduleInfo = Get-Module | Select-Object -Property Name
    if ($moduleInfo -match 'Activedirectory'){
        return $true    
}
return $false

}
if (Checker){

    Write-Output "Menu:`n    1.New User`n    2.New Group`n    3.Add User to group"
    $option =  Read-Host 'Active Directory turned on please describe what you need'
   switch($option){
    1{
        $firstName = Read-Host = "Please describe first name of your new user"
        $secName = Read-Host = "Please describe second name of your new user"
        $password = Read-Host = "Set user's password:"

        $username = $firstName[0]+"."+$secName
        $domain = Get-ADDomain | Select-Object -Property Name
        Write-Output $domain
     #   Write-Output $username
        $userCred = @{
            Name = $firstName+" "+$secName
            AccountPassword = $password
            Enabled = $true
            SamAccountName = $username
            ObjectClass = user


        }
        Write-Output $userCred.Name



    }



   }
}

 
else{
    Import-Module ActiveDirectory
    Start-Process .\functionchecker.ps1
}

