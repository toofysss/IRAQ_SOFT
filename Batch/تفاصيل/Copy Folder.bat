@echo off
set "old_Report=REPORT"

rem Set the path to WinRAR executable, adjust this path if needed
set "WinRAR_Path=C:\Program Files\WinRAR\WinRAR.exe"
set "SCRIPT_PATH=%~dp0"
set "File_Loc=%SCRIPT_PATH%"

rem Set the folder you want to copy
set "Old_Folder=%File_Loc%%old_Report%"

rem Set the destination folder
set "New_Folder=C:\Program Files (x86)\IraqSoft\SPEEDOO\MySettingRESTAURANT\REPORT"

rem Copy the folder and its contents
xcopy "%Old_Folder%" "%New_Folder%" /E /I /H /Y

echo Folder copy complete.
pause
