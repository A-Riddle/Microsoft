<#
.SYNOPSIS Get an Active Directory User's Computer IP Address by searching for the user's SMB session/s on the file server.
.NOTES Author  :
.Notes Date    : 11/25/2017
.Notes Version : 1.0
.PARAMETER Username
  Input the partial user name. This name will be searched with wildcards on both sides of the string.
.EXAMPLE
  Get-UserIPAddress -Username joe
#>

$FileServerName = fileserver01.domain.com

function Get-UserIPAddress
{
    param
    (
        [Parameter(Mandatory)]
        [String] $UserName
    )
    #Create Username to search#
    $UserName = "*" + "$UserName" + "*"
    #Search file server for smb users with a "like" name using the created username variable from above.#
    Invoke-Command -ComputerName $FileServerName -ScriptBlock {
        Get-SmbSession |
            Where-Object -Property ClientUserName -Like $Using:Username |
            Select-Object ClientComputerName, ClientUserName |
            Format-Table
    }
}