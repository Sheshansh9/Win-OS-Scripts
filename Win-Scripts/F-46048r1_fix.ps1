#--------------------------------------------------
# Anonymous enumeration of SAM accounts must not be allowed.
#--------------------------------------------------

function F-46048r1_fix
{
    Write-Output '----------------------------------------------------------------------'
    Write-Output 'F-46048r1_fix'
    Write-Output '----------------------------------------------------------------------'

    $registryPath = '\System\CurrentControlSet\Control\Lsa\'
    If (-NOT (Test-Path $registryPath)) {
        New-Item $registryPath -Force | Out-Null
    }
    
    New-ItemProperty -path $registryPath -name RestrictAnonymousSAM -value 1 -PropertyType 'DWord' -Force

    Write-Output '-----------------------------------------------------------------------'
    Write-Output 'F-46048r1_fix'
    Write-Output '-----------------------------------------------------------------------'
}

F-46048r1_fix