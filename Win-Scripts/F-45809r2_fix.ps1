#--------------------------------------------------
# Unauthorized remotely accessible registry paths must not be configured.
#--------------------------------------------------

function F-45809r2_fix
{
    Write-Output '----------------------------------------------------------------------'
    Write-Output 'F-45809r2_fix'
    Write-Output '----------------------------------------------------------------------'

    $registryPath = '\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths\'
    If (-NOT (Test-Path $registryPath)) {
        New-Item $registryPath -Force | Out-Null
    }
    
    New-ItemProperty -path $registryPath -name Machine -value '(System\CurrentControlSet\Control\ProductOptions','System\CurrentControlSet\Control\Server Applications','Software\Microsoft\Windows NT\CurrentVersion)' -PropertyType 'MultiString' -Force

    Write-Output '-----------------------------------------------------------------------'
    Write-Output 'F-45809r2_fix'
    Write-Output '-----------------------------------------------------------------------'
}

F-45809r2_fix