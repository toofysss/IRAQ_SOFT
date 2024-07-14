@echo off

set CoinfirmPassowrd="spo"
set SQL_Connecction=127.0.0.1\SALES_DEV -U sa -P 12345
set SQL_SPEEDO_DB=USE SPEEDOO_DB
set SQL_SPEEDO_REST_DB=USE RESTAURANT_DB
set Download_Loc=Download.bat
set Activty_Loc=Activty.bat
set "SCRIPT_PATH=%~dp0"
set "SCRIPT_NAME=%~nx0"
set File_Loc="%SCRIPT_PATH%%SCRIPT_NAME%"

@REM  Main
:main
title Speedo
cls
color 0F
echo Press 1 If You Want To Use SQL Server
echo Press 2 If You Want To Use Download
echo Press 3 If You Want To Use Activty
set /p Selected=What Do You Want: 
if "%Selected%" == "1" goto SqlServer
if "%Selected%" == "2" goto Downloads
if "%Selected%" == "3" goto Activty

goto End

@REM SQL SERVER

:SqlServer 
title SQL Server
cls
echo Press 0 If You Want To Back To Main
echo Press 1 If You Want To Use Speedo_Rest 
echo Press 2 If You Want To Use Speedo 

set /p Selected=What Do You Want: 
if "%Selected%" == "0" goto main
if "%Selected%" == "1" goto Sql_Speedo_Rest
if "%Selected%" == "2" goto Sql_Speedo
goto SqlServer


@REM Speedo Rest 
:Sql_Speedo_Rest
title Speedo Rest
cls
color 0A
echo Press 0 If You Want To Back To Main 
echo Press 1 If You Want To Manage Users
set /p Selected=What Do You Want: 
if "%Selected%" == "0" goto main
if "%Selected%" == "1" goto Sql_Speedo_Rest_Management_User
goto Sql_Speedo_Rest

@REM Speedo Rest  Management Users
:Sql_Speedo_Rest_Management_User
setlocal enabledelayedexpansion
title Speedo Rest Manage Users
cls
set query=%SQL_SPEEDO_REST_DB%; SELECT USER_CODE as ID, USER_NAME as Name FROM T_USERS
sqlcmd -S %SQL_Connecction%  -Q "%query%"
echo Press 0 If You Want To Back To Main 
echo Press 1 If You Want To Reset Admin Password
echo Press 2 If You Want To Add Admin
echo Press 3 If You Want To Reset Users

set /p Selected=What Do You Want: 
if "%Selected%" == "0" goto main
if "%Selected%" == "1" goto Speedo_Rest_Reset_Admin
if "%Selected%" == "2" goto Speedo_Rest_Add_User
if "%Selected%" == "3" goto Speedo_Rest_Reset_User
goto Sql_Speedo_Rest_Management_User


:Speedo_Rest_Reset_Admin
setlocal enabledelayedexpansion
for /f "delims=" %%a in ('powershell.exe -ExecutionPolicy Bypass -File "Encrypt.ps1"') do set "password=%%a"
if "%password%" == %CoinfirmPassowrd% (
    set /p ID=Enter User ID: 
    set title =Speedo Rest Reset Admin
    set query=%SQL_SPEEDO_REST_DB%; update T_USERS set USER_PWD ='fpd2Te7d3NwzGck5qAgK8g==' , IS_ENC =1 where USER_CODE = %ID%
    goto RunQuery
)
goto Speedo_Rest_Reset_Admin

:Speedo_Rest_Reset_User
setlocal enabledelayedexpansion
for /f "delims=" %%a in ('powershell.exe -ExecutionPolicy Bypass -File "Encrypt.ps1"') do set "password=%%a"
if "%password%" == %CoinfirmPassowrd% (
    cls
    set title =Speedo Rest Reset User
    set "query=%SQL_SPEEDO_REST_DB%; Delete from T_USERS; insert into T_USERS (USER_CODE, USER_NAME, USER_PWD, LEVEL_CODE, ACTIVE, LOG_IN, IS_ENC, APP_PWD) values (1, 'Admin', 22, 1, 1, 0, 1, '$2a$11$B08VqpwcVTXiYHYhMj8qpeeJ/UM9S/LZCmaH7RSS6TxrESG4J8Sei')"
    goto RunQuery
)
goto Speedo_Rest_Reset_User



:Speedo_Rest_Add_User
setlocal enabledelayedexpansion
for /f "delims=" %%a in ('powershell.exe -ExecutionPolicy Bypass -File "Encrypt.ps1"') do set "password=%%a"
if "%password%" == %CoinfirmPassowrd% (
    set /p Pass=Enter Password: 
    set title =Speedo Rest Add User
    set "query=%SQL_SPEEDO_REST_DB%; INSERT into T_USERS (USER_CODE, USER_NAME, USER_PWD, LEVEL_CODE, ACTIVE, LOG_IN, IS_ENC, APP_PWD) values (150, 'IRAQ SOFT', '%Pass%', 1, 1, 0, 1, '$2a$11$B08VqpwcVTXiYHYhMj8qpeeJ/UM9S/LZCmaH7RSS6TxrESG4J8Sei')"
    goto RunQuery
)
goto Speedo_Rest_Add_User 





@REM Speedo
:Sql_Speedo
title Speedo
cls
color 0C
echo Press 0 If You Want To Back To Main 
echo Press 1 If You Want To Manage Users
echo Press 2 If You Want To Active Delete Items
echo Press 3 If You Want To Set Items Zero
echo Press 4 If You Want To Active Telegram 
echo Press 5 If You Want To Reset Data But Items
set /p Selected=What Do You Want: 
if "%Selected%" == "0" goto main
if "%Selected%" == "1" goto Sql_Speedo_Management_User
if "%Selected%" == "2" goto Sql_Speedo_Active_Delete_Items
if "%Selected%" == "3" goto Sql_Speedo_Set_Items_Zero
if "%Selected%" == "4" goto Sql_Speedo_Active_Telegram
if "%Selected%" == "5" goto Sql_Speedo_Reset_Data_But_Items

goto Sql_Speedo


@REM Speedo Management Users
:Sql_Speedo_Management_User
title Speedo Manage Users
cls
set query=%SQL_SPEEDO_DB%; SELECT USER_CODE as Code, USER_NAME as Name FROM T_USERS
sqlcmd -S %SQL_Connecction%  -Q "%query%"
echo Press 0 If You Want To Back To Main 
echo Press 1 If You Want To Reset Admin Password
echo Press 2 If You Want To Add Admin
echo Press 3 If You Want To Reset Users
    
set /p Selected=What Do You Want: 
if "%Selected%" == "0" goto main
if "%Selected%" == "1" goto Speedo_Reset_Admin
if "%Selected%" == "2" goto Speedo_Add_User
if "%Selected%" == "3" goto Speedo_Reset_User
goto Sql_Speedo_Management_User
 

:Speedo_Reset_Admin
setlocal enabledelayedexpansion
for /f "delims=" %%a in ('powershell.exe -ExecutionPolicy Bypass -File "Encrypt.ps1"') do set "password=%%a"
if "%password%" == %CoinfirmPassowrd% (
    set /p ID=Enter User ID: 
    set title =Speedo Reset Admin
    set "query=%SQL_SPEEDO_DB%; update T_USERS set USER_PWD ='fpd2Te7d3NwzGck5qAgK8g==' ,IS_ENC =1 where T_USERS.USER_CODE ='!ID!'"
    goto RunQuery
)
goto Speedo_Reset_Admin

:Speedo_Reset_User
setlocal enabledelayedexpansion
for /f "delims=" %%a in ('powershell.exe -ExecutionPolicy Bypass -File "Encrypt.ps1"') do set "password=%%a"
if "%password%" == %CoinfirmPassowrd% (
    set title =Speedo Reset User
    set "query=%SQL_SPEEDO_DB%; DELETE FROM T_USERS; INSERT INTO T_USERS (USER_CODE, USER_NAME, USER_PWD, LEVEL_CODE, ACTIVE, LOG_IN, BOX_CODE, IS_ENC, SECURETY_CODE, MANDOOB_CODE, STORE_CODE, TYPE_PRICE_CODE, APP_PWD, LEVEL_APP, DRIVER_CODE, TYPE_CH_OFFER) VALUES (1, 'Admin', 'fpd2Te7d3NwzGck5qAgK8g==', 1, 1, 0, 5000, 1, 3, -10, -10, -10, NULL, 1, 0, '')"
    goto RunQuery
)
goto Speedo_Reset_User



:Speedo_Add_User
setlocal enabledelayedexpansion
for /f "delims=" %%a in ('powershell.exe -ExecutionPolicy Bypass -File "Encrypt.ps1"') do set "password=%%a"
if "%password%" == %CoinfirmPassowrd% (
    set title =Speedo Add User
    set /p Pass=Enter Password: 
    set "query=%SQL_SPEEDO_DB%; insert into T_USERS (USER_CODE,USER_NAME,USER_PWD,LEVEL_CODE,ACTIVE,LOG_IN,BOX_CODE,IS_ENC,SECURETY_CODE,MANDOOB_CODE,STORE_CODE,TYPE_PRICE_CODE,APP_PWD,LEVEL_APP,DRIVER_CODE,TYPE_CH_OFFER) values (150,'IRAQ SOFT','%Pass%',1,1,0,5000,1,3,-10,-10,-10,NULL,1,0,'')"
    goto RunQuery
)
goto Speedo_Add_User 


@REM Speedo Active Delete Items
:Sql_Speedo_Active_Delete_Items
setlocal enabledelayedexpansion
for /f "delims=" %%a in ('powershell.exe -ExecutionPolicy Bypass -File "Encrypt.ps1"') do set "password=%%a"
if "%password%" == %CoinfirmPassowrd% (
    set title = Speedo Active Delete Items
    set query=%SQL_SPEEDO_DB%; UPDATE T_ITEMS set ACTIVE = 1
    goto RunQuery
)
goto Sql_Speedo_Active_Delete_Items

@REM Speedo Set Items Zero
:Sql_Speedo_Set_Items_Zero
setlocal enabledelayedexpansion
for /f "delims=" %%a in ('powershell.exe -ExecutionPolicy Bypass -File "Encrypt.ps1"') do set "password=%%a"
if "%password%" == %CoinfirmPassowrd% (
    set title = Speedo Set Items Zero
    set "query=%SQL_SPEEDO_DB%; UPDate T_STORE_BOX set ST_IN=0, ST_OUT=0 where BILL_NUMBER=0 updATE T_BUY_DETAILS SET QTY=0,TOTAL=0,TOTAL_COST=0,QTY_IN=0,QTY_OUT=0,TOTAL_OUT=0 WHERE BILL_NUMBER=0"
    goto RunQuery
)
goto Sql_Speedo_Set_Items_Zero

@REM Speedo Active Telegram
:Sql_Speedo_Active_Telegram
setlocal enabledelayedexpansion

for /f "delims=" %%a in ('powershell.exe -ExecutionPolicy Bypass -File "Encrypt.ps1"') do set "password=%%a"
if "%password%" == %CoinfirmPassowrd% (
    set /P groupID=Enter the Telegram Group ID:
    set title = Active Telegram
    set query=%SQL_SPEEDO_DB%; UPDATE T_CONFIGRATION SET TELEGRAM ='False;True;True;True;True;True;True;False;True;True;True;True;True;True;True;True;', TELE_MAIN = 'Z8YEv4CT7AjhcVKk9Vnp4A==', TL_ID = '%groupID%'
    goto RunQuery
)
goto Sql_Speedo_Active_Telegram


@REM Speedo Reset Data But Items
:Sql_Speedo_Reset_Data_But_Items
setlocal enabledelayedexpansion
set query=%SQL_SPEEDO_DB%
set query=%query% DELETE FROM T_SHAREEK
set query=%query% DELETE FROM T_SANAD_HAWALA_HISTORY
set query=%query% DELETE FROM T_SANAD_HAWALA
set query=%query% DELETE FROM T_SANAD_HISTORY
set query=%query% DELETE FROM T_PATH_BACKUP
set query=%query% DELETE FROM T_FORM_LAYOUT_FILE
set query=%query% DELETE FROM T_FACTORY_ITEM_WAITING
set query=%query% DELETE FROM T_SALES_PDF
set query=%query% DELETE FROM T_MAINTENANCE
set query=%query% DELETE FROM T_MAINTENANCE_DEVICE
set query=%query% DELETE FROM T_MAINTENANCE_LABEL
set query=%query% DELETE FROM TA_PANDEL
set query=%query% DELETE FROM TA_PROJECT
set query=%query% DELETE FROM TA_PROJECT_KADER
set query=%query% DELETE FROM TA_PROJECT_PANDEL
set query=%query% DELETE FROM TH_ROOM
set query=%query% DELETE FROM TH_ROOM_BOOKING
set query=%query% DELETE FROM TH_ROOM_BOOKING_GUEST
set query=%query% DELETE FROM TH_ROOM_BOOKING_STATE
set query=%query% DELETE FROM TH_ROOM_FLOOR
set query=%query% DELETE FROM TH_ROOM_IMAGE
set query=%query% DELETE FROM T_FORM_APP
set query=%query% DELETE FROM T_FORM_SHORTCUT
set query=%query% DELETE FROM T_ITEM_APPLICATION
set query=%query% DELETE FROM T_ITEMS_REPORT
set query=%query% DELETE FROM T_KAFEL_CLIENT
set query=%query% DELETE FROM T_RECEVER_ORDER
set query=%query% DELETE FROM T_REGION_SHIP
set query=%query% DELETE FROM T_SALES_DIRECT
set query=%query% DELETE FROM T_SALES_DIRECT_DETAILS
set query=%query% DELETE FROM T_SALES_EXPENSES
set query=%query% DELETE FROM T_SALES_FRUIT
set query=%query% DELETE FROM T_SALES_FRUIT_DETAILS
set query=%query% DELETE FROM T_SALES_SHIPPING
set query=%query% DELETE FROM T_USERS_TAG
set query=%query% DELETE FROM tblAttendances
set query=%query% DELETE FROM tblDeleteUsers
set query=%query% DELETE FROM T_ITEMS_MANDOOB
set query=%query% DELETE FROM TA_STUDENT
set query=%query% DELETE FROM TA_STUDENT_DEGREE
set query=%query% DELETE FROM TA_STUDENT_ENTRY
set query=%query% DELETE FROM TA_STUDENT_GATE
set query=%query% DELETE FROM TA_STUDENT_GROUP
set query=%query% DELETE FROM TA_CARS
set query=%query% DELETE FROM TA_CARS_DETAILS
set query=%query% DELETE FROM TA_CARS_EXPENSES
set query=%query% DELETE FROM T_JOINT_SUBSCRIPTION
set query=%query% DELETE FROM T_JOINT_GATE
set query=%query% DELETE FROM T_JOINT
set query=%query% DELETE FROM T_SUBSCRIPTION
set query=%query% DELETE FROM T_GATE
set query=%query% DELETE FROM T_AKSAT_ITEM_DETAILS
set query=%query% DELETE FROM T_AKSAT_ITEMS
set query=%query% DELETE FROM T_BOOKING
set query=%query% DELETE FROM T_BOOKING_DATE
set query=%query% DELETE FROM T_BOOKING_DETAILS
set query=%query% DELETE FROM T_BOOKING_HOLIDAY
set query=%query% DELETE FROM T_BOOKING_QISM
set query=%query% DELETE FROM T_CONTAINER
set query=%query% DELETE FROM T_CONTAINER_DETAILS
set query=%query% DELETE FROM T_CONTAINER_EXPENSES
set query=%query% DELETE FROM T_DRIVERS
set query=%query% DELETE FROM T_VIDEO_LINK
set query=%query% DELETE FROM T_ATTACHMENT
set query=%query% DELETE FROM T_USERS_MAWJOOD
set query=%query% DELETE FROM T_SMS_MASSAGE_TYPE
set query=%query% DELETE FROM T_PRINTER_STORE
set query=%query% DELETE FROM T_NOTES
set query=%query% DELETE FROM T_MAWJOOD_STATUS
set query=%query% DELETE FROM T_AKSAT_DETAILS
set query=%query% DELETE FROM T_AKSAT_MODEL
set query=%query% DELETE FROM T_AKSAT_MODEL_DETAILS
set query=%query% DELETE FROM T_ITEM_CORRECT
set query=%query% DELETE FROM T_ITEM_RESTURANT
set query=%query% DELETE FROM T_ITEM_SERIAL
set query=%query% DELETE FROM T_ITEM_AVG_CURSER
set query=%query% DELETE FROM TB_AQED_AYGAR
set query=%query% DELETE FROM TB_PROJECT
set query=%query% DELETE FROM TB_PROJECT_SUPPLIER
set query=%query% DELETE FROM TB_ZONE
set query=%query% DELETE FROM TB_BUILDING
set query=%query% DELETE FROM TB_FLOOR
set query=%query% DELETE FROM TB_HOUSE 
set query=%query% DELETE FROM TB_ATTACHMENT
set query=%query% DELETE FROM TB_CLIENT_INFO
set query=%query% DELETE FROM TB_HOUSE_TOKEN
set query=%query% DELETE FROM TB_MAINTENANCE
set query=%query% DELETE FROM TB_NEWS
set query=%query% DELETE FROM TB_NEWS_TYPE
set query=%query% DELETE FROM TB_RELATION_CLIENT
set query=%query% DELETE FROM TB_RENTER_HOUSE
set query=%query% DELETE FROM TB_SERVICE
set query=%query% DELETE FROM TB_SERVICE_DETAILS
set query=%query% DELETE FROM T_OFFER
set query=%query% DELETE FROM T_OFFERS_DETAILS 
set query=%query% DELETE FROM T_APP_INVOICE 
set query=%query% DELETE FROM T_CLIENT_GIM_ENTRY 
set query=%query% DELETE FROM T_USER_ERROR 
set query=%query% DELETE FROM T_TELE_SCH 
set query=%query% DELETE FROM T_TELE_SYNC 
set query=%query% DELETE FROM T_CENTER_COST_INVOICE
set query=%query% DELETE FROM T_SALES_DISCOUNT
set query=%query% DELETE FROM T_SALES_IN_OUT
set query=%query% DELETE FROM T_SANAD_CNY
set query=%query% DELETE FROM T_ACCOUNT_CHECKED 
set query=%query% DELETE FROM T_ACCOUNTS WHERE ACCOUNT_PARENT=1
set query=%query% DELETE FROM T_ACCOUNTS WHERE ACCOUNT_PARENT=3
set query=%query% DELETE FROM T_ACCOUNTS WHERE ACCOUNT_PARENT=4
set query=%query% DELETE FROM T_AKSAT 
set query=%query% DELETE FROM T_BALANCE_FINAL 
set query=%query% DELETE FROM T_BARCODE_PRINT 
set query=%query% DELETE FROM T_BOX 
set query=%query% DELETE FROM T_BOX_REPORT_ACCOUNT 
set query=%query% DELETE FROM T_BOX_REPORT_ACCOUNT_DETAILS 
set query=%query% DELETE FROM T_EMP_ENTER 
set query=%query% DELETE FROM T_EMP_ENTER_REPORT
set query=%query% DELETE FROM T_EMPLOYEE
set query=%query% DELETE FROM T_AA_ACCOUNT_NEW_YEAR
set query=%query% DELETE FROM T_AA_ITEM_NEW_YEAR
set query=%query% DELETE FROM T_CENTER_COST
set query=%query% DELETE FROM T_CENTER_COST_ITEMS
set query=%query% DELETE FROM T_EXPENSES
set query=%query% DELETE FROM T_KAFEL
set query=%query% DELETE FROM T_MANDOOB 
set query=%query% INSERT INTO [dbo].[T_MANDOOB]   ([MANDOOB_CODE],[MANDOOB_NAME]  ,[MANDOOB_PERCENT]  ,[MANDOOB_ACTIVE]) VALUES (1 ,N'...',0, 1 )
set query=%query% INSERT INTO [dbo].[T_MANDOOB]   ([MANDOOB_CODE],[MANDOOB_NAME]  ,[MANDOOB_PERCENT]  ,[MANDOOB_ACTIVE]) VALUES (-10 ,N'غير محدد',0, 0 )
set query=%query% DELETE FROM T_SANAD 
set query=%query% DELETE FROM T_SANAD_DOLLAR
set query=%query% DELETE FROM T_SANAD_KAYD
set query=%query% DELETE FROM T_SANAD_KAYD_DETAILS
set query=%query% DELETE FROM T_SANAD_SMAH
set query=%query% delete FROM T_SALES
set query=%query% DELETE FROM T_SALES_PATROL
set query=%query% DELETE FROM T_SALES_DETAILS
set query=%query% DELETE FROM T_SALES_TEMP
set query=%query% delete FROM T_BUY
set query=%query% delete FROM T_BUY_EXPENSES
set query=%query% delete FROM T_BUY_RETURN
set query=%query% delete FROM T_BUY_RETURN_DETAILS
set query=%query% delete FROM T_FACTORY
set query=%query% delete FROM T_FACTORY_DETAILS 
set query=%query% delete FROM T_STORE_TRANSFARE
set query=%query% delete FROM T_STORE_TRANSFARE_DETAILS
set query=%query% delete FROM T_UNIT_FORM
set query=%query% delete FROM T_UNIT_FORM_INFO
set query=%query% delete FROM T_USER_DETAILS
set query=%query% UPDATE T_USERS SET USER_NAME=N'Admin',USER_PWD=22,ACTIVE=1,LEVEL_CODE=1,LOG_IN=0,BOX_CODE=5000,IS_ENC=0,SECURETY_CODE=3,APP_PWD=NULL,STORE_CODE=-10 ,TYPE_PRICE_CODE=-10,MANDOOB_CODE=-10 WHERE USER_CODE=1
set query=%query% UPDATE T_WORK_JOB SET D_DATE=NULL ,[START_DATE]=NULL,IS_ON_OFF=0 WHERE T_ID=1
set query=%query% UPDate T_STORE_BOX set ST_IN=0, ST_OUT=0 where BILL_NUMBER=0 updATE T_BUY_DETAILS SET QTY=0,TOTAL=0,TOTAL_COST=0,QTY_IN=0,QTY_OUT=0,TOTAL_OUT=0 WHERE BILL_NUMBER=0





for /f "delims=" %%a in ('powershell.exe -ExecutionPolicy Bypass -File "Encrypt.ps1"') do set "password=%%a"
if "%password%" == %CoinfirmPassowrd% (
    set title = Sql Speedo Reset Data But Items
    sqlcmd -S %SQL_Connecction% -Q "%query% DELETE FROM T_TAG_PROCCESS WHERE TAG_PROCCESS_CODE > 0  DELETE FROM T_LEVEL WHERE LEVEL_CODE > 1 DELETE FROM T_CLIENT WHERE  ACCOUNT_CODE <> 2100000 DELETE FROM T_ACCOUNTS WHERE ACCOUNT_PARENT=5 AND ACCOUNT_CODE <> 5000 DELETE FROM T_ACCOUNTS WHERE ACCOUNT_PARENT=6 AND ACCOUNT_CODE <> 6000 DELETE FROM T_ACCOUNTS WHERE ACCOUNT_PARENT=7 AND ACCOUNT_CODE <> 7000 DELETE FROM T_ACCOUNTS WHERE ACCOUNT_PARENT=8 AND ACCOUNT_CODE <> 8000 DELETE FROM T_ACCOUNTS WHERE ACCOUNT_PARENT=9 AND ACCOUNT_CODE <> 9000 DELETE FROM T_ACCOUNTS WHERE ACCOUNT_PARENT=21 AND ACCOUNT_CODE <> 2100000 DELETE FROM T_MOVE WHERE ACTIVE=0 OR MOVE_CODE>300 DELETE FROM T_PRINTER WHERE T_ID > 0 delete FROM T_BUY_DETAILS WHERE BILL_NUMBER<>0 delete FROM T_STORE_BOX WHERE BILL_NUMBER<>0 delete FROM T_STORE_TYPE WHERE STORE_CODE >0 DELETE FROM T_USERS WHERE USER_CODE<>1 "
    PAUSE
    del %File_Loc%
)
goto Sql_Speedo_Reset_Data_But_Items


@REM Downloads
:Downloads
start %Download_Loc%
del %File_Loc%
exit
goto Downloads

@REM Activity
:Activty
start %Activty_Loc%
del %File_Loc%
exit
goto Activty

:End

:RunQuery
title %title%
sqlcmd -S %SQL_Connecction% -d %SQL_SPEEDO_DB% -Q "!query!"
PAUSE
del %File_Loc%
exit 