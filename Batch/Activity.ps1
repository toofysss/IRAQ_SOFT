param (
    [Parameter(Mandatory=$true)]
    [string]$index,

    [Parameter(Mandatory=$false)]
    [string]$wifiInterfaceName,

    [Parameter(Mandatory=$false)]
    [string]$ExclutionFile
)
if ($index -eq "1") {
    $Profiles = "Public"
    Set-NetFirewallProfile -Profile Public -DisabledInterfaceAliases $wifiInterfaceName
}

if ($index -eq "2") {
    Add-MpPreference -ExclusionPath $ExclutionFile
}
