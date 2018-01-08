###Runs a command on an AD OU###

Import-Module ActiveDirectory

# OU Name
$OU = "OU=SETOFCOMPUTERS,OU=COMPUTEROU,DC=DOMAINNAME,DC=COM"

#Script to run on each computer
$Script = "Command to run"

# Window Title
$Host.UI.RawUI.WindowTitle = "Processing Computers in OU " + $OU

# Connectivity Timeout
$timeoutSeconds = 20
The window title of the PowerShell windows will display "Processing Computers in OU OU=SETOFCOMPUTERS,OU=COMPUTEROU,DC=DOMAINNAME,DC=COM" while the Connectivity Timeout variable is used later to complete inital connectivity of the computer before completing the script.

# Computer name list
$ComputerNames = Get-ADComputer -Filter * -SearchBase $OU | Select Name

# ForEach loop to complete command on each Computer
FOREACH ($Computer in $ComputerNames)
{
    if (Test-Connection -ComputerName $($Computer).Name -Count 1 -TimeToLive $timeoutSeconds -ErrorAction 0)
    {

        Write-Host $Computer.Name -ForegroundColor Green
        Invoke-command -COMPUTER $Computer.Name -ScriptBlock {'$Script'}

    }
    else
    {
        Write-Host "Computer NOT FOUND $Computer.Name" -Foreground Red
    }

}