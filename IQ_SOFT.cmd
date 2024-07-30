@set masver=2.6
@setlocal DisableDelayedExpansion
@echo off

mode 76,30
cls
color 07
title ASCII Art Example

:menu
cls
echo:
echo:  ______________________________________________________________
echo:
echo:                 Menu Options:
echo:
echo:             [1] Option 1
echo:             [2] Option 2
echo:             [3] Option 3
echo:             [0] Exit
echo:       ______________________________________________________________
echo:
set /p option=Enter a menu option [1,2,3,0]:
if "%option%"=="1" goto Option1
if "%option%"=="2" goto Option2
if "%option%"=="3" goto Option3
if "%option%"=="0" goto Exit
echo Invalid option, please try again.
pause
goto menu

:Option1
echo Option 1 selected.
pause
goto menu

:Option2
echo Option 2 selected.
pause
goto menu

:Option3
echo Option 3 selected.
pause
goto menu

:Exit
echo Exiting the program.
pause
exit /b
