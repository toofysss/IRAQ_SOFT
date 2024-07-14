$wifiInterfaceName = "Wi-Fi" 
Set-NetFirewallProfile -Profile Private -DisabledInterfaceAliases $wifiInterfaceName
Get-NetFirewallProfile | Where-Object {$_.InterfaceAlias -eq $wifiInterfaceName -and $_.Profile -eq 'Private'} | Format-Table -AutoSize
