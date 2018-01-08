# Variables #
$CorrectConfig = "c:\file.conf"
$ClientConfigPath = "C:\ProgramData\MVi\MARS Client\marsclient.conf"
$ComputerList = (Get-content -Path "C:\comps.txt")

<#
Kill all  Client Processes so config is not in use.
Move Config File to each Computer.
#>

Foreach ($Computer in $ComputerList)
{
    Get-Process -Name "<processname>" | Stop-Process -Force
    Copy-Item -Path $MarsCorrectConfig -Destination $ClientConfigPath -Force
}
