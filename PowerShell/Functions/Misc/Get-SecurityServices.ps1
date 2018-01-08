<#
.SYNOPSIS Queries the domain for all servers in the server OU, and gets all Protection & Response Services that are not in a "running" status
.NOTES
Author  :
Date    : 12/14/2017
#>

function Get-SecurityServices
{
    # Get all Servers from the Server OU in Active Directory #
    $ServerList = Get-ADComputer -SearchBase "OU=Servers,OU=ou,DC=domain,DC=com" -Filter {OperatingSystem -like "*Server*"}|
        Select-Object DNSHostName -ExpandProperty DNSHostName
    Write-Host "Active Directory Servers have been queried. Gathering all server services now..." -ForegroundColor DarkYellow -BackgroundColor DarkCyan
    # Get the Protection, Response, and FortiSIEM service status from all servers #
    Get-Service -ComputerName $ServerList -Name "CarbonBlack", "Parity", "AoWinAgt" |
        Where-Object {$_.Status -ne "Running"} |
        Select-Object Status, Name, DisplayName, MachineName |
        Sort-Object -Property MachineName
}
