# https://www.reddit.com/r/PowerShell/comments/7fv8z2/whats_the_laziest_problem_you_have_ever_solved/ #

function CommonApp{
    param(
        [parameter(Mandatory=$true,
        HelpMessage='Specify which application to launch - type "list" for list of options')]
        [ValidateSet('dsac','sccm','mmc','report','ssms','clicen','powerbi','list')]
        [string]$application,
        [switch]$OtherDomain
    )

    if($OtherDomain){
        $un = 'OTHERDOMAIN\username'
        $pwdtxt = Get-Content "C:\scripts\othersudo.txt"
        $securepwd = $pwdtxt | ConvertTo-SecureString
        $credobject = New-Object System.Management.Automation.PSCredential -argumentlist $un,$securepwd
    }
    else{
        $un = 'MAINDOMAIN\username'
        $pwdtxt = Get-Content "C:\scripts\mainsudo.txt"
        $securepwd = $pwdtxt | ConvertTo-SecureString
        $credobject = New-Object System.Management.Automation.PSCredential -argumentlist $un,$securepwd
    }

    switch($application){
        'dsac'{
            Start-Process -FilePath ($env:windir + '\system32\dsac.exe') -Credential $credobject
        }
        'sccm'{
            Start-Process -FilePath (${env:ProgramFiles(x86)}+'\Microsoft Configuration Manager\AdminConsole\bin\Microsoft.ConfigurationManagement.exe') -Credential $credobject
        }
        'mmc'{
            Start-Process -FilePath ($env:windir + '\system32\mmc.exe') -Credential $credobject
        }
        'report'{
            Start-Process -FilePath (${env:ProgramFiles(x86)}+'\Microsoft SQL Server\Report Builder 3.0\MSReportBuilder.exe') -Credential $credobject
        }
        'ssms'{
            Start-Process -FilePath (${env:ProgramFiles(x86)}+'\Microsoft SQL Server\140\Tools\Binn\ManagementStudio\Ssms.exe') -Credential $credobject
        }
        'clicen'{
            Start-Process -FilePath (${env:ProgramFiles}+'\Zander Tools\Client Center for Configuration Manager\SCCMCliCtrWPF.exe') -Credential $credobject
        }
        'powerbi'{
            Start-Process -FilePath (${env:ProgramFiles}+'\Microsoft Power BI Desktop\bin\PBIDesktop.exe') -Credential $credobject
        }
    }
}
