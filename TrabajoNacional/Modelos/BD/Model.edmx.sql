
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/23/2023 01:38:54
-- Generated from EDMX file: C:\Users\jpgod\source\repos\TrabajoNacional\TrabajoNacional\Modelos\BD\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [TrabajoNacional_BD];
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

-- Creating table 'Rol'
CREATE TABLE [dbo].[Rol] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Nombre_Rol] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Requerimientos'
CREATE TABLE [dbo].[Requerimientos] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [Prioridad] nvarchar(max)  NOT NULL,
    [RolID] int  NOT NULL,
    [Tipo_RequerimientoID] int  NOT NULL,
    [EstadoID] int  NOT NULL
);
GO

-- Creating table 'Tipo_Requerimiento'
CREATE TABLE [dbo].[Tipo_Requerimiento] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Nombre_TipoReq] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Estado'
CREATE TABLE [dbo].[Estado] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Nombre_estado] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'UsuariosSet'
CREATE TABLE [dbo].[UsuariosSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Correo] nvarchar(max)  NOT NULL,
    [Contrasenia] nvarchar(max)  NOT NULL,
    [RolID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Rol'
ALTER TABLE [dbo].[Rol]
ADD CONSTRAINT [PK_Rol]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Requerimientos'
ALTER TABLE [dbo].[Requerimientos]
ADD CONSTRAINT [PK_Requerimientos]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Tipo_Requerimiento'
ALTER TABLE [dbo].[Tipo_Requerimiento]
ADD CONSTRAINT [PK_Tipo_Requerimiento]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Estado'
ALTER TABLE [dbo].[Estado]
ADD CONSTRAINT [PK_Estado]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Id] in table 'UsuariosSet'
ALTER TABLE [dbo].[UsuariosSet]
ADD CONSTRAINT [PK_UsuariosSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [RolID] in table 'Requerimientos'
ALTER TABLE [dbo].[Requerimientos]
ADD CONSTRAINT [FK_RolRequerimientos]
    FOREIGN KEY ([RolID])
    REFERENCES [dbo].[Rol]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RolRequerimientos'
CREATE INDEX [IX_FK_RolRequerimientos]
ON [dbo].[Requerimientos]
    ([RolID]);
GO

-- Creating foreign key on [RolID] in table 'UsuariosSet'
ALTER TABLE [dbo].[UsuariosSet]
ADD CONSTRAINT [FK_RolUsuarios]
    FOREIGN KEY ([RolID])
    REFERENCES [dbo].[Rol]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RolUsuarios'
CREATE INDEX [IX_FK_RolUsuarios]
ON [dbo].[UsuariosSet]
    ([RolID]);
GO

-- Creating foreign key on [Tipo_RequerimientoID] in table 'Requerimientos'
ALTER TABLE [dbo].[Requerimientos]
ADD CONSTRAINT [FK_Tipo_RequerimientoRequerimientos]
    FOREIGN KEY ([Tipo_RequerimientoID])
    REFERENCES [dbo].[Tipo_Requerimiento]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Tipo_RequerimientoRequerimientos'
CREATE INDEX [IX_FK_Tipo_RequerimientoRequerimientos]
ON [dbo].[Requerimientos]
    ([Tipo_RequerimientoID]);
GO

-- Creating foreign key on [EstadoID] in table 'Requerimientos'
ALTER TABLE [dbo].[Requerimientos]
ADD CONSTRAINT [FK_EstadoRequerimientos]
    FOREIGN KEY ([EstadoID])
    REFERENCES [dbo].[Estado]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EstadoRequerimientos'
CREATE INDEX [IX_FK_EstadoRequerimientos]
ON [dbo].[Requerimientos]
    ([EstadoID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------