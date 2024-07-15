@echo off
setlocal

REM Variables
set "server=."

REM SQL query to get instance name
set "query=SELECT CONVERT(nvarchar(128), SERVERPROPERTY('InstanceName')) AS InstanceName"

REM Use sqlcmd to execute the query and capture the output
for /f "skip=1 delims=" %%I in ('sqlcmd -S %server% -Q "%query%"') do (
    set "instanceName=%%I"
    goto :done
)

:done
REM Output the instance name
echo Instance Name: %instanceName%

endlocal
