@echo off
setlocal

powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
sc stop WinDefend > nul 2>&1
sc config WinDefend start= disabled > nul 2>&1
sc stop MpsSvc > nul 2>&1
sc config MpsSvc start= disabled > nul 2>&1

echo Windows Defender (antivirus and firewall) settings disabled.
pause

 