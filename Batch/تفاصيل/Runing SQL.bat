@echo off
set SERVER_NAME=.\SALES_DEV
set USERNAME=sa
set PASSWORD=12345
set DATABASE_NAME=RESTAURANT_DB

REM Define the path to your SQL scripts
set SCRIPT_DIR=%~dp0
set SCRIPT_NAME_TTTT=REST TTTT 49 script.sql
set SCRIPT_NAME_VVV=REST  VVV PPP 49 script.sql
set SCRIPT_NAME_CHECK_EXIST_COLUMNS=CHECK_EXIST_COLUMNS.sql

REM Run the SQL scripts
sqlcmd -S %SERVER_NAME% -U %USERNAME% -P %PASSWORD% -d %DATABASE_NAME% -i "%SCRIPT_DIR%%SCRIPT_NAME_TTTT%"
if ERRORLEVEL 1 goto ErrorHandler

sqlcmd -S %SERVER_NAME% -U %USERNAME% -P %PASSWORD% -d %DATABASE_NAME% -i "%SCRIPT_DIR%%SCRIPT_NAME_VVV%"
if ERRORLEVEL 1 goto ErrorHandler

echo Script executed successfully.
pause
exit /b 0

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
