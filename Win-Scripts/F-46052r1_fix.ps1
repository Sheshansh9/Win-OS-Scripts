#--------------------------------------------------
# Autoplay must be turned off for non-volume devices.
#--------------------------------------------------

function F-46052r1_fix
{
    Write-Output '----------------------------------------------------------------------'
    Write-Output 'F-46052r1_fix'
    Write-Output '----------------------------------------------------------------------'

    $registryPath = '\Software\Policies\Microsoft\Windows\Explorer\'
    If (-NOT (Test-Path $registryPath)) {
        New-Item $registryPath -Force | Out-Null
    }
    
    New-ItemProperty -path $registryPath -name NoAutoplayfornonVolume -value 1 -PropertyType 'DWord' -Force

    Write-Output '-----------------------------------------------------------------------'
    Write-Output 'F-46052r1_fix'
    Write-Output '-----------------------------------------------------------------------'
}

F-46052r1_fix