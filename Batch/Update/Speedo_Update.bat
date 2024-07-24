@echo off 

@REM For Exe
set "Old_Exe=RESTAURANT_APP.exe"
set "Speedo_Loc=C:\Program Files (x86)\IraqSoft\SPEEDOO"

@REM For WinRar
set "WinRAR_Path=C:\Program Files\WinRAR\WinRAR.exe"
set "Folder_To_Compress=C:\Program Files (x86)\IraqSoft\SPEEDOO\MySettingRESTAURANT\REPORT"
set "Archive_Loc=C:\Program Files (x86)\IraqSoft\SPEEDOO\MySettingRESTAURANT\REPORT.rar"

@REM For Reprot
set "old_Report=REPORT"
set "New_Folder=C:\Program Files (x86)\IraqSoft\SPEEDOO\MySettingRESTAURANT\REPORT"
set "SCRIPT_PATH=%~dp0"
set File_Loc="%SCRIPT_PATH%"


@REM For SQL

set SERVER_NAME=.\SALES_DEV
set USERNAME=sa
set PASSWORD=12345
set DATABASE_NAME=RESTAURANT_DB

REM Define the path to your SQL scripts
set SCRIPT_DIR=%~dp0
set SCRIPT_NAME_TTTT=REST TTTT 49 script.sql
set SCRIPT_NAME_VVV=REST  VVV PPP 49 script.sql
set SCRIPT_NAME_CHECK_EXIST_COLUMNS=CHECK_EXIST_COLUMNS.sql


:main
title Speedo Update 4.5
@REM  Main
cls
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