
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/08/2017 14:36:57
-- Generated from EDMX file: C:\Users\Ivan Grgurina\Source\Repos\camp-not-found\CampNotFound.Database\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [master];
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

-- Creating table 'AccountSet'
CREATE TABLE [dbo].[AccountSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EventSet'
CREATE TABLE [dbo].[EventSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Events_Id] int  NOT NULL,
    [Board_Id] int  NOT NULL,
    [Album_Id] int  NOT NULL,
    [Account_Id] int  NOT NULL
);
GO

-- Creating table 'VoteSet'
CREATE TABLE [dbo].[VoteSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(max)  NOT NULL,
    [Event_Id] int  NOT NULL
);
GO

-- Creating table 'CategorySet'
CREATE TABLE [dbo].[CategorySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'BoardSet'
CREATE TABLE [dbo].[BoardSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Account_Id] int  NOT NULL
);
GO

-- Creating table 'MessageSet'
CREATE TABLE [dbo].[MessageSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [UserId] nvarchar(max)  NOT NULL,
    [Board_Id] int  NOT NULL
);
GO

-- Creating table 'AlbumSet'
CREATE TABLE [dbo].[AlbumSet] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'PhotoSet'
CREATE TABLE [dbo].[PhotoSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Album_Id] int  NOT NULL
);
GO

-- Creating table 'UsersEventsSet'
CREATE TABLE [dbo].[UsersEventsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(max)  NOT NULL,
    [Event_Id] int  NOT NULL
);
GO

-- Creating table 'EventCategory'
CREATE TABLE [dbo].[EventCategory] (
    [Events_Id] int  NOT NULL,
    [Categories_Id] int  NOT NULL
);
GO

-- Creating table 'AccountCategory'
CREATE TABLE [dbo].[AccountCategory] (
    [Account_Id] int  NOT NULL,
    [Category_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'AccountSet'
ALTER TABLE [dbo].[AccountSet]
ADD CONSTRAINT [PK_AccountSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

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

-- Creating primary key on [Id] in table 'CategorySet'
ALTER TABLE [dbo].[CategorySet]
ADD CONSTRAINT [PK_CategorySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BoardSet'
ALTER TABLE [dbo].[BoardSet]
ADD CONSTRAINT [PK_BoardSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MessageSet'
ALTER TABLE [dbo].[MessageSet]
ADD CONSTRAINT [PK_MessageSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AlbumSet'
ALTER TABLE [dbo].[AlbumSet]
ADD CONSTRAINT [PK_AlbumSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PhotoSet'
ALTER TABLE [dbo].[PhotoSet]
ADD CONSTRAINT [PK_PhotoSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UsersEventsSet'
ALTER TABLE [dbo].[UsersEventsSet]
ADD CONSTRAINT [PK_UsersEventsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Events_Id], [Categories_Id] in table 'EventCategory'
ALTER TABLE [dbo].[EventCategory]
ADD CONSTRAINT [PK_EventCategory]
    PRIMARY KEY CLUSTERED ([Events_Id], [Categories_Id] ASC);
GO

-- Creating primary key on [Account_Id], [Category_Id] in table 'AccountCategory'
ALTER TABLE [dbo].[AccountCategory]
ADD CONSTRAINT [PK_AccountCategory]
    PRIMARY KEY CLUSTERED ([Account_Id], [Category_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

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

-- Creating foreign key on [Events_Id] in table 'EventCategory'
ALTER TABLE [dbo].[EventCategory]
ADD CONSTRAINT [FK_EventCategory_Event]
    FOREIGN KEY ([Events_Id])
    REFERENCES [dbo].[EventSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Categories_Id] in table 'EventCategory'
ALTER TABLE [dbo].[EventCategory]
ADD CONSTRAINT [FK_EventCategory_Category]
    FOREIGN KEY ([Categories_Id])
    REFERENCES [dbo].[CategorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EventCategory_Category'
CREATE INDEX [IX_FK_EventCategory_Category]
ON [dbo].[EventCategory]
    ([Categories_Id]);
GO

-- Creating foreign key on [Events_Id] in table 'EventSet'
ALTER TABLE [dbo].[EventSet]
ADD CONSTRAINT [FK_EventEvent]
    FOREIGN KEY ([Events_Id])
    REFERENCES [dbo].[EventSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EventEvent'
CREATE INDEX [IX_FK_EventEvent]
ON [dbo].[EventSet]
    ([Events_Id]);
GO

-- Creating foreign key on [Board_Id] in table 'EventSet'
ALTER TABLE [dbo].[EventSet]
ADD CONSTRAINT [FK_EventBoard]
    FOREIGN KEY ([Board_Id])
    REFERENCES [dbo].[BoardSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EventBoard'
CREATE INDEX [IX_FK_EventBoard]
ON [dbo].[EventSet]
    ([Board_Id]);
GO

-- Creating foreign key on [Album_Id] in table 'PhotoSet'
ALTER TABLE [dbo].[PhotoSet]
ADD CONSTRAINT [FK_AlbumPhoto]
    FOREIGN KEY ([Album_Id])
    REFERENCES [dbo].[AlbumSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AlbumPhoto'
CREATE INDEX [IX_FK_AlbumPhoto]
ON [dbo].[PhotoSet]
    ([Album_Id]);
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

-- Creating foreign key on [Album_Id] in table 'EventSet'
ALTER TABLE [dbo].[EventSet]
ADD CONSTRAINT [FK_EventAlbum]
    FOREIGN KEY ([Album_Id])
    REFERENCES [dbo].[AlbumSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EventAlbum'
CREATE INDEX [IX_FK_EventAlbum]
ON [dbo].[EventSet]
    ([Album_Id]);
GO

-- Creating foreign key on [Account_Id] in table 'BoardSet'
ALTER TABLE [dbo].[BoardSet]
ADD CONSTRAINT [FK_AccountBoard]
    FOREIGN KEY ([Account_Id])
    REFERENCES [dbo].[AccountSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountBoard'
CREATE INDEX [IX_FK_AccountBoard]
ON [dbo].[BoardSet]
    ([Account_Id]);
GO

-- Creating foreign key on [Account_Id] in table 'EventSet'
ALTER TABLE [dbo].[EventSet]
ADD CONSTRAINT [FK_AccountEvent]
    FOREIGN KEY ([Account_Id])
    REFERENCES [dbo].[AccountSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountEvent'
CREATE INDEX [IX_FK_AccountEvent]
ON [dbo].[EventSet]
    ([Account_Id]);
GO

-- Creating foreign key on [Account_Id] in table 'AccountCategory'
ALTER TABLE [dbo].[AccountCategory]
ADD CONSTRAINT [FK_AccountCategory_Account]
    FOREIGN KEY ([Account_Id])
    REFERENCES [dbo].[AccountSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Category_Id] in table 'AccountCategory'
ALTER TABLE [dbo].[AccountCategory]
ADD CONSTRAINT [FK_AccountCategory_Category]
    FOREIGN KEY ([Category_Id])
    REFERENCES [dbo].[CategorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountCategory_Category'
CREATE INDEX [IX_FK_AccountCategory_Category]
ON [dbo].[AccountCategory]
    ([Category_Id]);
GO

-- Creating foreign key on [Event_Id] in table 'UsersEventsSet'
ALTER TABLE [dbo].[UsersEventsSet]
ADD CONSTRAINT [FK_EventUsersEvents]
    FOREIGN KEY ([Event_Id])
    REFERENCES [dbo].[EventSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EventUsersEvents'
CREATE INDEX [IX_FK_EventUsersEvents]
ON [dbo].[UsersEventsSet]
    ([Event_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------