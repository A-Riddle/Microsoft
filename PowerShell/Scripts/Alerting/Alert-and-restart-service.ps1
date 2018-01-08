<#
Author  : <>
Date    : <>
Purpose : Restart and alert on specific services.

This runs on <servername>.
This run in task scheduler, and run on Event ID <number>.

The services are:


This script Path is
#>

# Restarts  Services #
"<service1>", "<service2>" | Restart-Service

# Gets Service Status  #
$ServiceStatus = "<service1>", "<service2>" | Get-Service | select DisplayName, Status | ConvertTo-Html -Head $style

# Email Variables #
$SMTPServer = "<smtp.server.com>"
$To = @("<email1>", "<email2>", "<email3>")
$From = "<from>"
$Subject = "<subject>"
$Body = "Emails are not being sent from <servername>. <what the service does>. <br> The <service1> & <service2> were restarted as part of this script. <br> $ServiceStatus <br> If vendor escalation is needed, please contact Vendor Support: <documentation>. <br> This Script lives on <servername and path>. <br> #Crit#"
$Priority = "High"

# CSS #
$style = "<style>BODY{font-family: Arial; font-size: 10pt;}"
$style = $style + "TABLE{border: 1px solid black; border-collapse: collapse;}"
$style = $style + "TH{border: 1px solid black; background: #dddddd; padding: 5px; }"
$style = $style + "TD{border: 1px solid black; padding: 5px; }"
$style = $style + "</style>"

# Sends Email #
Send-MailMessage -SmtpServer $SMTPServer -To $To -From $From -Subject $Subject -Body $Body -BodyAsHtml -Priority $Priority

# Limits this script to run once an hour #
Start-Sleep -Seconds 3600