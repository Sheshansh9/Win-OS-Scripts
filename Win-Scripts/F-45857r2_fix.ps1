#--------------------------------------------------
# Unauthorized remotely accessible registry paths and sub-paths must not be configured.
#--------------------------------------------------

function F-45857r2_fix
{
    Write-Output '----------------------------------------------------------------------'
    Write-Output 'F-45857r2_fix'
    Write-Output '----------------------------------------------------------------------'

    $registryPath = '\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths\'
    If (-NOT (Test-Path $registryPath)) {
        New-Item $registryPath -Force | Out-Null
    }
    
    New-ItemProperty -path $registryPath -name Machine -value ('Software\Microsoft\OLAP Server','Software\Microsoft\Windows NT\CurrentVersion\Perflib','Software\Microsoft\Windows NT\CurrentVersion\Print','Software\Microsoft\Windows NT\CurrentVersion\Windows','System\CurrentControlSet\Control\ContentIndex','System\CurrentControlSet\Control\Print\Printers','System\CurrentControlSet\Control\Terminal Server','System\CurrentControlSet\Control\Terminal Server\UserConfig','System\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration','System\CurrentControlSet\Services\Eventlog','System\CurrentControlSet\Services\Sysmonlog') -PropertyType 'MultiString' -Force

    Write-Output '-----------------------------------------------------------------------'
    Write-Output 'F-45857r2_fix'
    Write-Output '-----------------------------------------------------------------------'
}

F-45857r2_fix