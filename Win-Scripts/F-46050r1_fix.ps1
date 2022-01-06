#--------------------------------------------------
# The default autorun behavior must be configured to prevent autorun commands.
#--------------------------------------------------

function F-46050r1_fix
{
    Write-Output '----------------------------------------------------------------------'
    Write-Output 'F-46050r1_fix'
    Write-Output '----------------------------------------------------------------------'

    $registryPath = '\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\'
    If (-NOT (Test-Path $registryPath)) {
        New-Item $registryPath -Force | Out-Null
    }
    
    New-ItemProperty -path $registryPath -name NoAutorun -value 1 -PropertyType 'DWord' -Force

    Write-Output '-----------------------------------------------------------------------'
    Write-Output 'F-46050r1_fix'
    Write-Output '-----------------------------------------------------------------------'
}

F-46050r1_fix