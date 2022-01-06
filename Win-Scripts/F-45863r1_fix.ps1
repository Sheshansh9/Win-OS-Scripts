#--------------------------------------------------
# Anonymous access to Named Pipes and Shares must be restricted.
#--------------------------------------------------

function F-45863r1_fix
{
    Write-Output '----------------------------------------------------------------------'
    Write-Output 'F-45863r1_fix'
    Write-Output '----------------------------------------------------------------------'

    $registryPath = '\System\CurrentControlSet\Services\LanManServer\Parameters\'
    If (-NOT (Test-Path $registryPath)) {
        New-Item $registryPath -Force | Out-Null
    }
    
    New-ItemProperty -path $registryPath -name RestrictNullSessAccess -value 1 -PropertyType 'DWord' -Force

    Write-Output '-----------------------------------------------------------------------'
    Write-Output 'F-45863r1_fix'
    Write-Output '-----------------------------------------------------------------------'
}

F-45863r1_fix