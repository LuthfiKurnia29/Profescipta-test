/*
 Navicat Premium Dump SQL

 Source Server         : local
 Source Server Type    : SQL Server
 Source Server Version : 16001000 (16.00.1000)
 Source Host           : DESKTOP-PRD678V\SQLEXPRESS:1433
 Source Catalog        : Profescipta
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 16001000 (16.00.1000)
 File Encoding         : 65001

 Date: 04/01/2025 18:59:49
*/


-- ----------------------------
-- Table structure for __EFMigrationsHistory
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[__EFMigrationsHistory]') AND type IN ('U'))
	DROP TABLE [dbo].[__EFMigrationsHistory]
GO

CREATE TABLE [dbo].[__EFMigrationsHistory] (
  [MigrationId] nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ProductVersion] nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[__EFMigrationsHistory] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of __EFMigrationsHistory
-- ----------------------------
INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250103172925_Init', N'9.0.0')
GO


-- ----------------------------
-- Table structure for COM_CUSTOMER
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[COM_CUSTOMER]') AND type IN ('U'))
	DROP TABLE [dbo].[COM_CUSTOMER]
GO

CREATE TABLE [dbo].[COM_CUSTOMER] (
  [COM_CUSTOMER_ID] int  IDENTITY(1,1) NOT NULL,
  [CUSTOMER_NAME] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[COM_CUSTOMER] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of COM_CUSTOMER
-- ----------------------------
SET IDENTITY_INSERT [dbo].[COM_CUSTOMER] ON
GO

INSERT INTO [dbo].[COM_CUSTOMER] ([COM_CUSTOMER_ID], [CUSTOMER_NAME]) VALUES (N'1', N'Luthfi')
GO

INSERT INTO [dbo].[COM_CUSTOMER] ([COM_CUSTOMER_ID], [CUSTOMER_NAME]) VALUES (N'2', N'John')
GO

INSERT INTO [dbo].[COM_CUSTOMER] ([COM_CUSTOMER_ID], [CUSTOMER_NAME]) VALUES (N'3', N'Doe')
GO

SET IDENTITY_INSERT [dbo].[COM_CUSTOMER] OFF
GO


-- ----------------------------
-- Table structure for SO_ITEM
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SO_ITEM]') AND type IN ('U'))
	DROP TABLE [dbo].[SO_ITEM]
GO

CREATE TABLE [dbo].[SO_ITEM] (
  [SO_ITEM_ID] bigint  IDENTITY(1,1) NOT NULL,
  [SO_ORDER_ID] bigint  NOT NULL,
  [ITEM_NAME] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [QUANTITY] int  NOT NULL,
  [PRICE] real  NOT NULL
)
GO

ALTER TABLE [dbo].[SO_ITEM] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of SO_ITEM
-- ----------------------------
SET IDENTITY_INSERT [dbo].[SO_ITEM] ON
GO

INSERT INTO [dbo].[SO_ITEM] ([SO_ITEM_ID], [SO_ORDER_ID], [ITEM_NAME], [QUANTITY], [PRICE]) VALUES (N'3', N'2', N'Nugget', N'1', N'50000')
GO

INSERT INTO [dbo].[SO_ITEM] ([SO_ITEM_ID], [SO_ORDER_ID], [ITEM_NAME], [QUANTITY], [PRICE]) VALUES (N'4', N'2', N'Susu', N'1', N'5000')
GO

INSERT INTO [dbo].[SO_ITEM] ([SO_ITEM_ID], [SO_ORDER_ID], [ITEM_NAME], [QUANTITY], [PRICE]) VALUES (N'5', N'3', N'Susu', N'2', N'15000')
GO

INSERT INTO [dbo].[SO_ITEM] ([SO_ITEM_ID], [SO_ORDER_ID], [ITEM_NAME], [QUANTITY], [PRICE]) VALUES (N'6', N'3', N'Cokelat', N'1', N'25000')
GO

INSERT INTO [dbo].[SO_ITEM] ([SO_ITEM_ID], [SO_ORDER_ID], [ITEM_NAME], [QUANTITY], [PRICE]) VALUES (N'7', N'3', N'Sabun', N'1', N'4500')
GO

SET IDENTITY_INSERT [dbo].[SO_ITEM] OFF
GO


-- ----------------------------
-- Table structure for SO_ORDER
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SO_ORDER]') AND type IN ('U'))
	DROP TABLE [dbo].[SO_ORDER]
GO

CREATE TABLE [dbo].[SO_ORDER] (
  [SO_ORDER_ID] bigint  IDENTITY(1,1) NOT NULL,
  [ORDER_NO] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ORDER_DATE] datetime2(7)  NOT NULL,
  [COM_CUSTOMER_ID] int  NOT NULL,
  [ADDRESS] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[SO_ORDER] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of SO_ORDER
-- ----------------------------
SET IDENTITY_INSERT [dbo].[SO_ORDER] ON
GO

INSERT INTO [dbo].[SO_ORDER] ([SO_ORDER_ID], [ORDER_NO], [ORDER_DATE], [COM_CUSTOMER_ID], [ADDRESS]) VALUES (N'2', N'001', N'2025-01-05 00:00:00.0000000', N'1', N'Surabaya')
GO

INSERT INTO [dbo].[SO_ORDER] ([SO_ORDER_ID], [ORDER_NO], [ORDER_DATE], [COM_CUSTOMER_ID], [ADDRESS]) VALUES (N'3', N'002', N'2025-01-07 00:00:00.0000000', N'2', N'Malang')
GO

SET IDENTITY_INSERT [dbo].[SO_ORDER] OFF
GO


-- ----------------------------
-- Primary Key structure for table __EFMigrationsHistory
-- ----------------------------
ALTER TABLE [dbo].[__EFMigrationsHistory] ADD CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED ([MigrationId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for COM_CUSTOMER
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[COM_CUSTOMER]', RESEED, 3)
GO


-- ----------------------------
-- Primary Key structure for table COM_CUSTOMER
-- ----------------------------
ALTER TABLE [dbo].[COM_CUSTOMER] ADD CONSTRAINT [PK_COM_CUSTOMER] PRIMARY KEY CLUSTERED ([COM_CUSTOMER_ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for SO_ITEM
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[SO_ITEM]', RESEED, 7)
GO


-- ----------------------------
-- Indexes structure for table SO_ITEM
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_SO_ITEM_SO_ORDER_ID]
ON [dbo].[SO_ITEM] (
  [SO_ORDER_ID] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table SO_ITEM
-- ----------------------------
ALTER TABLE [dbo].[SO_ITEM] ADD CONSTRAINT [PK_SO_ITEM] PRIMARY KEY CLUSTERED ([SO_ITEM_ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for SO_ORDER
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[SO_ORDER]', RESEED, 4)
GO


-- ----------------------------
-- Indexes structure for table SO_ORDER
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_SO_ORDER_COM_CUSTOMER_ID]
ON [dbo].[SO_ORDER] (
  [COM_CUSTOMER_ID] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table SO_ORDER
-- ----------------------------
ALTER TABLE [dbo].[SO_ORDER] ADD CONSTRAINT [PK_SO_ORDER] PRIMARY KEY CLUSTERED ([SO_ORDER_ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table SO_ITEM
-- ----------------------------
ALTER TABLE [dbo].[SO_ITEM] ADD CONSTRAINT [FK_SO_ITEM_SO_ORDER_SO_ORDER_ID] FOREIGN KEY ([SO_ORDER_ID]) REFERENCES [dbo].[SO_ORDER] ([SO_ORDER_ID]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table SO_ORDER
-- ----------------------------
ALTER TABLE [dbo].[SO_ORDER] ADD CONSTRAINT [FK_SO_ORDER_COM_CUSTOMER_COM_CUSTOMER_ID] FOREIGN KEY ([COM_CUSTOMER_ID]) REFERENCES [dbo].[COM_CUSTOMER] ([COM_CUSTOMER_ID]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

