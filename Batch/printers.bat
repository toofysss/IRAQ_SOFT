@echo off

@REM Downloads
@REM Canon_6030 Url
set Canon_6030_Url="https://www.dropbox.com/s/oz90u6uhikoh4nk/Canon%206030.rar?dl=0"
set Canon_6030_File="Canon_6030.rar"
@REM Thermal printer
set pos_Url="https://www.dropbox.com/s/e63chfl7tonsnd9/%D8%B7%D8%A7%D8%A8%D8%B9%D8%A9%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A%D8%A9.rar?dl=0"
set pos_File="pos.rar"
@REM BARCODE printer
set BARCODE_Url="https://www.dropbox.com/s/rwvgplta337cz9t/4BARCODE_2019.1_M-2.rar?dl=0"
set BARCODE_File="4BARCODE_2019.1_M-2.rar"
@REM IPOS JJ
set IPOS_JJ_Url="https://www.dropbox.com/s/83wqfhg2g9rcgvw/POS%20Printer%20Driver%20Setup%20V7.17.exe?dl=0"
set IPOS_JJ_File="POS-Driver-V7.17.exe"
@REM POS 80 Series
set POS_80_Series_Url="https://www.dropbox.com/s/u3zu3w0dnadi896/POS-80-Series.rar?dl=0"
set POS_80_Series_File="POS-80-Series.rar"
@REM AG POS Printer
set AG_POS_Url="https://www.dropbox.com/scl/fi/x2dubay6xndqxj8lmujah/AG_POS-_Printer_Driver_v2.5.3.6.exe?rlkey=059h4depf90a137wi7ff9qki0&st=03x4ytew&dl=0"
set AG_POS_File="AG_POS_Printer_Driver_v2.5.3.6.exe"
:main
title Download PRINTERS
@REM  Main
cls
title Download PRINTERS
color 0F
echo Press 0 If You Want To Download  Canon 6030
echo Press 1 If You Want To Download  Thermal printer
echo Press 2 If You Want To Download  BARCODE printer
echo Press 3 If You Want To Download  IPOS JJ printer
echo Press 4 If You Want To Download  IPOS POS 80 Series
echo Press 5 If You Want To Download  AG POS Printer
set /p Selected=What Do You Want: 

if "%Selected%" == "0" (
    set url=%Canon_6030_Url%
    set output=%Canon_6030_File%
    goto download
)
if "%Selected%" == "1" (
    set url=%pos_Url%
    set output=%pos_File%
    goto download
)
if "%Selected%" == "2" (
    set url=%BARCODE_Url%
    set output=%BARCODE_File%
    goto download
)
if "%Selected%" == "3" (
    set url=%IPOS_JJ_Url%
    set output=%IPOS_JJ_File%
    goto download
)
if "%Selected%" == "4" (
    set url=%POS_80_Series_Url%
    set output=%POS_80_Series_File%
    goto download
)
if "%Selected%" == "5" (
    set url=%AG_POS_Url%
    set output=%AG_POS_File%
    goto download
)
goto End

:download
curl -L --progress-bar --retry 5 --retry-delay 10 -C - -o %output% %url%
if %errorlevel% neq 0 (
    echo Download interrupted. Retrying...
    timeout /t 10
    goto download
)

echo Download Complete. Waiting To Opening The File...
start "" %output%

:End
exit