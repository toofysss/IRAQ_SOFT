# Specify the path to the folder you want to exclude
$FolderPath = "C:\Sip"

# Add exclusion folder to Windows Defender
Add-MpPreference -ExclusionPath $FolderPath

# Verify if the folder was added to exclusions
Get-MpPreference | Select-Object -ExpandProperty ExclusionPath
