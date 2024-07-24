@echo off

rem Set the path to WinRAR executable, adjust this path if needed
set "WinRAR_Path=C:\Program Files\WinRAR\WinRAR.exe"

rem Set the folder you want to compress
set "Folder_To_Compress=C:\Program Files (x86)\IraqSoft\SPEEDOO\MySettingRESTAURANT\REPORT"

rem Set the destination archive path and name
set "Archive_Loc=C:\Program Files (x86)\IraqSoft\SPEEDOO\MySettingRESTAURANT\Report.rar"

rem Compress the folder
"%WinRAR_Path%" a -r "%Archive_Loc%" "%Folder_To_Compress%"

echo Compression complete.
pause
