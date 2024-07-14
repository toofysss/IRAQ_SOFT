@echo off
REM Run PowerShell script
set "SCRIPT_PATH=%~dp0"
set FireWallLoc=\s.ps1

powershell -File "%SCRIPT_PATH%%FireWallLoc%"

pause
