
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/09/2017 00:44:23
-- Generated from EDMX file: C:\Users\Ivan Grgurina\Source\Repos\camp-not-found\CampNotFound.Data\CampModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CampDb];
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

-- Creating table 'EventSet'
CREATE TABLE [dbo].[EventSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Price] decimal(18,0)  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NOT NULL,
    [User_Id] nvarchar(max)  NOT NULL,
    [CreatedBy] nvarchar(max)  NOT NULL,
    [LastModifiedBy] nvarchar(max)  NOT NULL,
    [CreatedDate] datetime  NOT NULL,
    [LastModifiedDate] datetime  NOT NULL,
    [Currency_Id] int  NOT NULL,
    [Camp_Id] int  NOT NULL,
    [Category_Id] int  NOT NULL,
    [ParentEvent_Id] int  NOT NULL
);
GO

-- Creating table 'VoteSet'
CREATE TABLE [dbo].[VoteSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Value] bit  NOT NULL,
    [User_Id] nvarchar(max)  NOT NULL,
    [CreatedBy] nvarchar(max)  NOT NULL,
    [LastModifiedBy] nvarchar(max)  NOT NULL,
    [CreatedDate] datetime  NOT NULL,
    [LastModifiedDate] datetime  NOT NULL,
    [Event_Id] int  NOT NULL
);
GO

-- Creating table 'MessageSet'
CREATE TABLE [dbo].[MessageSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [User_Id] nvarchar(max)  NOT NULL,
    [CreatedBy] nvarchar(max)  NOT NULL,
    [LastModifiedBy] nvarchar(max)  NOT NULL,
    [CreatedDate] datetime  NOT NULL,
    [LastModifiedDate] datetime  NOT NULL,
    [Board_Id] int  NOT NULL
);
GO

-- Creating table 'PhotoSet'
CREATE TABLE [dbo].[PhotoSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Link] nvarchar(max)  NOT NULL,
    [CreatedBy] nvarchar(max)  NOT NULL,
    [LastModifiedBy] nvarchar(max)  NOT NULL,
    [CreatedDate] datetime  NOT NULL,
    [LastModifiedDate] datetime  NOT NULL,
    [Album_Id] int  NOT NULL,
    [Event_Id] int  NOT NULL
);
GO

-- Creating table 'BoardSet'
CREATE TABLE [dbo].[BoardSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [CreatedBy] nvarchar(max)  NOT NULL,
    [LastModifiedBy] nvarchar(max)  NOT NULL,
    [CreatedDate] datetime  NOT NULL,
    [LastModifiedDate] datetime  NOT NULL,
    [Camp_Id] int  NOT NULL,
    [Events_Id] int  NOT NULL
);
GO

-- Creating table 'CampSet'
CREATE TABLE [dbo].[CampSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [CreatedBy] nvarchar(max)  NOT NULL,
    [LastModifiedBy] nvarchar(max)  NOT NULL,
    [CreatedDate] datetime  NOT NULL,
    [LastModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'CategorySet'
CREATE TABLE [dbo].[CategorySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CreatedBy] nvarchar(max)  NOT NULL,
    [LastModifiedBy] nvarchar(max)  NOT NULL,
    [CreatedDate] datetime  NOT NULL,
    [LastModifiedDate] datetime  NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'MemoryAlbumSet'
CREATE TABLE [dbo].[MemoryAlbumSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [User_Id] nvarchar(max)  NOT NULL,
    [CreatedBy] nvarchar(max)  NOT NULL,
    [LastModifiedBy] nvarchar(max)  NOT NULL,
    [CreatedDate] datetime  NOT NULL,
    [LastModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'CurrencySet'
CREATE TABLE [dbo].[CurrencySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ISOCode] nvarchar(max)  NOT NULL,
    [Country] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'EventSet'
ALTER TABLE [dbo].[EventSet]
ADD CONSTRAINT [PK_EventSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'VoteSet'
ALTER TABLE [dbo].[VoteSet]
ADD CONSTRAINT [PK_VoteSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MessageSet'
ALTER TABLE [dbo].[MessageSet]
ADD CONSTRAINT [PK_MessageSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PhotoSet'
ALTER TABLE [dbo].[PhotoSet]
ADD CONSTRAINT [PK_PhotoSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BoardSet'
ALTER TABLE [dbo].[BoardSet]
ADD CONSTRAINT [PK_BoardSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CampSet'
ALTER TABLE [dbo].[CampSet]
ADD CONSTRAINT [PK_CampSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CategorySet'
ALTER TABLE [dbo].[CategorySet]
ADD CONSTRAINT [PK_CategorySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MemoryAlbumSet'
ALTER TABLE [dbo].[MemoryAlbumSet]
ADD CONSTRAINT [PK_MemoryAlbumSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CurrencySet'
ALTER TABLE [dbo].[CurrencySet]
ADD CONSTRAINT [PK_CurrencySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Currency_Id] in table 'EventSet'
ALTER TABLE [dbo].[EventSet]
ADD CONSTRAINT [FK_CurrencyEvent]
    FOREIGN KEY ([Currency_Id])
    REFERENCES [dbo].[CurrencySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CurrencyEvent'
CREATE INDEX [IX_FK_CurrencyEvent]
ON [dbo].[EventSet]
    ([Currency_Id]);
GO

-- Creating foreign key on [Board_Id] in table 'MessageSet'
ALTER TABLE [dbo].[MessageSet]
ADD CONSTRAINT [FK_BoardMessage]
    FOREIGN KEY ([Board_Id])
    REFERENCES [dbo].[BoardSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BoardMessage'
CREATE INDEX [IX_FK_BoardMessage]
ON [dbo].[MessageSet]
    ([Board_Id]);
GO

-- Creating foreign key on [Camp_Id] in table 'BoardSet'
ALTER TABLE [dbo].[BoardSet]
ADD CONSTRAINT [FK_CampBoard]
    FOREIGN KEY ([Camp_Id])
    REFERENCES [dbo].[CampSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CampBoard'
CREATE INDEX [IX_FK_CampBoard]
ON [dbo].[BoardSet]
    ([Camp_Id]);
GO

-- Creating foreign key on [Event_Id] in table 'VoteSet'
ALTER TABLE [dbo].[VoteSet]
ADD CONSTRAINT [FK_EventVote]
    FOREIGN KEY ([Event_Id])
    REFERENCES [dbo].[EventSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EventVote'
CREATE INDEX [IX_FK_EventVote]
ON [dbo].[VoteSet]
    ([Event_Id]);
GO

-- Creating foreign key on [Camp_Id] in table 'EventSet'
ALTER TABLE [dbo].[EventSet]
ADD CONSTRAINT [FK_CampEvent]
    FOREIGN KEY ([Camp_Id])
    REFERENCES [dbo].[CampSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CampEvent'
CREATE INDEX [IX_FK_CampEvent]
ON [dbo].[EventSet]
    ([Camp_Id]);
GO

-- Creating foreign key on [Category_Id] in table 'EventSet'
ALTER TABLE [dbo].[EventSet]
ADD CONSTRAINT [FK_CategoryEvent]
    FOREIGN KEY ([Category_Id])
    REFERENCES [dbo].[CategorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryEvent'
CREATE INDEX [IX_FK_CategoryEvent]
ON [dbo].[EventSet]
    ([Category_Id]);
GO

-- Creating foreign key on [Album_Id] in table 'PhotoSet'
ALTER TABLE [dbo].[PhotoSet]
ADD CONSTRAINT [FK_AlbumPhoto]
    FOREIGN KEY ([Album_Id])
    REFERENCES [dbo].[MemoryAlbumSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AlbumPhoto'
CREATE INDEX [IX_FK_AlbumPhoto]
ON [dbo].[PhotoSet]
    ([Album_Id]);
GO

-- Creating foreign key on [ParentEvent_Id] in table 'EventSet'
ALTER TABLE [dbo].[EventSet]
ADD CONSTRAINT [FK_EventEvent]
    FOREIGN KEY ([ParentEvent_Id])
    REFERENCES [dbo].[EventSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EventEvent'
CREATE INDEX [IX_FK_EventEvent]
ON [dbo].[EventSet]
    ([ParentEvent_Id]);
GO

-- Creating foreign key on [Events_Id] in table 'BoardSet'
ALTER TABLE [dbo].[BoardSet]
ADD CONSTRAINT [FK_EventBoard]
    FOREIGN KEY ([Events_Id])
    REFERENCES [dbo].[EventSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EventBoard'
CREATE INDEX [IX_FK_EventBoard]
ON [dbo].[BoardSet]
    ([Events_Id]);
GO

-- Creating foreign key on [Event_Id] in table 'PhotoSet'
ALTER TABLE [dbo].[PhotoSet]
ADD CONSTRAINT [FK_EventPhoto]
    FOREIGN KEY ([Event_Id])
    REFERENCES [dbo].[EventSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EventPhoto'
CREATE INDEX [IX_FK_EventPhoto]
ON [dbo].[PhotoSet]
    ([Event_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------