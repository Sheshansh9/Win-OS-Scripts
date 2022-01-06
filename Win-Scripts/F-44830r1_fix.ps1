#--------------------------------------------------
# The Windows Remote Management (WinRM) service must not use Basic authentication.
#--------------------------------------------------

function F-44830r1_fix
{
    Write-Output '----------------------------------------------------------------------'
    Write-Output 'F-44830r1_fix'
    Write-Output '----------------------------------------------------------------------'

    $registryPath = 'HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service\'
    If (-NOT (Test-Path $registryPath)) {
        New-Item $registryPath -Force | Out-Null
    }
    
    New-ItemProperty -path $registryPath -name AllowBasic -value 0 -PropertyType 'DWord' -Force

    Write-Output '-----------------------------------------------------------------------'
    Write-Output 'F-44830r1_fix'
    Write-Output '-----------------------------------------------------------------------'
}

F-44830r1_fix
