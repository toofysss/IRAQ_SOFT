@set masver=2.6
@setlocal DisableDelayedExpansion
@echo off
 
cls
color 07
title IRAQ SOFT
mode 76, 30

:menu
cls 
echo:       ______________________________________________________________
echo:
echo:                 Activation Methods:
echo:
echo:             [1] HWID        ^|  Windows           ^|   Permanent
echo:             [2] Ohook       ^|  Office            ^|   Permanent
echo:             [3] KMS38       ^|  Windows           ^|   Year 2038
echo:             [4] Online KMS  ^|  Windows / Office  ^|    180 Days
echo:             __________________________________________________      
echo:
echo:             [5] Activation Status
echo:             [6] Troubleshoot
echo:             [7] Extras
echo:             [8] Help
echo:             [0] Exit
echo:       ______________________________________________________________
echo:
set /p option=Enter a menu option [1,2,3,4,5,6,7,8,0]:
if "%option%"=="1" goto HWID
if "%option%"=="2" goto Ohook
if "%option%"=="3" goto KMS38
if "%option%"=="4" goto OnlineKMS
if "%option%"=="5" goto ActivationStatus
if "%option%"=="6" goto Troubleshoot
if "%option%"=="7" goto Extras
if "%option%"=="8" goto Help
if "%option%"=="0" goto Exit
echo Invalid option, please try again.
pause
goto menu

:HWID
echo HWID Activation selected.
:: Insert your HWID activation commands here
pause
goto menu

:Ohook
echo Ohook Activation selected.
:: Insert your Ohook activation commands here
pause
goto menu

:KMS38
echo KMS38 Activation selected.
:: Insert your KMS38 activation commands here
pause
goto menu

:OnlineKMS
echo Online KMS Activation selected.
:: Insert your Online KMS activation commands here
pause
goto menu

:ActivationStatus
echo Activation Status selected.
:: Insert your Activation Status commands here
pause
goto menu

:Troubleshoot
echo Troubleshoot selected.
:: Insert your Troubleshoot commands here
pause
goto menu

:Extras
echo Extras selected.
:: Insert your Extras commands here
pause
goto menu

:Help
echo Help selected.
:: Insert your Help commands here
pause
goto menu

:Exit
echo Exiting the program.
pause
exit /b
