#--------------------------------------------------
# Solicited Remote Assistance must not be allowed.
#--------------------------------------------------

function F-45811r1_fix
{
    Write-Output '----------------------------------------------------------------------'
    Write-Output 'F-45811r1_fix'
    Write-Output '----------------------------------------------------------------------'

    $registryPath = '\Software\Policies\Microsoft\Windows NT\Terminal Services\'
    If (-NOT (Test-Path $registryPath)) {
        New-Item $registryPath -Force | Out-Null
    }
    
    New-ItemProperty -path $registryPath -name fAllowToGetHelp -value 0 -PropertyType 'DWord' -Force

    Write-Output '-----------------------------------------------------------------------'
    Write-Output 'F-45811r1_fix'
    Write-Output '-----------------------------------------------------------------------'
}

F-45811r1_fix