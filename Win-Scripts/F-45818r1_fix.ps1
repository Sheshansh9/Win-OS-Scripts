#--------------------------------------------------
# The system must be configured to prevent the storage of the LAN Manager hash of passwords.
#--------------------------------------------------

function F-45818r1_fix
{
    Write-Output '----------------------------------------------------------------------'
    Write-Output 'F-45818r1_fix'
    Write-Output '----------------------------------------------------------------------'

    $registryPath = '\System\CurrentControlSet\Control\Lsa\'
    If (-NOT (Test-Path $registryPath)) {
        New-Item $registryPath -Force | Out-Null
    }
    
    New-ItemProperty -path $registryPath -name NoLMHash -value 1 -PropertyType 'DWord' -Force

    Write-Output '-----------------------------------------------------------------------'
    Write-Output 'F-45818r1_fix'
    Write-Output '-----------------------------------------------------------------------'
}

F-45818r1_fix