@echo off
setlocal

:: Disable Windows Defender real-time protection
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"

:: Stop and disable Windows Defender Antivirus service
sc stop WinDefend > nul 2>&1
sc config WinDefend start= disabled > nul 2>&1

:: Stop and disable Windows Defender Firewall service (if needed)
sc stop MpsSvc > nul 2>&1
sc config MpsSvc start= disabled > nul 2>&1

echo Windows Defender (antivirus and firewall) settings disabled.
pause

 