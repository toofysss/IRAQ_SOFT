@echo off

set "SCRIPT_PATH=%~dp0"
set FireWallLoc=\Activity.ps1
set Exclution_Remotly_Loc="C:\Program Files\RDP Wrapper"
set Exclution_Sip_Loc="C:\Sip"


@REM Satic IP Info
set SUBNET_MASK=255.255.255.0
set DNS_SERVER=8.8.8.8
set ALTERNATE_DNS=8.8.4.4


@REM Static Ip For Rest
set STATIC_IP_Rest=192.168.11.50
set DEFAULT_GATEWAY_Rest=192.168.11.1


@REM Static Ip For Rest
set STATIC_IP=192.168.1.50
set DEFAULT_GATEWAY=192.168.1.1



@REM  Main
:main
title Activity
cls
color 0F
echo Press 1 If You Want To Active Remotly
echo Press 2 If You Want To Active SIP
echo Press 3 If You Want To Active Connect Computer
echo Press 4 If You Want To Active Captin App
echo Press 5 If You Want To Active Access App
set /p Selected=What Do You Want: 
if "%Selected%" == "1" goto Remotly
if "%Selected%" == "2" goto SIP
if "%Selected%" == "3" goto Connect_Computer
if "%Selected%" == "4" goto Captin
if "%Selected%" == "5" goto Access

goto End


:Remotly
cls 
title Remote Desktop
set index= 1
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_PATH%%FireWallLoc%" -index %index% -wifiInterfaceName "Wi-Fi" -ExclutionFile ""
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_PATH%%FireWallLoc%" -index %index% -wifiInterfaceName "Ethernet"  -ExclutionFile ""

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
CALL :Exclution_Remotly
pause
goto Remotly

:SIP
@REM Virus Disabled
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
sc stop WinDefend > nul 2>&1
sc config WinDefend start= disabled > nul 2>&1
sc stop MpsSvc > nul 2>&1
sc config MpsSvc start= disabled > nul 2>&1
@REM Disable FireWall
set index= 1
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_PATH%%FireWallLoc%" -index %index% -wifiInterfaceName "Wi-Fi" -ExclutionFile ""
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_PATH%%FireWallLoc%" -index %index% -wifiInterfaceName "Ethernet"  -ExclutionFile ""
@REM Exclution Folder
set index=2
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_PATH%%FireWallLoc%" -index "%index%" -wifiInterfaceName "" -ExclutionFile "%Exclution_Sip_Loc%"

pause
exit
goto SIP

:Connect_Computer
title Connect Computer
echo Press 0 If You Want To Back To Menu
echo Press 1 If You Want To Connect Wifi
echo Press 2 If You Want To Connect Ethernet
echo Press 3 If You Want To Connect Rest Wifi
echo Press 4 If You Want To Connect Rest Ethernet
set /p Selected=What Do You Want: 
if "%Selected%" == "0" goto main
if "%Selected%" == "1" goto Connect_Computer_Wifi
if "%Selected%" == "2" goto Connect_Computer_Ethernet
if "%Selected%" == "3" goto Connect_Computer_Rest_Wifi
if "%Selected%" == "4" goto Connect_Computer_Rest_Ethernet
goto Connect_Computer

:Connect_Computer_Rest_Ethernet
@REM Firewall Disable
set index= 1
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_PATH%%FireWallLoc%" -index %index% -wifiInterfaceName "Ethernet"  -ExclutionFile ""
@REM Static IP
set INTERFACE_NAME=Ethernet
netsh interface ipv4 delete address name="%INTERFACE_NAME%" addr=%STATIC_IP_Rest%
netsh interface ipv4 set address name="%INTERFACE_NAME%" static %STATIC_IP_Rest% %SUBNET_MASK%
pause
exit
goto Connect_Computer_Rest_Ethernet


:Connect_Computer_Rest_Wifi
@REM Firewall Disable
set index= 1
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_PATH%%FireWallLoc%" -index %index% -wifiInterfaceName "Wi-Fi" -ExclutionFile ""
@REM Static IP
set INTERFACE_NAME=Wi-Fi
netsh interface ipv4 delete address name="%INTERFACE_NAME%" addr=%STATIC_IP_Rest%
netsh interface ipv4 set address name="%INTERFACE_NAME%" static %STATIC_IP_Rest% %SUBNET_MASK%
pause
exit
goto Connect_Computer_Rest_Wifi


:Connect_Computer_Wifi
@REM Firewall Disable
set index= 1
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_PATH%%FireWallLoc%" -index %index% -wifiInterfaceName "Wi-Fi" -ExclutionFile ""
@REM Static IP
set INTERFACE_NAME=Wi-Fi
netsh interface ipv4 delete address name="%INTERFACE_NAME%" addr=%STATIC_IP%
netsh interface ipv4 set address name="%INTERFACE_NAME%" static %STATIC_IP% %SUBNET_MASK%
pause
exit
goto Connect_Computer_Wifi

:Connect_Computer_Ethernet
@REM Firewall Disable
set index= 1
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_PATH%%FireWallLoc%" -index %index% -wifiInterfaceName "Ethernet"  -ExclutionFile ""
@REM Static IP
set INTERFACE_NAME=Ethernet
netsh interface ipv4 delete address name="%INTERFACE_NAME%" addr=%STATIC_IP%
netsh interface ipv4 set address name="%INTERFACE_NAME%" static %STATIC_IP% %SUBNET_MASK%
pause
exit
goto Connect_Computer_Ethernet


@REM Active Captin
:Captin
cls
title 
color 0A
echo Press 0 If You Want To Back To Menu
echo Press 1 If You Want To Wifi
echo Press 2 If You Want To Ethernet
set /p Selected=What Do You Want: 
if "%Selected%" == "0" goto main
if "%Selected%" == "1" goto Captin_Wifi
if "%Selected%" == "2" goto Captin_Ethernet

goto Captin

:Captin_Ethernet
setlocal enabledelayedexpansion
@REM Firewall Disable
set index= 1
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_PATH%%FireWallLoc%" -index %index% -wifiInterfaceName "Ethernet"  -ExclutionFile ""
@REM Static IP
set INTERFACE_NAME=Ethernet
netsh interface ipv4 delete address name="%INTERFACE_NAME%" addr=%STATIC_IP_Rest%
netsh interface ipv4 set address name="%INTERFACE_NAME%" static %STATIC_IP_Rest% %SUBNET_MASK%
set "sql_commands=USE SPEEDOO_DB; EXEC sp_changedbowner sa; ALTER DATABASE SPEEDOO_DB SET ENABLE_BROKER;"
set "sql_file=%TEMP%\commands.sql"
echo %sql_commands% > "%sql_file%"
echo %sql_commands% | powershell -command "&{Add-Type -AssemblyName 'System.Windows.Forms'; [System.Windows.Forms.Clipboard]::SetText(\"$(Get-Clipboard)\");}"
start ssms.exe "%sql_file%"
pause
exit
goto Captin_Ethernet

:Captin_Wifi
setlocal enabledelayedexpansion
@REM Firewall Disable
set index= 1
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_PATH%%FireWallLoc%" -index %index% -wifiInterfaceName "Wi-Fi" -ExclutionFile ""
@REM Static IP
set INTERFACE_NAME=Wi-Fi
netsh interface ipv4 delete address name="%INTERFACE_NAME%" addr=%STATIC_IP_Rest%
netsh interface ipv4 set address name="%INTERFACE_NAME%" static %STATIC_IP_Rest% %SUBNET_MASK%
set "sql_commands=USE SPEEDOO_DB; EXEC sp_changedbowner sa; ALTER DATABASE SPEEDOO_DB SET ENABLE_BROKER;"
set "sql_file=%TEMP%\commands.sql"
echo %sql_commands% > "%sql_file%"
echo %sql_commands% | powershell -command "&{Add-Type -AssemblyName 'System.Windows.Forms'; [System.Windows.Forms.Clipboard]::SetText(\"$(Get-Clipboard)\");}"
start ssms.exe "%sql_file%"
pause
exit
goto Captin_Wifi


:Access
@REM Firewall Disable
set index= 1
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_PATH%%FireWallLoc%" -index %index% -wifiInterfaceName "Wi-Fi" -ExclutionFile ""
set "sql_commands=USE SPEEDOO_DB; EXEC sp_changedbowner sa; ALTER DATABASE SPEEDOO_DB SET ENABLE_BROKER;"
set "sql_file=%TEMP%\commands.sql"
echo %sql_commands% > "%sql_file%"
echo %sql_commands% | powershell -command "&{Add-Type -AssemblyName 'System.Windows.Forms'; [System.Windows.Forms.Clipboard]::SetText(\"$(Get-Clipboard)\");}"
start ssms.exe "%sql_file%"
pause
exit
goto Access




:Exclution_Remotly
set index=2
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_PATH%%FireWallLoc%" -index "%index%" -wifiInterfaceName "" -ExclutionFile "%Exclution_Remotly_Loc%"
echo Success Exluction


:Exclution_Sip
set index=2
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_PATH%%FireWallLoc%" -index "%index%" -wifiInterfaceName "" -ExclutionFile "%Exclution_Sip_Loc%"
echo Success Exluction

:End