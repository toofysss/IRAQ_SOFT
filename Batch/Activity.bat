@echo off

@REM  Main
:main
title Activity
cls
color 0F
echo Press 1 If You Want To Active Captin App
echo Press 2 If You Want To Active Access App
echo Press 3 If You Want To Active Remotly
echo Press 4 If You Want To Active Connect Computer
set /p Selected=What Do You Want: 
if "%Selected%" == "1" goto Captin
if "%Selected%" == "2" goto Access
if "%Selected%" == "3" goto Remotly
if "%Selected%" == "4" goto Connect_Computer

goto End
@REM Active Captin
:Captin
goto Captin

:End