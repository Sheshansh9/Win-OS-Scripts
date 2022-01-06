#--------------------------------------------------
# Local accounts with blank passwords must be restricted to prevent access from the network.
#--------------------------------------------------

function F-45812r1_fix
{
    Write-Output '----------------------------------------------------------------------'
    Write-Output 'F-45812r1_fix'
    Write-Output '----------------------------------------------------------------------'

    $registryPath = '\System\CurrentControlSet\Control\Lsa\'
    If (-NOT (Test-Path $registryPath)) {
        New-Item $registryPath -Force | Out-Null
    }
    
    New-ItemProperty -path $registryPath -name LimitBlankPasswordUse -value 1 -PropertyType 'DWord' -Force

    Write-Output '-----------------------------------------------------------------------'
    Write-Output 'F-45812r1_fix'
    Write-Output '-----------------------------------------------------------------------'
}

F-45812r1_fix