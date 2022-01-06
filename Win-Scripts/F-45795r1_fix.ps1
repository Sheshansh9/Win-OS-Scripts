#--------------------------------------------------
# The Recovery Console option must be set to prevent automatic logon to the system.
#--------------------------------------------------

function F-45795r1_fix
{
    Write-Output '----------------------------------------------------------------------'
    Write-Output 'F-45795r1_fix'
    Write-Output '----------------------------------------------------------------------'

    $registryPath = '\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\'
    If (-NOT (Test-Path $registryPath)) {
        New-Item $registryPath -Force | Out-Null
    }
    
    New-ItemProperty -path $registryPath -name SecurityLevel -value 0 -PropertyType 'DWord' -Force

    Write-Output '-----------------------------------------------------------------------'
    Write-Output 'F-45795r1_fix'
    Write-Output '-----------------------------------------------------------------------'
}

F-45795r1_fix