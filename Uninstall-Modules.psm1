function Uninstall-Modules {
    Param
    (
        [Parameter(Mandatory = $true, Position = 0)]
        [string] $Glob,
        [switch] $Force
    )
    $Modules = (Get-Module -ListAvailable $Glob).Name | Get-Unique
    if ($Modules.length -gt 1) {
        if ($Force) {
            Foreach ($Module in $Modules) {
                Uninstall-Module $Module -Force
            }
        }
        else {
            Write-Output ("Uninstalling the following modules:`n$Modules`n")
            $Confirmation = Read-Host "Proceed? [Y] Yes [N] No (default is `"N`")"

            Switch ($confirmation) {
                Y {
                    Foreach ($Module in $Modules) {
                        Write-Output ("Uninstalling: $Module")
                        Uninstall-Module $Module
                    }
                }
                N { }
            }
        } 
    }
}
