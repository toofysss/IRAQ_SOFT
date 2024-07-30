@echo off
setlocal EnableDelayedExpansion
set "isAdmin=false"

REG QUERY "HKU\S-1-5-19" >nul 2>&1
if %errorlevel% == 0 set "isAdmin=true"

if "%isAdmin%" == "false" (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

@set masver=2.6
@setlocal DisableDelayedExpansion
mode 76,30
color 07
title IRAQ SOFT

::::::::::::::::::::::::::::::::: For Download Info :::::::::::::::::::::::::::::::::::::::::::
set "desktopPath=%USERPROFILE%\Downloads"
set Speedo_Full_Url=https://www.dropbox.com/scl/fi/jrrg2xtnw60a7a132zhx3/SPEEDOO-POS-1.3.7.6-FULL.exe?rlkey=25a6t62fis84n2daisvk8mr1p&dl=1
set Speedo_Full_File=SPEEDOO-POS-1.3.7.6-FULL.exe
set Speedo_Update_Url=https://www.dropbox.com/scl/fi/r03a6ujar6lwp09s2r3pm/SPEEDOO-POS-1.3.7.6-UPDATE.exe?rlkey=kae6meq14d5w0e19h9fra9ed3&e=2&dl=0
set Speedo_Update_File=SPEEDOO-POS-1.3.7.6-UPDATE.exe
@REM Speedo Rest Url
set Speedo_Rest_Update_Url=https://www.dropbox.com/s/pkkciumd4u2v0vu/Speedoo%20REST%20%203.0.3.3%20UPDATE.exe?e=1&dl=0
set Speedo_Rest_Update_File=SpeedooREST 3.0.3.3_UPDATE.exe
set Speedo_Rest_Full_Url=https://www.dropbox.com/s/mzb59s2ypjung62/Speedoo%20APP%203.0.3.3%20FULL.exe?dl=0
set Speedo_Rest_Full_File=Speedoo REST 3.0.3.3_FULL.exe
@REM SQL Url
set SQL_Url=https://www.dropbox.com/scl/fi/fitraeunq2m7bx0pff31y/SQLEXPRWT_x86_ENU-2.exe?rlkey=wwj2f0pbd621gnkl0od4naea9&st=85hiov5f&dl=0
set SQL_File=SQLEXPRWT_x86_ENU-2.exe
@REM Aman Url
set Aman_Url=https://www.dropbox.com/scl/fi/mmb09081w93d4o11b6q6o/AMAN_AutoBackup.exe?rlkey=yi81hsbjsmml5zwjjmfvr78cc&st=kcd1p6d8&dl=0
set Aman_File=AMAN_AutoBackup.exe
@REM SUPER POINT Url
set Super_Point_Url=https://www.dropbox.com/scl/fi/rfo30ucu1houbopun4ydw/Point-Super3.0.0.2.exe?rlkey=qpw90pr45jiu9aw16zo3t0kkt&st=rg3uyk1z&dl=0
set Super_Point_File=Point_Super3.0.0.2.exe
@REM Point Charge Url
set Point_Charge_Url=https://www.dropbox.com/scl/fi/a59xynftova49frvqb2x1/Shipping-Plus-Server-With-Out-SQL2.2.0.0.exe?rlkey=ua3xvu6nwgy7c6fqsb5omcchi&e=1&st=ebai37wg&dl=0
set Point_Charge_File=Shipping_Plus_Server_With_Out_SQL2.2.0.0.exe
@REM POS Url
set POS_Url=https://www.dropbox.com/scl/fi/g8jjxnuqicn6mf3c63yly/POS-SERVER.exe?rlkey=7pqhg0u62ct8w7xmjqpx42ooq&e=1&st=3ctgbwml&dl=0
set POS_File=POS_3.9.2_Server.exe

@REM SIP Url
set SIP_Url=https://www.dropbox.com/scl/fi/iocnpblkxb13z8jzf8e2u/Sip.exe?rlkey=rvrixro5fzit16pbvwpyjq6bh&st=iy4vnvog&dl=0
set SIP_File=Sip.exe
@REM Remotly Url
set Remotly_Url=https://www.dropbox.com/scl/fi/hitpdam3cpyf5oq2om5q7/remotly2024.rar?rlkey=jv8ga54xmei2y42thtjqcy6b5&e=1&dl=0
set Remotly_File=remotly-new.rar

::::::::::::::::::::::::::::::::: For Download Info :::::::::::::::::::::::::::::::::::::::::::

:MainMenu
cls
echo: 
echo: 
echo:                                IRAQ SOFT
echo: 
echo:                                Main Menu
echo: 
echo:                   [1] SQL SERVER        [2] Activity            
echo:                   [3] Download          [4] Update            
echo:                   [5] Printers          [6] Troubleshoot            
echo:                   [0] Exit                      
echo:             __________________________________________________      
echo: 

set /p Choice="Enter A Menu Choice : "
if "%Choice%" == "0" exit /b
if "%Choice%" == "1" goto SQL_SERVER
if "%Choice%" == "2" goto Activity
if "%Choice%" == "3" goto Download
if "%Choice%" == "4" goto Troubleshoot
goto MainMenu

::::::::::::::::::::::::::::::::: For SQL SERVER :::::::::::::::::::::::::::::::::::::::::::
:SQL_SERVER
cls
echo: 
echo: 
echo:                                IRAQ SOFT
echo: 
echo:                                SQL SERVER
echo: 
echo:                   [1] SPEEDO       [2] SPEEDO REST                    
echo:                   [0] Back To Back                      
echo:             __________________________________________________      
echo: 

set /p Choice="Enter A Menu Choice : "
if "%Choice%" == "0" goto MainMenu
goto SQL_SERVER



::::::::::::::::::::::::::::::::: For SQL SERVER :::::::::::::::::::::::::::::::::::::::::::



::::::::::::::::::::::::::::::::: For ACTIVITY :::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::: For ACTIVITY :::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::: For DOWNLOAD :::::::::::::::::::::::::::::::::::::::::::
:Download
setlocal

cls
echo: 
echo: 
echo:                                IRAQ SOFT
echo: 
echo:                                Download
echo: 
echo:                   [1] SPEEDO FULL        [2] SPEEDO UPDATE           
echo:                   [3] SPEEDO REST FULL   [4] SPEEDO REST UPDATE  
echo:                   [5] AMAN               [6] SQL 
echo:                   [7] SUPER POINT        [8] POS 
echo:                   [9] SIP                [10] Remotly 
echo:                   [11] Point Charge Url  [0] Back To Back  
echo:             __________________________________________________   

set /p Choice="Enter A Menu Choice : "
if "%Choice%" == "0" goto MainMenu
if "%Choice%" == "1" (
    set url=%Speedo_Full_Url%
    set output=%desktopPath%\%Speedo_Full_File%
    goto Start_Download
)
if "%Choice%" == "2" (
    set url=%Speedo_Update_Url%
    set output=%desktopPath%\%Speedo_Update_File%
    goto Start_Download
)
if "%Choice%" == "3" (
    set url=%Speedo_Rest_Full_Url%
    set output=%desktopPath%\%Speedo_Rest_Full_File%
    goto Start_Download
)
if "%Choice%" == "4" (
    set url=%Speedo_Rest_Update_Url%
    set output=%desktopPath%\%Speedo_Rest_Update_File%
    goto Start_Download
)
if "%Choice%" == "5" (
    set url=%Aman_Url%
    set output=%desktopPath%\%Aman_File%
    goto Start_Download
)
if "%Choice%" == "6" (
    set url=%SQL_Url%
    set output=%desktopPath%\%SQL_File%
    goto Start_Download
)
if "%Choice%" == "7" (
    set url=%Super_Point_Url%
    set output=%desktopPath%\%Super_Point_File%
    goto Start_Download
)
if "%Choice%" == "8" (
    set url=%POS_Url%
    set output=%desktopPath%\%POS_File%
    goto Start_Download
)
if "%Choice%" == "9" (
    set url=%SIP_Url%
    set output=%desktopPath%\%SIP_File%
    goto Start_Download
)
if "%Choice%" == "10" (
    set url=%Remotly_Url%
    set output=%desktopPath%\%Remotly_File%
    goto Start_Download
)
if "%Choice%" == "11" (
    set url=%Point_Charge_Url%
    set output=%desktopPath%\%Point_Charge_File%
    goto Start_Download
)

goto Download

:Start_Download

curl -L --progress-bar --retry 5 --retry-delay 10 -C - -o %output% %url%
if %errorlevel% neq 0 (
    echo Download interrupted. Retrying...
    timeout /t 10
    goto Start_Download
)

echo Download Complete. Waiting To Opening The File...
start "" %output%
pause
goto Download

::::::::::::::::::::::::::::::::: For DOWNLOAD :::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::: For Troubleshoot  :::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::: For Troubleshoot  :::::::::::::::::::::::::::::::::::::::::::
