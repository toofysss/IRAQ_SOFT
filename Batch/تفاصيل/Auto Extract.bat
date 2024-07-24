@echo off

rem Set the path to WinRAR executable, adjust this path if needed
set "WinRAR_Path=C:\Program Files\WinRAR\WinRAR.exe"

rem Set the archive you want to extract
set "Archive_To_Extract=C:\Program Files (x86)\IraqSoft\SPEEDOO\MySettingRESTAURANT\Report.rar"

rem Set the destination folder
set "Destination_Folder=C:\Program Files (x86)\IraqSoft\SPEEDOO\MySettingRESTAURANT\REPORT"

rem Extract the archive
"%WinRAR_Path%" e -o+ "%Archive_To_Extract%" "%Destination_Folder%"

echo Extraction complete.
pause
