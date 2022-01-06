#--------------------------------------------------
# Named pipes that can be accessed anonymously must be configured to contain no values on member servers.
#--------------------------------------------------

function F-44296r2_fix
{
    Write-Output '----------------------------------------------------------------------'
    Write-Output 'F-44296r2_fix'
    Write-Output '----------------------------------------------------------------------'

    $registryPath = '\System\CurrentControlSet\Services\LanManServer\Parameters\'
    If (-NOT (Test-Path $registryPath)) {
        New-Item $registryPath -Force | Out-Null
    }
    
    New-ItemProperty -path $registryPath -name NullSessionPipes -value '(blank)' -PropertyType 'MultiString' -Force

    Write-Output '-----------------------------------------------------------------------'
    Write-Output 'F-44296r2_fix'
    Write-Output '-----------------------------------------------------------------------'
}

F-44296r2_fix