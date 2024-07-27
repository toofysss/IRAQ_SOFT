USE [RESTAURANT_DB]
GO
/****** Object:  StoredProcedure [dbo].[P_CHECK_EXIST_COLUMNS]    Script Date: 2024/07/24 2:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












ALTER PROCEDURE [dbo].[P_CHECK_EXIST_COLUMNS]

	
@SUBMIT_FLAG INT OUTPUT
AS
DECLARE
@DATE_JOB DATE,
@DATE_NOW DATE
BEGIN
SET @SUBMIT_FLAG=0
SELECT TOP(1) @DATE_JOB=ISNULL(D_DATE,GETDATE())  FROM T_WORK_JOB WHERE T_ID=1
SET @DATE_NOW=GETDATE()
IF @DATE_JOB=@DATE_NOW
BEGIN
DELETE FROM T_SALES_TEMP WHERE BILL_DATE<@DATE_JOB
END

DELETE FROM T_SIP_PHONE WHERE ACTIVE=0


--////////////////////////////////////////////////////////////T_DRIVER/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_DRIVER' AND [COLUMN_NAME] = N'USER_APP')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_DRIVER ADD [USER_APP] NVARCHAR(MAX) NULL

COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 --////////////////////////////////////////////////////////////T_DRIVER/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_DRIVER' AND [COLUMN_NAME] = N'PASSWORD_APP')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_DRIVER ADD [PASSWORD_APP] NVARCHAR(MAX) NULL

COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 
--////////////////////////////////////////////////////////////T_DRIVER/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_DRIVER' AND [COLUMN_NAME] = N'ACTIVE')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_DRIVER ADD [ACTIVE] BIT NULL
 ALTER TABLE [dbo].[T_DRIVER] ADD  CONSTRAINT [DF_T_DRIVER_ACTIVE]  DEFAULT ((1)) FOR [ACTIVE]
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
   ELSE
 BEGIN

EXEC('UPDATE [T_DRIVER] SET [ACTIVE]=0 WHERE ACTIVE IS NULL  ')
 
 END
--////////////////////////////////////////////////////////////T_ERADAT/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_ERADAT' AND [COLUMN_NAME] = N'COMPANY_NAME')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_ERADAT ADD [COMPANY_NAME]  NVARCHAR(MAX) NULL
 
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 
 --////////////////////////////////////////////////////////////T_ERADAT/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_EXPENSES' AND [COLUMN_NAME] = N'COMPANY_NAME')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_EXPENSES ADD [COMPANY_NAME]  NVARCHAR(MAX) NULL
 
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
  
--////////////////////////////////////////////////////////////T_LEVEL/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_LEVEL' AND [COLUMN_NAME] = N'LEVEL_ADD')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_LEVEL ADD [LEVEL_ADD] NVARCHAR(MAX) NULL

COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 
--////////////////////////////////////////////////////////////T_CONFIGRATION/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_CONFIGRATION' AND [COLUMN_NAME] = N'TL_S')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_CONFIGRATION ADD [TL_S] NVARCHAR(MAX) NULL

COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
--////////////////////////////////////////////////////////////T_CONFIGRATION/////////////////////////////////////////////////////////////////////////////////////////////////////////
 
  IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_CONFIGRATION' AND [COLUMN_NAME] = N'TELE_MAIN')
BEGIN
  --/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
 ALTER TABLE T_CONFIGRATION ADD [TELE_MAIN] NVARCHAR(MAX) NULL
    COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
  END

--////////////////////////////////////////////////////////////T_APP_TABLE/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_APP_TABLE' AND [COLUMN_NAME] = N'C_DATE')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_APP_TABLE ADD [C_DATE] [datetime] NULL
ALTER TABLE [dbo].[T_APP_TABLE] ADD  CONSTRAINT [DF_T_APP_TABLE_C_DATE]  DEFAULT (getdate()) FOR [C_DATE]
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  

--////////////////////////////////////////////////////////////T_TABLE/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_TABLE' AND [COLUMN_NAME] = N'USER_CODE')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_TABLE ADD [USER_CODE] INT NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  

--////////////////////////////////////////////////////////////T_TABLE/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_TABLE' AND [COLUMN_NAME] = N'IS_ENTRY')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_TABLE ADD [IS_ENTRY] BIT NULL

COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
  ELSE
 BEGIN
 
 EXEC('UPDATE T_TABLE SET IS_ENTRY=0 WHERE IS_ENTRY IS NULL')
 END 

--////////////////////////////////////////////////////////////T_TABLE/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_TABLE' AND [COLUMN_NAME] = N'USER_ENTRY')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_TABLE ADD [USER_ENTRY] NVARCHAR(MAX) NULL

COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
   




--////////////////////////////////////////////////////////////T_LEVEL/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_LEVEL' AND [COLUMN_NAME] = N'MN_A11_1')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_LEVEL ADD [MN_A11_1] BIT NULL

COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
  ELSE
 BEGIN
EXEC('UPDATE [T_LEVEL] SET [MN_A11_1]=0')
EXEC('UPDATE [T_LEVEL] SET [MN_A11_1]=1 WHERE LEVEL_CODE=1')
 END
--////////////////////////////////////////////////////////////T_LEVEL/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_LEVEL' AND [COLUMN_NAME] = N'MN_A11_2')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_LEVEL ADD [MN_A11_2] BIT NULL

COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 ELSE
 BEGIN
EXEC('UPDATE [T_LEVEL] SET [MN_A11_2]=0')
EXEC('UPDATE [T_LEVEL] SET [MN_A11_2]=1 WHERE LEVEL_CODE=1')
 END

--////////////////////////////////////////////////////////////T_USERS/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_USERS' AND [COLUMN_NAME] = N'APP_PWD')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_USERS ADD [APP_PWD] nvarchar(MAX) NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  


--////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'LIN_X')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES ADD [LIN_X] nvarchar(MAX) NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  



--////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'LIN_Y')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES ADD [LIN_Y] nvarchar(MAX) NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  


--////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'NAME_BRANCH')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES ADD [NAME_BRANCH] nvarchar(MAX) NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  



--////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'BILL_SERVER')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES ADD [BILL_SERVER] INT NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  



--////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'STATUS_APP')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES ADD [STATUS_APP] INT NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  



--////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'KITCHEN_DISPLAY_STATE')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES ADD [KITCHEN_DISPLAY_STATE] INT NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  




--////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'KITCHEN_DISPALY_MIN')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES ADD [KITCHEN_DISPALY_MIN] NVARCHAR(MAX) NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  





--////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'CLIENT_CODE')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES ADD [CLIENT_CODE] INT NULL
ALTER TABLE [dbo].[T_SALES] ADD  CONSTRAINT [DF_T_SALES_CLIENT_CODE]  DEFAULT ((0)) FOR [CLIENT_CODE]
--UPDATE T_SALES SET CLIENT_CODE=0 WHERE CLIENT_CODE=NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 ELSE
 BEGIN
EXEC('UPDATE T_SALES SET CLIENT_CODE=0 WHERE CLIENT_CODE IS NULL')
 END





--////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'IVC_CODE')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES ADD [IVC_CODE] INT NULL
ALTER TABLE [dbo].[T_SALES] ADD  CONSTRAINT [DF_T_SALES_IVC_CODE]  DEFAULT ((0)) FOR [IVC_CODE]
--UPDATE T_SALES SET IVC_CODE=0 WHERE IVC_CODE=NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 ELSE
 BEGIN
EXEC('UPDATE T_SALES SET IVC_CODE=0 WHERE IVC_CODE IS NULL')
 END


--////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'IS_CASH')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES ADD [IS_CASH] INT NULL
ALTER TABLE [dbo].[T_SALES] ADD  CONSTRAINT [DF_T_SALES_IS_CASH]  DEFAULT ((1)) FOR [IS_CASH]
--UPDATE T_SALES SET IS_CASH=0 WHERE IS_CASH=NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  

 --////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'NO_CLIENT')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES ADD [NO_CLIENT] INT NULL
ALTER TABLE [dbo].[T_SALES] ADD  CONSTRAINT [DF_T_SALES_NO_CLIENT]  DEFAULT ((0)) FOR [NO_CLIENT]
 
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
  ELSE
 BEGIN
EXEC('UPDATE T_SALES SET NO_CLIENT=0 WHERE NO_CLIENT IS NULL')
 END

 --////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'DISCOUNT_NOTE')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES ADD [DISCOUNT_NOTE] NVARCHAR(MAX) NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  



 --////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'RECIPIENT_CODE')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES ADD [RECIPIENT_CODE] INT NULL

COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 ELSE
 BEGIN
EXEC('UPDATE T_SALES SET RECIPIENT_CODE=0 WHERE RECIPIENT_CODE IS NULL')
 END


 --////////////////////////////////////////////////////////////T_CLIENT/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_CLIENT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_CLIENT](
	[CLIENT_CODE] [int] NOT NULL,
	[CLIENT_NAME] [nvarchar](max) COLLATE Arabic_CI_AS NULL,
	[CLIENT_PHONE] [nvarchar](max) COLLATE Arabic_CI_AS NULL,
	[CLIENT_REGION] [nvarchar](max) COLLATE Arabic_CI_AS NULL,
	[CLIENT_ADDRESS] [nvarchar](max) COLLATE Arabic_CI_AS NULL,
	[CLIENT_ACTIVE] [bit] NULL,
	[C_DATE] [datetime] NULL,
 CONSTRAINT [PK_T_CLIENT] PRIMARY KEY CLUSTERED 
(
	[CLIENT_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
 ELSE
 BEGIN
IF NOT EXISTS (SELECT 1 FROM T_CLIENT WHERE CLIENT_CODE = 0) INSERT [dbo].[T_CLIENT] ([CLIENT_CODE], [CLIENT_NAME], [CLIENT_PHONE], [CLIENT_REGION], [CLIENT_ADDRESS], [CLIENT_ACTIVE]) VALUES (0, N'عميل نقدي', N'', N'', N'', 1) 
 END
 --////////////////////////////////////////////////////////////T_RECIPIENTS/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_RECIPIENTS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_RECIPIENTS](
	[RECIPIENT_CODE] [int] NOT NULL,
	[RECIPIENT_NAME] [nvarchar](max) COLLATE Arabic_CI_AS NULL,
	[DISCOUNT_PERCENT] [float] NULL,
	[RECIPIENT_BARCODE] [nvarchar](max) COLLATE Arabic_CI_AS NULL,
	[ACTIVE] [bit] NULL,
 CONSTRAINT [PK_T_RECIPIENTS] PRIMARY KEY CLUSTERED 
(
	[RECIPIENT_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END
 ELSE
 BEGIN
 EXEC('UPDATE T_SALES SET RECIPIENT_CODE=0 WHERE RECIPIENT_CODE IS NULL')
IF NOT EXISTS (SELECT 1 FROM T_RECIPIENTS WHERE RECIPIENT_CODE = 0) INSERT [dbo].T_RECIPIENTS (RECIPIENT_CODE, [RECIPIENT_NAME], [DISCOUNT_PERCENT], [RECIPIENT_BARCODE],[ACTIVE]) VALUES (0, N'غير محدد',0, N'',  1) 
 END
  --////////////////////////////////////////////////////////////T_IVC_TYPE/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_IVC_TYPE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_IVC_TYPE](
	[IVC_CODE] [int] NOT NULL,
	[IVC_NAME] [nvarchar](max) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_T_IVC_TYPE] PRIMARY KEY CLUSTERED 
(
	[IVC_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
 ELSE
 BEGIN
IF NOT EXISTS (SELECT 1 FROM T_IVC_TYPE WHERE IVC_CODE = 0) INSERT [dbo].[T_IVC_TYPE] ([IVC_CODE], [IVC_NAME]) VALUES (0, N'نقدي')
IF NOT EXISTS (SELECT 1 FROM T_IVC_TYPE WHERE IVC_CODE = 1) INSERT [dbo].[T_IVC_TYPE] ([IVC_CODE], [IVC_NAME]) VALUES (1, N'اجل')
 END
 
 --////////////////////////////////////////////////////////////T_APP_TYPE/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_APP_TYPE' AND [COLUMN_NAME] = N'IVC_CODE')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_APP_TYPE ADD [IVC_CODE] INT NULL

COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 ELSE
 BEGIN
EXEC('UPDATE T_APP_TYPE SET IVC_CODE=0 WHERE IVC_CODE IS NULL')
 END

 --////////////////////////////////////////////////////////////T_APP_TYPE/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_APP_TYPE' AND [COLUMN_NAME] = N'IS_ROUND')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_APP_TYPE ADD [IS_ROUND] BIT NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 ELSE
 BEGIN
EXEC('UPDATE T_APP_TYPE SET IS_ROUND=0 WHERE IS_ROUND IS NULL')
 END
 --////////////////////////////////////////////////////////////T_APP_TYPE/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_APP_TYPE' AND [COLUMN_NAME] = N'ROUND_VALUE')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_APP_TYPE ADD [ROUND_VALUE] INT NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 ELSE
 BEGIN
EXEC('UPDATE T_APP_TYPE SET ROUND_VALUE=250 WHERE ROUND_VALUE IS NULL')
 END
--////////////////////////////////////////////////////////////T_APP_TYPE/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_APP_TYPE' AND [COLUMN_NAME] = N'ROUND_TYPE')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_APP_TYPE ADD [ROUND_TYPE] INT NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 ELSE
 BEGIN
EXEC('UPDATE T_APP_TYPE SET ROUND_TYPE=0 WHERE ROUND_TYPE IS NULL')
 END
--////////////////////////////////////////////////////////////T_APP_TYPE/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_APP_TYPE' AND [COLUMN_NAME] = N'ROUND_EXIST')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_APP_TYPE ADD [ROUND_EXIST] INT NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 ELSE
 BEGIN
EXEC('UPDATE T_APP_TYPE SET ROUND_EXIST=125 WHERE ROUND_EXIST IS NULL')
 END
 --////////////////////////////////////////////////////////////T_APP_TYPE/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_APP_TYPE' AND [COLUMN_NAME] = N'CLIENT_CODE')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_APP_TYPE ADD [CLIENT_CODE] INT NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 ELSE
 BEGIN
EXEC('UPDATE T_APP_TYPE SET CLIENT_CODE=0 WHERE CLIENT_CODE IS NULL')
 END
--////////////////////////////////////////////////////////////T_ITEMS/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_ITEMS' AND [COLUMN_NAME] = N'MAIN_ITEM_CODE')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_ITEMS ADD [MAIN_ITEM_CODE] INT NULL

COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
  ELSE
 BEGIN
EXEC('UPDATE [T_ITEMS] SET [MAIN_ITEM_CODE]=0 WHERE MAIN_ITEM_CODE IS NULL')
 END


--////////////////////////////////////////////////////////////T_ITEMS/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_ITEMS' AND [COLUMN_NAME] = N'QTY_PARENT')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_ITEMS ADD [QTY_PARENT] FLOAT NULL
EXEC('UPDATE [T_ITEMS] SET [QTY_PARENT]=1')
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
   ELSE
 BEGIN
EXEC('UPDATE [T_ITEMS] SET [QTY_PARENT]=1 WHERE QTY_PARENT IS NULL')
 END



--////////////////////////////////////////////////////////////T_ITEMS/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_ITEMS' AND [COLUMN_NAME] = N'BACK_COLOR')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_ITEMS ADD [BACK_COLOR] NVARCHAR(MAX) NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  

--////////////////////////////////////////////////////////////T_ITEMS/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_ITEMS' AND [COLUMN_NAME] = N'FONT_COLOR')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_ITEMS ADD [FONT_COLOR] NVARCHAR(MAX) NULL


COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  




--////////////////////////////////////////////////////////////T_ITEM_CATEGORY/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_ITEM_CATEGORY' AND [COLUMN_NAME] = N'BACK_COLOR')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_ITEM_CATEGORY ADD [BACK_COLOR] NVARCHAR(MAX) NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  

--////////////////////////////////////////////////////////////T_ITEM_CATEGORY/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_ITEM_CATEGORY' AND [COLUMN_NAME] = N'FONT_COLOR')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_ITEM_CATEGORY ADD [FONT_COLOR] NVARCHAR(MAX) NULL

COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  

--////////////////////////////////////////////////////////////T_ITEM_CATEGORY/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_ITEM_CATEGORY' AND [COLUMN_NAME] = N'SORT')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_ITEM_CATEGORY ADD [SORT] INT NULL
EXEC('UPDATE [T_ITEM_CATEGORY] SET [SORT]=[CATEGORY_CODE]')
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
   ELSE
 BEGIN
EXEC('UPDATE [T_ITEM_CATEGORY] SET [SORT]=[CATEGORY_CODE] WHERE SORT IS NULL')
 END





IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_ITEM_CATEGORY' AND [COLUMN_NAME] = N'SHOW_MENU')
BEGIN
  ALTER TABLE T_ITEM_CATEGORY ADD [SHOW_MENU] BIT NULL
  ALTER TABLE [dbo].[T_ITEM_CATEGORY] ADD  CONSTRAINT [DF_T_ITEM_CATEGORY_SHOW_MENU]  DEFAULT ((0)) FOR [SHOW_MENU]

END  
  





IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_ITEM_CATEGORY' AND [COLUMN_NAME] = N'CATEGORY_IMAGE_PATH')
BEGIN
  ALTER TABLE T_ITEM_CATEGORY ADD [CATEGORY_IMAGE_PATH] nvarchar(MAX) NULL

END  
   
    
   
IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_USERS' AND [COLUMN_NAME] = N'LOG_IN')
BEGIN
  ALTER TABLE T_USERS ADD [LOG_IN] BIT NULL

END  
   
IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_USERS' AND [COLUMN_NAME] = N'IS_ENC')
BEGIN
 --/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
  ALTER TABLE T_USERS ADD [IS_ENC] BIT NULL
 EXEC('UPDATE T_USERS SET [IS_ENC]=0')
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
END  

 IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_ITEMS' AND [COLUMN_NAME] = N'SHOW_MENU')
BEGIN
  ALTER TABLE T_ITEMS ADD [SHOW_MENU] BIT NULL
  ALTER TABLE [dbo].[T_ITEMS] ADD  CONSTRAINT [DF_T_ITEMS_SHOW_MENU]  DEFAULT ((0)) FOR [SHOW_MENU]
  END 
    
IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'KITCHEN_NOTE')
BEGIN
  ALTER TABLE T_SALES ADD [KITCHEN_NOTE] nvarchar(200) NULL
  
 END  
 
--////////////////////////////////////////////////////////////T_ITEMS/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_ITEMS' AND [COLUMN_NAME] = N'SELL_SALA')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_ITEMS ADD [SELL_SALA] FLOAT NULL
ALTER TABLE T_ITEMS ADD [SELL_DELEVERY] FLOAT NULL
ALTER TABLE T_ITEMS ADD [SELL_APP] FLOAT NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
   ELSE
 BEGIN

EXEC('UPDATE [T_ITEMS] SET [SELL_SALA]=SELL WHERE SELL_SALA IS NULL OR SELL_SALA=0 ')
EXEC('UPDATE [T_ITEMS] SET [SELL_DELEVERY]=SELL WHERE SELL_DELEVERY IS NULL OR SELL_DELEVERY=0')
EXEC('UPDATE [T_ITEMS] SET [SELL_APP]=SELL WHERE SELL_APP IS NULL OR SELL_APP=0')
 END
 --////////////////////////////////////////////////////////////T_PRINTER/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_PRINTER' AND [COLUMN_NAME] = N'IS_SCALE')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_PRINTER ADD [IS_SCALE] BIT NULL
EXEC('UPDATE [T_PRINTER] SET [IS_SCALE]=0')
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
   ELSE
 BEGIN
EXEC('UPDATE [T_PRINTER] SET [IS_SCALE]=0 WHERE IS_SCALE IS NULL')
 END
 

--////////////////////////////////////////////////////////////FINAL/////////////////////////////////////////////////////////////////////////////////////////////////////////
 BEGIN TRY
EXEC('UPDATE T_ITEMS SET BACK_COLOR='+N'#FFFFFFFF'+' WHERE BACK_COLOR=NULL OR LEN(RTRIM(LTRIM(BACK_COLOR)))=0')
EXEC('UPDATE T_ITEMS SET FONT_COLOR='+N'#FF000000'+' WHERE FONT_COLOR=NULL OR LEN(RTRIM(LTRIM(FONT_COLOR)))=0')

EXEC('UPDATE T_ITEM_CATEGORY SET BACK_COLOR='+N'#FFFFFFFF'+' WHERE BACK_COLOR=NULL OR LEN(RTRIM(LTRIM(BACK_COLOR)))=0')
EXEC('UPDATE T_ITEM_CATEGORY SET FONT_COLOR='+N'#000080'+' WHERE FONT_COLOR=NULL OR LEN(RTRIM(LTRIM(FONT_COLOR)))=0')

END TRY
BEGIN CATCH
   
END CATCH;

--////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'TIME_ACCEPT')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
EXEC('ALTER TABLE T_SALES ADD [TIME_ACCEPT] DATETIME NULL')
EXEC('ALTER TABLE T_SALES ADD [TIME_ARRIVED] DATETIME NULL')
EXEC('ALTER TABLE T_SALES ADD [ALL_TIME]  AS ((CONVERT([varchar](3),datediff(minute,[TIME_ACCEPT],[TIME_ARRIVED])/(60))+'':'')+right(''0''+CONVERT([varchar](2),datediff(minute,[TIME_ACCEPT],[TIME_ARRIVED])%(60)),(2)))')

COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  


--////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'TIME_ARRIVED')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
EXEC('ALTER TABLE T_SALES ADD [TIME_ARRIVED] DATETIME NULL')
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 

--////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////
IF  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'TIME_ARRIVED')
BEGIN
IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'ALL_TIME')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
EXEC('ALTER TABLE T_SALES ADD [ALL_TIME]  AS ((CONVERT([varchar](3),datediff(minute,[TIME_ACCEPT],[TIME_ARRIVED])/(60))+'':'')+right(''0''+CONVERT([varchar](2),datediff(minute,[TIME_ACCEPT],[TIME_ARRIVED])%(60)),(2)))')
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
END  


--////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'IS_DELEVERED_DRIVER')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES ADD [IS_DELEVERED_DRIVER] INT NULL
 ALTER TABLE [dbo].[T_SALES] ADD  CONSTRAINT [DF_T_SALES_IS_DELEVERED_DRIVER]  DEFAULT ((0)) FOR [IS_DELEVERED_DRIVER]
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
   ELSE
 BEGIN

EXEC('UPDATE [T_SALES] SET [IS_DELEVERED_DRIVER]=0 WHERE IS_DELEVERED_DRIVER IS NULL  ')
 
 END
 --////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'TO_DRIVER_TIME')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES ADD [TO_DRIVER_TIME] DATETIME NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 
  

  --////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'TO_DELEVERD_TIME')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES ADD [TO_DELEVERD_TIME] DATETIME NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 

  --////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'TO_CASH_TIME')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES ADD [TO_CASH_TIME] DATETIME NULL
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 

  --////////////////////////////////////////////////////////////T_SALES/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES' AND [COLUMN_NAME] = N'TO_CALL_TIME')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES ADD [TO_CALL_TIME] DATETIME NULL
ALTER TABLE [dbo].[T_SALES] ADD  CONSTRAINT [DF_T_SALES_TO_CALL_TIME]  DEFAULT (getdate()) FOR [TO_CALL_TIME]
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
 


--////////////////////////////////////////////////////////////T_SALES_TEMP/////////////////////////////////////////////////////////////////////////////////////////////////////////

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = N'T_SALES_TEMP' AND [COLUMN_NAME] = N'SEQ')
BEGIN
--/////////***** 
 SET XACT_ABORT ON     
BEGIN TRANSACTION
ALTER TABLE T_SALES_TEMP ADD [SEQ] INT NULL
 ALTER TABLE [dbo].[T_SALES_TEMP] ADD  CONSTRAINT [DF_T_SALES_TEMP_SEQ]  DEFAULT ((0)) FOR [SEQ]
COMMIT TRANSACTION
SET XACT_ABORT OFF 
 --/////////***** 
 END  
   ELSE
 BEGIN

EXEC('UPDATE [T_SALES_TEMP] SET [SEQ]=0 WHERE SEQ IS NULL  ')
 
 END

 
UPDATE T_PARAMETERS SET P_DESC=convert(varchar,@DATE_JOB , 111)  WHERE P_CODE=3


EXEC ('[P_CHECK_INSERT_COLUMNS]');
EXEC ('[P_CHECK_NAME_SPACE_UPDATE]');

SET @SUBMIT_FLAG=1

END 