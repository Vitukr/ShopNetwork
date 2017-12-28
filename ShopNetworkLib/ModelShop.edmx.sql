
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/28/2017 00:30:37
-- Generated from EDMX file: C:\Users\Vit\Documents\Visual Studio 2015\Projects\ShopNetwork\ShopNetworkLib\ModelShop.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [shoplab];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Price] int  NOT NULL,
    [PriceCard] int  NOT NULL,
    [Buyer_Id] int  NOT NULL
);
GO

-- Creating table 'Buyers'
CREATE TABLE [dbo].[Buyers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Cards'
CREATE TABLE [dbo].[Cards] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [HolderName] nvarchar(max)  NOT NULL,
    [Buyer_Id] int  NOT NULL
);
GO

-- Creating table 'Sellers'
CREATE TABLE [dbo].[Sellers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Products_ProdProduct'
CREATE TABLE [dbo].[Products_ProdProduct] (
    [ExpireDate] datetime  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Products_PromProduct'
CREATE TABLE [dbo].[Products_PromProduct] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'SellerBuyer'
CREATE TABLE [dbo].[SellerBuyer] (
    [Sellers_Id] int  NOT NULL,
    [Buyers_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Buyers'
ALTER TABLE [dbo].[Buyers]
ADD CONSTRAINT [PK_Buyers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cards'
ALTER TABLE [dbo].[Cards]
ADD CONSTRAINT [PK_Cards]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Sellers'
ALTER TABLE [dbo].[Sellers]
ADD CONSTRAINT [PK_Sellers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Products_ProdProduct'
ALTER TABLE [dbo].[Products_ProdProduct]
ADD CONSTRAINT [PK_Products_ProdProduct]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Products_PromProduct'
ALTER TABLE [dbo].[Products_PromProduct]
ADD CONSTRAINT [PK_Products_PromProduct]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Sellers_Id], [Buyers_Id] in table 'SellerBuyer'
ALTER TABLE [dbo].[SellerBuyer]
ADD CONSTRAINT [PK_SellerBuyer]
    PRIMARY KEY CLUSTERED ([Sellers_Id], [Buyers_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Buyer_Id] in table 'Cards'
ALTER TABLE [dbo].[Cards]
ADD CONSTRAINT [FK_BuyerCard]
    FOREIGN KEY ([Buyer_Id])
    REFERENCES [dbo].[Buyers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BuyerCard'
CREATE INDEX [IX_FK_BuyerCard]
ON [dbo].[Cards]
    ([Buyer_Id]);
GO

-- Creating foreign key on [Buyer_Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_BuyerProduct]
    FOREIGN KEY ([Buyer_Id])
    REFERENCES [dbo].[Buyers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BuyerProduct'
CREATE INDEX [IX_FK_BuyerProduct]
ON [dbo].[Products]
    ([Buyer_Id]);
GO

-- Creating foreign key on [Sellers_Id] in table 'SellerBuyer'
ALTER TABLE [dbo].[SellerBuyer]
ADD CONSTRAINT [FK_SellerBuyer_Seller]
    FOREIGN KEY ([Sellers_Id])
    REFERENCES [dbo].[Sellers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Buyers_Id] in table 'SellerBuyer'
ALTER TABLE [dbo].[SellerBuyer]
ADD CONSTRAINT [FK_SellerBuyer_Buyer]
    FOREIGN KEY ([Buyers_Id])
    REFERENCES [dbo].[Buyers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SellerBuyer_Buyer'
CREATE INDEX [IX_FK_SellerBuyer_Buyer]
ON [dbo].[SellerBuyer]
    ([Buyers_Id]);
GO

-- Creating foreign key on [Id] in table 'Products_ProdProduct'
ALTER TABLE [dbo].[Products_ProdProduct]
ADD CONSTRAINT [FK_ProdProduct_inherits_Product]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Products_PromProduct'
ALTER TABLE [dbo].[Products_PromProduct]
ADD CONSTRAINT [FK_PromProduct_inherits_Product]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------