USE [master]
GO
/****** Object:  Database [sea]    Script Date: 09/08/2017 14:20:27 ******/
CREATE DATABASE [sea]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sea', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\sea.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sea_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\sea_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [sea] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sea].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sea] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sea] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sea] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sea] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sea] SET ARITHABORT OFF 
GO
ALTER DATABASE [sea] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sea] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sea] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sea] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sea] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sea] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sea] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sea] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sea] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sea] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sea] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sea] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sea] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sea] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sea] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sea] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sea] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sea] SET RECOVERY FULL 
GO
ALTER DATABASE [sea] SET  MULTI_USER 
GO
ALTER DATABASE [sea] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sea] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sea] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sea] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sea] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'sea', N'ON'
GO
ALTER DATABASE [sea] SET QUERY_STORE = OFF
GO
USE [sea]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [sea]
GO
/****** Object:  Table [dbo].[tbl_ciudad]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ciudad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[idpais] [int] NOT NULL,
 CONSTRAINT [PK_tbl_ciudad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_pais]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pais](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_pais] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_sponsors]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_sponsors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[modulo] [varchar](50) NOT NULL,
	[imageurl] [varchar](100) NOT NULL,
	[eliminado] [tinyint] NOT NULL,
 CONSTRAINT [PK_tbl_sponsors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_usuarios]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NULL,
	[celular] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[username] [varchar](30) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
	[imagem] [varchar](50) NULL,
	[idCiudad] [int] NULL,
	[eliminado] [int] NOT NULL,
 CONSTRAINT [PK_tbl_usrs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tbl_ciudad]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ciudad_tbl_pais] FOREIGN KEY([idpais])
REFERENCES [dbo].[tbl_pais] ([id])
GO
ALTER TABLE [dbo].[tbl_ciudad] CHECK CONSTRAINT [FK_tbl_ciudad_tbl_pais]
GO
ALTER TABLE [dbo].[tbl_usuarios]  WITH CHECK ADD FOREIGN KEY([idCiudad])
REFERENCES [dbo].[tbl_ciudad] ([id])
GO
/****** Object:  StoredProcedure [dbo].[sp_sponsorDeleteState]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_sponsorDeleteState]
(
	@id int
)
AS
	SET NOCOUNT ON;
UPDATE tbl_sponsors
SET          eliminado = 1
WHERE  (id = @id)

GO
/****** Object:  StoredProcedure [dbo].[sp_sponsorsDelete]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sponsorsDelete]
(
	@Original_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tbl_sponsors] WHERE (([id] = @Original_id))
GO
/****** Object:  StoredProcedure [dbo].[sp_sponsorsInsert]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sponsorsInsert]
(
	@nombre varchar(50),
	@modulo varchar(50),
	@imageurl varchar(100),
	@eliminado tinyint
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tbl_sponsors] ([nombre], [modulo], [imageurl], [eliminado]) VALUES (@nombre, @modulo, @imageurl, @eliminado);
	
SELECT id, nombre, modulo, imageurl, eliminado FROM tbl_sponsors WHERE (id = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[sp_sponsorsNoEliminados]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sponsorsNoEliminados]
AS
	SET NOCOUNT ON;
SELECT id, nombre, modulo, imageurl, eliminado
FROM     tbl_sponsors
WHERE  (eliminado = 0)
GO
/****** Object:  StoredProcedure [dbo].[sp_sponsorsSelectAll]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_sponsorsSelectAll]
AS
	SET NOCOUNT ON;
SELECT id, nombre, modulo, imageurl, eliminado
FROM     tbl_sponsors


GO
/****** Object:  StoredProcedure [dbo].[sp_sponsorsSelectById]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sponsorsSelectById]
(
	@id int
)
AS
	SET NOCOUNT ON;
SELECT id, nombre, modulo, imageurl, eliminado
FROM     tbl_sponsors
WHERE  (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[sp_sponsorsSelectByModulo]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sponsorsSelectByModulo]
(
	@modulo varchar(50)
)
AS
	SET NOCOUNT ON;
SELECT id, nombre, modulo, imageurl, eliminado
FROM     tbl_sponsors
WHERE  (modulo = @modulo)
GO
/****** Object:  StoredProcedure [dbo].[sp_sponsorsUpdate]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sponsorsUpdate]
(
	@nombre varchar(50),
	@modulo varchar(50),
	@imageurl varchar(100),
	@eliminado tinyint,
	@Original_id int,
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE [tbl_sponsors] SET [nombre] = @nombre, [modulo] = @modulo, [imageurl] = @imageurl, [eliminado] = @eliminado WHERE (([id] = @Original_id));
	
SELECT id, nombre, modulo, imageurl, eliminado FROM tbl_sponsors WHERE (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[sp_userDelete]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_userDelete]
(
	@Original_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tbl_usuarios] WHERE (([id] = @Original_id))
GO
/****** Object:  StoredProcedure [dbo].[sp_userInsert]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_userInsert]
(
	@nombre varchar(50),
	@apellidos varchar(50),
	@email varchar(50),
	@telefono varchar(50),
	@celular varchar(50),
	@username varchar(30),
	@direccion varchar(50),
	@password varchar(30),
	@tipo varchar(50),
	@imagem varchar(50),
	@idCiudad int,
	@eliminado int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tbl_usuarios] ([nombre], [apellidos], [email], [telefono], [celular], [username], [direccion], [password], [tipo], [imagem], [idCiudad], [eliminado]) VALUES (@nombre, @apellidos, @email, @telefono, @celular, @username, @direccion, @password, @tipo, @imagem, @idCiudad, @eliminado);
	
SELECT id, nombre, apellidos, email, telefono, celular, username, direccion, password, tipo, imagem, idCiudad, eliminado FROM tbl_usuarios WHERE (id = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[sp_usersDeleteState]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_usersDeleteState]
(
	@id int
)
AS
	SET NOCOUNT ON;
UPDATE tbl_usuarios
SET          eliminado = 1
WHERE  (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[sp_userSelectAll]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_userSelectAll]
AS
	SET NOCOUNT ON;
SELECT id, nombre, apellidos, email, telefono, celular, username, direccion, password, tipo, imagem, idCiudad, eliminado
FROM     tbl_usuarios
GO
/****** Object:  StoredProcedure [dbo].[sp_userSelectById]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_userSelectById]
(
	@id int
)
AS
	SET NOCOUNT ON;
SELECT id, nombre, apellidos, email, telefono, celular, direccion, username, password, tipo, imagem, idCiudad, eliminado
FROM     tbl_usuarios
WHERE  (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[sp_userSelectByUsernamePassword]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_userSelectByUsernamePassword]
(
	@username varchar(30),
	@password varchar(30)
)
AS
	SET NOCOUNT ON;
SELECT id, nombre, apellidos, email, telefono, celular, direccion, username, password, tipo, imagem, idCiudad, eliminado
FROM     tbl_usuarios
WHERE  (username = @username) AND (password = @password) AND (eliminado = 0)

GO
/****** Object:  StoredProcedure [dbo].[sp_userSelectNoEliminados]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_userSelectNoEliminados]
AS
	SET NOCOUNT ON;
SELECT id, nombre, email, apellidos, telefono, celular, direccion, username, password, tipo, imagem, idCiudad, eliminado
FROM     tbl_usuarios
WHERE  (eliminado = 0)
GO
/****** Object:  StoredProcedure [dbo].[sp_UserUpdate]    Script Date: 09/08/2017 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UserUpdate]
(
	@nombre varchar(50),
	@apellidos varchar(50),
	@email varchar(50),
	@telefono varchar(50),
	@celular varchar(50),
	@username varchar(30),
	@direccion varchar(50),
	@password varchar(30),
	@tipo varchar(50),
	@imagem varchar(50),
	@idCiudad int,
	@eliminado int,
	@Original_id int,
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE [tbl_usuarios] SET [nombre] = @nombre, [apellidos] = @apellidos, [email] = @email, [telefono] = @telefono, [celular] = @celular, [username] = @username, [direccion] = @direccion, [password] = @password, [tipo] = @tipo, [imagem] = @imagem, [idCiudad] = @idCiudad, [eliminado] = @eliminado WHERE (([id] = @Original_id));
	
SELECT id, nombre, apellidos, email, telefono, celular, username, direccion, password, tipo, imagem, idCiudad, eliminado FROM tbl_usuarios WHERE (id = @id)
GO
USE [master]
GO
ALTER DATABASE [sea] SET  READ_WRITE 
GO
