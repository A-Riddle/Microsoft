<#
.SYNOPSIS
Plays random Cat facts. Can be used 1 time or on a random loop.
.EXAMPLE
Play-CatFacts
.EXAMPLE
Loop-CatFacts
.Notes 
Credit goes to https://github.com/gavindeanit/Cat-Fact-Powershell
#>

function Play-CatFacts 
{
    # Magically get and play Cat Facts
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

function Loop-CatFacts
{
    while ($true)
    {
        # While Loop that gets a random time between 1-60 minutes, sleeps for that time, and plays CatFacst after the time is passed. #
        $RandomTime = Get-Random -Minimum 60 -Maximum 3600
        Start-Sleep -Seconds $RandomTime
        Play-CatFacts
    }
}
