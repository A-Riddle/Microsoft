<#
Compares 2 different MD5 File Hashes.
#>

#Variables#
$IntendedHash = "2d99f8389da129aa76aad3405656da1490b6"
$FilePath = "C:\Users\user\Downloads\test.ova"

#Getting hash for selected file#
$FileHash = Get-FileHash -Algorithm MD5 -LiteralPath $FilePath | Select-Object -ExpandProperty Hash

<#
Compare both Hash Values.
Output will show equal for success.
If the check fails, the difference will be shown.
#>

Compare-Object $IntendedHash $FileHash -IncludeEqual
