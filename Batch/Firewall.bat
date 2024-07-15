@echo off
REM Run PowerShell script
set "SCRIPT_PATH=%~dp0"
set FireWallLoc=\Firewall.ps1

@REM powershell -File "%SCRIPT_PATH%%FireWallLoc%"
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_PATH%%FireWallLoc%"

pause
