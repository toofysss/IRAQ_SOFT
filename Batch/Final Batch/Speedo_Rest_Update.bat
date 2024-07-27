@echo off
setlocal enabledelayedexpansion

set "Spedo_Update_Url=https://www.dropbox.com/scl/fi/u080lc5htxjxnkccbs8d9/Update.rar?rlkey=em7bhyqswi0v6jd9pjpwm6k2n&st=218puj39&dl=0"
set "Spedo_Update_File=Update.rar"
set "WinRAR_Path=C:\Program Files\WinRAR\WinRAR.exe"

set "SCRIPT_PATH=%~dp0"
set "SCRIPT_NAME=%~nx0"

set "File_Loc=%SCRIPT_PATH%"
set "File_Download=%SCRIPT_PATH%%SCRIPT_NAME%"
set "Extract_Folder=%File_Loc%"
set "Update_Bat=Speedo_Update.bat"
set "Admin_VBS=%SCRIPT_PATH%run_as_admin.vbs"

cls
title Speedo Rest Update

:download
curl -L --progress-bar --retry 5 --retry-delay 10 -C - -o "%Spedo_Update_File%" "%Spedo_Update_Url%"
if %errorlevel% neq 0 (
    echo Download interrupted. Retrying...
    timeout /t 10
    goto download
)

"%WinRAR_Path%" x -o+ "%File_Loc%%Spedo_Update_File%" "%Extract_Folder%\"

if %errorlevel% neq 0 (
    echo Extraction failed.
    pause
    exit /b %errorlevel%
)



if %errorlevel% neq 0 (
    echo Failed to delete the archive.
    pause
    exit /b %errorlevel%
)

echo Set UAC = CreateObject^("Shell.Application"^) > "%Admin_VBS%"
echo UAC.ShellExecute "cmd.exe", "/c ""%Extract_Folder%Update\Speedo_Update.bat""", "", "runas", 1 >> "%Admin_VBS%"

cscript //nologo "%Admin_VBS%"

del "%File_Loc%%Spedo_Update_File%"
del "%Admin_VBS%"
del "%File_Download%"
echo Update completed successfully.

pause
