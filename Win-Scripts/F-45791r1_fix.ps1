#--------------------------------------------------
# The LanMan authentication level must be set to send NTLMv2 response only, and to refuse LM and NTLM.
#--------------------------------------------------

function F-45791r1_fix
{
    Write-Output '----------------------------------------------------------------------'
    Write-Output 'F-45791r1_fix'
    Write-Output '----------------------------------------------------------------------'

    $registryPath = '\System\CurrentControlSet\Control\Lsa\'
    If (-NOT (Test-Path $registryPath)) {
        New-Item $registryPath -Force | Out-Null
    }
    
    New-ItemProperty -path $registryPath -name LmCompatibilityLevel -value 5 -PropertyType 'DWord' -Force

    Write-Output '-----------------------------------------------------------------------'
    Write-Output 'F-45791r1_fix'
    Write-Output '-----------------------------------------------------------------------'
}

F-45791r1_fix