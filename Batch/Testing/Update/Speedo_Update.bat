@echo off 

@REM For Exe
set "Old_Exe=RESTAURANT_APP.exe"
set "Speedo_Loc=C:\Program Files (x86)\IraqSoft\SPEEDOO"

@REM For WinRar
set "WinRAR_Path=C:\Program Files\WinRAR\WinRAR.exe"
set "Folder_To_Compress=%Speedo_Loc%\MySettingRESTAURANT\REPORT"
set "Archive_Loc=%Speedo_Loc%\MySettingRESTAURANT\REPORT.rar"

@REM For Reprot
set "old_Report=REPORT"
set "New_Folder=%Speedo_Loc%\MySettingRESTAURANT\REPORT"
set "SCRIPT_PATH=%~dp0"
set File_Loc="%SCRIPT_PATH%"

@REM For Newtonsoft
set "Newtonsoft=Newtonsoft.Json.dll"


@REM For Date
for /f "tokens=2 delims==" %%i in ('"wmic os get localdatetime /value"') do set dt=%%i
set yyyy=%dt:~0,4%
set mm=%dt:~4,2%
set dd=%dt:~6,2%
set date=%yyyy%-%mm%-%dd%
@REM For SQL

set SERVER_NAME=.\SALES_DEV
set USERNAME=sa
set PASSWORD=12345
set DATABASE_NAME=RESTAURANT_DB
set Backup_Loc="C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SALES_DEV\MSSQL\Backup\Speedo-Rest-%date%.bak"

REM Define the path to your SQL scripts
set SCRIPT_DIR=%~dp0
set SCRIPT_NAME_TTTT=REST TTTT 49 script.sql
set SCRIPT_NAME_VVV=REST  VVV PPP 49 script.sql
set SCRIPT_NAME_CHECK_EXIST_COLUMNS=CHECK_EXIST_COLUMNS.sql


:main
title Speedo Update
@REM  Main
cls
echo Enter 1 If Programing in C
echo Enter 2 If Programing in Another Partichine
set /p Selected=What Do You Want: 

if "%Selected%" == "1" (
    goto Update
)
if "%Selected%" == "2" (
    set /p  Speedo_Loc=Enter Location : 
    goto Update
)

goto End



:Update
setlocal enabledelayedexpansion

@REM Copy Exe
set "old_exe_file=%File_Loc%%Old_Exe%"
set "new_exe_file=%Speedo_Loc%\%Old_Exe%"
xcopy /Y "%old_exe_file%" "%new_exe_file%"


@REM Compreser Report
"%WinRAR_Path%" a -r "%Archive_Loc%" "%Folder_To_Compress%"
echo Compression complete.

@REM @REM Copy Report To Folder
set "Old_Report_Folder=%File_Loc%%old_Report%"
xcopy "%Old_Report_Folder%" "%New_Folder%" /E /I /H /Y

@REM @REM Copy Netwonsoft To Folder
set "Old_Newtonsoft=%File_Loc%%Newtonsoft%"
xcopy "%Old_Newtonsoft%" "%Speedo_Loc%" /E /I /H /Y

@REM Create Backup 
sqlcmd -S %SERVER_NAME% -U %USERNAME% -P %PASSWORD% -d %DATABASE_NAME% -Q "BACKUP DATABASE %DATABASE_NAME% TO DISK="%Backup_Loc%" with format"

@REM @REM  Extract Report Folder
"%WinRAR_Path%" e -o+ "%Archive_Loc%" "%Folder_To_Compress%"

@REM SQL
sqlcmd -S %SERVER_NAME% -U %USERNAME% -P %PASSWORD% -d %DATABASE_NAME% -i "%SCRIPT_DIR%%SCRIPT_NAME_TTTT%"
if ERRORLEVEL 1 goto ErrorHandler

sqlcmd -S %SERVER_NAME% -U %USERNAME% -P %PASSWORD% -d %DATABASE_NAME% -i "%SCRIPT_DIR%%SCRIPT_NAME_VVV%"
if ERRORLEVEL 1 goto ErrorHandler

echo Update Completed


pause
exit

:ErrorHandler
echo Error detected. Running error handling script...
sqlcmd -S %SERVER_NAME% -U %USERNAME% -P %PASSWORD% -d %DATABASE_NAME% -i "%SCRIPT_DIR%%SCRIPT_NAME_CHECK_EXIST_COLUMNS%"
sqlcmd -S %SERVER_NAME% -U %USERNAME% -P %PASSWORD% -d %DATABASE_NAME% -i "%SCRIPT_DIR%%SCRIPT_NAME_TTTT%"
sqlcmd -S %SERVER_NAME% -U %USERNAME% -P %PASSWORD% -d %DATABASE_NAME% -i "%SCRIPT_DIR%%SCRIPT_NAME_VVV%"

REM Check if the error handling scripts executed successfully
if ERRORLEVEL 1 (
    echo Error handling failed. Exiting...
    exit /b 1
)

echo Scripts re-executed successfully after error handling.
pause
exit /b 0


goto Update

:End
exit