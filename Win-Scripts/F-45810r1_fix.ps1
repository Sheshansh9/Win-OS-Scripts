#--------------------------------------------------
# Network shares that can be accessed anonymously must not be allowed.
#--------------------------------------------------

function F-45810r1_fix
{
    Write-Output '----------------------------------------------------------------------'
    Write-Output 'F-45810r1_fix'
    Write-Output '----------------------------------------------------------------------'

    $registryPath = '\System\CurrentControlSet\Services\LanManServer\Parameters\'
    If (-NOT (Test-Path $registryPath)) {
        New-Item $registryPath -Force | Out-Null
    }
    
    New-ItemProperty -path $registryPath -name NullSessionShares -value '(Blank)' -PropertyType 'MultiString' -Force

    Write-Output '-----------------------------------------------------------------------'
    Write-Output 'F-45810r1_fix'
    Write-Output '-----------------------------------------------------------------------'
}

F-45810r1_fix