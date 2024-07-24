$FolderPath = "C:\Sip"
Add-MpPreference -ExclusionPath $FolderPath
Get-MpPreference | Select-Object -ExpandProperty ExclusionPath
