<#
Displays a popup using the burnt toast module when something get blocked by Carbon Black.
This is scheduled in task scheduler to run when event ID 22 in the Application Event log happens.
Must be run as the surrent logged in user.
#>

$ProtectionButton = New-BTButton -Content 'Open Protection' -Arguments "CarbonBlackServerURL.com"
$BTText = "Carbon Block", "Check Protection or Event Log for more info."

New-BurntToastNotification -Text $BTText -Button $ProtectionButton