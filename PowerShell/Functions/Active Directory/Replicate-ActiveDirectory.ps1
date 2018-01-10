<#
.SYNOPSIS Kicks off Active Directory Replication on all Domain Controllers in the Domain Controller OU. You can also use an array of Domain Controllers for this as well.
.NOTES Author  :
.Notes Date    : 11/30/2017
.Notes Version : 1.0
.alias New-Alias RAD Replicate-ActiveDirectory
#>

$OUToSearch = "OU=Domain Controllers,DC=domain,DC=local"

function Replicate-ActiveDirectory
{
    #$DCList = @("addc01.domain.local","addc02.domain.local","addc01.domain.local","addc02.domain.local")
    $DCList = (Get-ADComputer -SearchBase "OU=Domain Controllers,DC=domain,DC=local" -Filter {OperatingSystem -Like "*2012*"} -Properties * |
            Select-Object Name -ExpandProperty Name)

    Invoke-Command -ComputerName $DCList -ScriptBlock {
        Repadmin /Syncall
    } | Out-Null
    Write-Host "Active Directory Replication has been kicked off!" -ForegroundColor DarkYellow -BackgroundColor DarkCyan
}