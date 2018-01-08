<#
.SYNOPSIS Loops and plays cat facts at random time between 1 minute & 1 hour.
.NOTES Author  :
.Notes Date    : 12/1/2017
.Notes Version : 1.0
#>

function Play-Catfacts
{
    while ($true)
    {
        #Get Random Sleep Time
        $random = Get-Random -Minimum 60 -Maximum 3600
        Start-Sleep -Seconds $random
        #Start Cat Facts
        $AllProtocols = [System.Net.SecurityProtocolType]'Ssl3,Tls,Tls11,Tls12'
        [System.Net.ServicePointManager]::SecurityProtocol = $AllProtocols
        $webReply = Invoke-WebRequest -Uri "https://catfact.ninja/fact" -UseBasicParsing
        $catJson = $webReply.Content
        $catObject = ConvertFrom-Json $catJson
        #$wshell = New-Object -ComObject Wscript.Shell
        Add-Type -AssemblyName System.speech
        $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
        $speak.Speak($catObject.fact)
        #$wshell.Popup($catObject.fact,0,"Cats",0x1)
    }
}
