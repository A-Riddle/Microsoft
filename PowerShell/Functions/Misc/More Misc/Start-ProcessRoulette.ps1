<#
.SYNOPSIS Loops & kills random processes with a random time of 1 minute - 1 hour.
.NOTES Author  :
.Notes Date    : 12/1/2017
#>

function Start-ProcessRoulette
{
    while ($true)
    {
        $random = Get-Random -Minimum 60 -Maximum 3600
        Start-Sleep -Seconds $random
        Get-Process | Get-Random | Stop-Process -Force
    }
}
