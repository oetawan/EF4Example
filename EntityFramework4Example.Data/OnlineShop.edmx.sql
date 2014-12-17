
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 12/17/2014 17:04:56
-- Generated from EDMX file: C:\Users\oetawan_c\Documents\Visual Studio 2013\EntityFramework4Example\EntityFramework4Example.Data\OnlineShop.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [OnlineShop];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[Items]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Items];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CustomerId] int IDENTITY(1,1) NOT NULL,
    [CustomerFirstName] nvarchar(max)  NOT NULL,
    [CustomerLastName] nvarchar(max)  NOT NULL,
    [CustomerAddress] nvarchar(max)  NOT NULL,
    [CustomerCity] nvarchar(max)  NOT NULL,
    [CustomerState] nvarchar(max)  NOT NULL,
    [CustomerZipCode] nvarchar(max)  NOT NULL,
    [CustomerPhone] nvarchar(max)  NOT NULL,
    [ModifyDateTime] datetime  NOT NULL
);
GO

-- Creating table 'Items'
CREATE TABLE [dbo].[Items] (
    [ItemId] int IDENTITY(1,1) NOT NULL,
    [ItemName] nvarchar(max)  NOT NULL,
    [ItemDescription] nvarchar(max)  NOT NULL,
    [ModifyDateTime] datetime  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [OrderId] int IDENTITY(1,1) NOT NULL,
    [ModifyDateTime] datetime  NOT NULL,
    [CustomerCustomerId] int  NOT NULL
);
GO

-- Creating table 'OrderItem'
CREATE TABLE [dbo].[OrderItem] (
    [Orders_OrderId] int  NOT NULL,
    [Items_ItemId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CustomerId] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CustomerId] ASC);
GO

-- Creating primary key on [ItemId] in table 'Items'
ALTER TABLE [dbo].[Items]
ADD CONSTRAINT [PK_Items]
    PRIMARY KEY CLUSTERED ([ItemId] ASC);
GO

-- Creating primary key on [OrderId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([OrderId] ASC);
GO

-- Creating primary key on [Orders_OrderId], [Items_ItemId] in table 'OrderItem'
ALTER TABLE [dbo].[OrderItem]
ADD CONSTRAINT [PK_OrderItem]
    PRIMARY KEY NONCLUSTERED ([Orders_OrderId], [Items_ItemId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerCustomerId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_Order_Customer]
    FOREIGN KEY ([CustomerCustomerId])
    REFERENCES [dbo].[Customers]
        ([CustomerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Order_Customer'
CREATE INDEX [IX_FK_Order_Customer]
ON [dbo].[Orders]
    ([CustomerCustomerId]);
GO

-- Creating foreign key on [Orders_OrderId] in table 'OrderItem'
ALTER TABLE [dbo].[OrderItem]
ADD CONSTRAINT [FK_OrderItem_Order]
    FOREIGN KEY ([Orders_OrderId])
    REFERENCES [dbo].[Orders]
        ([OrderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Items_ItemId] in table 'OrderItem'
ALTER TABLE [dbo].[OrderItem]
ADD CONSTRAINT [FK_OrderItem_Item]
    FOREIGN KEY ([Items_ItemId])
    REFERENCES [dbo].[Items]
        ([ItemId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderItem_Item'
CREATE INDEX [IX_FK_OrderItem_Item]
ON [dbo].[OrderItem]
    ([Items_ItemId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------