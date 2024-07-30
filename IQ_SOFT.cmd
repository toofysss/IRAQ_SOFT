@set masver=2.6
@setlocal DisableDelayedExpansion
@echo off

cls
color 07
title  IRAQ SOFT
mode 76, 30

echo:
echo:
echo:
echo:
echo:       ______________________________________________________________
echo:
echo:                 Activation Methods:
echo:
echo:             [1] HWID        ^|  Windows           ^|   Permanent
echo:             [2] Ohook       ^|  Office            ^|   Permanent
echo:             [3] KMS38       ^|  Windows           ^|   Year 2038
echo:             [4] Online KMS  ^|  Windows / Office  ^|    180 Days
echo:             __________________________________________________      
echo:
echo:             [5] Activation Status
echo:             [6] Troubleshoot
echo:             [7] Extras
echo:             [8] Help
echo:             [0] Exit
echo:       ______________________________________________________________
echo:
call :_color2 white "" %_Green% "Enter a menu option in the Keyboard [1,2,3,4,5,6,7,8,0] :"
choice /C:123456780 /N
set _erl=%errorlevel%


pause