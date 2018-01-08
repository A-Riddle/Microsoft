# Stops Software Senter Service & aborts shutdown. #
Stop-Service CcmExec
shutdown /a
Write-Host "Shutdown has been halted. Please start CcmExec Service when possible."