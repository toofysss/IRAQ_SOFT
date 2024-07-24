@echo off 

set "Speedo_Loc=C:\Program Files (x86)\IraqSoft\SPEEDOO"
set "SCRIPT_PATH=%~dp0"
set "SCRIPT_NAME=%~nx0"
set File_Loc="%SCRIPT_PATH%%SCRIPT_NAME%"
:main
title Speedo Update 4.5
@REM  Main
cls

echo 1 If You Want To Update Speedo Rest In C
echo 2 If You Want To Update Speedo Rest In Custom Particene
set /p Selected=What Do You Want: 

if "%Selected%" == "1" (
    set "Loc=%Speedo_Loc%"
    goto Update
)
if "%Selected%" == "2" (
    set /p Loc=Enter Location: 
    goto Update
)

goto End

:End
exit

:Update
set "old_filename=RESTAURANT_APP.exe"

rem Construct the file paths with the selected location
set old_filepath=%File_Loc%\%old_filename%
set "new_filepath=%Loc%\%old_filename%"

echo Copying from: %old_filepath%
echo Copying to: %new_filepath%

rem Copy the file to the new location and replace if it exists
copy /Y "%old_filepath%" "%new_filepath%"

pause
goto End
