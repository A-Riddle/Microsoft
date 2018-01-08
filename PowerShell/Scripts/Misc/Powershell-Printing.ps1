# Prints and moves pdf files from a directory.
$processed = "C:\Users\user\Desktop\junk\move"
$letters = "C:\Users\user\Desktop\junk\test"
$items = Get-ChildItem -Path "C:\Users\user\Desktop\junk\test" -Filter "*.pdf"
foreach ($item in $items) { Start-Process –FilePath $letters\$item –Verb Print -PassThru | % {sleep 5; $_} | kill }
foreach ($item in $items) { Move-Item -Path $letters\$item $processed }
