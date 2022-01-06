#--------------------------------------------------
# Anonymous enumeration of shares must be restricted.
#--------------------------------------------------

function F-45773r1_fix
{
    Write-Output '----------------------------------------------------------------------'
    Write-Output 'F-45773r1_fix'
    Write-Output '----------------------------------------------------------------------'

    $registryPath = '\System\CurrentControlSet\Control\Lsa\'
    If (-NOT (Test-Path $registryPath)) {
        New-Item $registryPath -Force | Out-Null
    }
    
    New-ItemProperty -path $registryPath -name RestrictAnonymous -value 1 -PropertyType 'DWord' -Force

    Write-Output '-----------------------------------------------------------------------'
    Write-Output 'F-45773r1_fix'
    Write-Output '-----------------------------------------------------------------------'
}

F-45773r1_fix