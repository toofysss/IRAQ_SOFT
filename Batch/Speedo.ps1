$MaskedInput = Read-Host "Enter Confirm Password" -AsSecureString
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($MaskedInput)
$Password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
Write-Output $Password
