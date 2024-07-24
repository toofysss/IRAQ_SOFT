@echo off
setlocal

REM Replace with your actual SQL Server instance, SA username, and password
set "SqlServerInstance=MUSTAFA\SALES_DEV"
set "SqlUsername=sa"
set "SqlPassword=12345"
set "DatabaseName="

REM Connect to SQL Server and set SA as database owner
sqlcmd -S %SqlServerInstance% -U %SqlUsername% -P %SqlPassword% -d master -Q "USE %DatabaseName%; EXEC sp_changedbowner 'sa';"

if %errorlevel% neq 0 (
    echo Failed to set SA as database owner.
    pause
    exit /b 1
)

echo SA successfully set as owner of %DatabaseName%.
pause
