@echo off
setlocal enabledelayedexpansion

set "Spedo_Update_Url=https://www.dropbox.com/scl/fi/0klhe2ohwb9cdbbwosz9i/Update.rar?rlkey=wzgubnart2aitkll5bhs49bpb&st=8tb82k5r&dl=0"
set "Spedo_Update_File=Update.rar"
set "WinRAR_Path=C:\Program Files\WinRAR\WinRAR.exe"

set "SCRIPT_PATH=%~dp0"
set "File_Loc=%SCRIPT_PATH%"
cls
title Speedo Rest Update

:download
curl -L --progress-bar --retry 5 --retry-delay 10 -C - -o "%Spedo_Update_File%" "%Spedo_Update_Url%"
if %errorlevel% neq 0 (
    echo Download interrupted. Retrying...
    timeout /t 10
    goto download
)

echo Download Complete. Waiting To Opening The File...

echo %File_Loc%
echo "%File_Loc%%Spedo_Update_File%"
"%WinRAR_Path%" e -o+ "%File_Loc%%Spedo_Update_File%" "%File_Loc%\Update_Speedo"

pause
