#--------------------------------------------------
# The Windows Installer Always install with elevated privileges option must be disabled.
#--------------------------------------------------

function F-45880r1_fix
{
    Write-Output '----------------------------------------------------------------------'
    Write-Output 'F-45880r1_fix'
    Write-Output '----------------------------------------------------------------------'

    $registryPath = '\Software\Policies\Microsoft\Windows\Installer\'
    If (-NOT (Test-Path $registryPath)) {
        New-Item $registryPath -Force | Out-Null
    }
    
    New-ItemProperty -path $registryPath -name AlwaysInstallElevated -value 0 -PropertyType 'DWord' -Force

    Write-Output '-----------------------------------------------------------------------'
    Write-Output 'F-45880r1_fix'
    Write-Output '-----------------------------------------------------------------------'
}

F-45880r1_fix