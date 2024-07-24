@echo off
set /p username="Enter username: "
set password=1
net user %username% %password% /add
wmic useraccount where "Name='%username%'" set FullName="%username%"
wmic useraccount where "Name='%username%'" set PasswordChangeable=false
wmic useraccount where "Name='%username%'" set PasswordExpires=false
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

netsh advfirewall firewall set rule group="Remote Desktop" new enable=Yes
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
net localgroup "Remote Desktop Users" %username% /add

pause
