<#
Author  :
Date    : 10/18/2017
Purpose : Sign Powershell Scripts with a Code Signing Cert from our internal CA.
#>

# Variables #
$ScriptPath = "C:\Scripts\Test.ps1"
$PSCodeCert = (Get-ChildItem Cert:\CurrentUser\My -CodeSigningCert)[0]

# Sign Script #
Set-AuthenticodeSignature -Certificate $PSCodeCert $ScriptPath

# Check Script Status #
# Get-AuthenticodeSignature $ScriptPath | ft -AutoSize #