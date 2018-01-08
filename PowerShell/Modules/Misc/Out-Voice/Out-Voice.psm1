<#
.SYNOPSIS
Text to speech through .net & powershell. 
.EXAMPLE
"Testing" | Out-Voice
.EXAMPLE
Out-Voice -Say "Testing"
.Notes
https://gallery.technet.microsoft.com/scriptcenter/Out-Voice-1be16d5e
#>

function Out-Voice
{
    param([Parameter(ValueFromPipeline=$true)][string] $say )

    process
    {
        $voice = New-Object -ComObject SAPI.SPVoice
        $voice.Rate = -1
        $voice.Speak($say) | out-null
    }
}
