#--------------------------------------------------
# Autoplay must be disabled for all drives.
#--------------------------------------------------

function F-45805r1_fix
{
    Write-Output '----------------------------------------------------------------------'
    Write-Output 'F-45805r1_fix'
    Write-Output '----------------------------------------------------------------------'

    $registryPath = '\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\'
    If (-NOT (Test-Path $registryPath)) {
        New-Item $registryPath -Force | Out-Null
    }
    
    New-ItemProperty -path $registryPath -name NoDriveTypeAutoRun -value 0x000000ff -PropertyType 'DWord' -Force

    Write-Output '-----------------------------------------------------------------------'
    Write-Output 'F-45805r1_fix'
    Write-Output '-----------------------------------------------------------------------'
}

F-45805r1_fix