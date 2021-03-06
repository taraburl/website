USE [master]
GO
/****** Object:  Database [sea]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  Table [dbo].[tbl_categoria]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[eliminado] [tinyint] NOT NULL,
 CONSTRAINT [PK_tbl_categoria] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_ciudad]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  Table [dbo].[tbl_imagenes]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_imagenes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[modulo] [varchar](50) NOT NULL,
	[eliminado] [tinyint] NOT NULL,
 CONSTRAINT [PK_tbl_imagenes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_pais]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  Table [dbo].[tbl_producto]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_producto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](200) NOT NULL,
	[precio] [float] NOT NULL,
	[medida] [varchar](50) NOT NULL,
	[idcategoria] [int] NOT NULL,
	[eliminado] [tinyint] NOT NULL,
 CONSTRAINT [PK_tbl_producto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_sponsors]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  Table [dbo].[tbl_usuarios]    Script Date: 25/08/2017 11:04:11 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_video]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_video](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [varchar](200) NOT NULL,
	[modulo] [varchar](50) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[eliminado] [tinyint] NOT NULL,
 CONSTRAINT [PK_tbl_video] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbl_categoria] ON 

INSERT [dbo].[tbl_categoria] ([id], [nombre], [eliminado]) VALUES (1, N'Prod', 0)
INSERT [dbo].[tbl_categoria] ([id], [nombre], [eliminado]) VALUES (2, N'Uniformes 2', 0)
INSERT [dbo].[tbl_categoria] ([id], [nombre], [eliminado]) VALUES (3, N'suplementos', 0)
INSERT [dbo].[tbl_categoria] ([id], [nombre], [eliminado]) VALUES (4, N'poleras', 0)
SET IDENTITY_INSERT [dbo].[tbl_categoria] OFF
SET IDENTITY_INSERT [dbo].[tbl_ciudad] ON 

INSERT [dbo].[tbl_ciudad] ([id], [nombre], [idpais]) VALUES (1, N'Santa Cruz', 1)
SET IDENTITY_INSERT [dbo].[tbl_ciudad] OFF
SET IDENTITY_INSERT [dbo].[tbl_imagenes] ON 

INSERT [dbo].[tbl_imagenes] ([id], [descripcion], [modulo], [eliminado]) VALUES (1, N'Evento Deportivo noqw', N'Academia de Fútbol', 1)
INSERT [dbo].[tbl_imagenes] ([id], [descripcion], [modulo], [eliminado]) VALUES (2, N'fexodeporte', N'Eventos', 1)
INSERT [dbo].[tbl_imagenes] ([id], [descripcion], [modulo], [eliminado]) VALUES (3, N'fec', N'Eventos', 1)
INSERT [dbo].[tbl_imagenes] ([id], [descripcion], [modulo], [eliminado]) VALUES (4, N'qwewqewqe', N'Academia de Fútbol', 0)
INSERT [dbo].[tbl_imagenes] ([id], [descripcion], [modulo], [eliminado]) VALUES (5, N'qwewqeqweqwewqe', N'Academia de Fútbol', 0)
INSERT [dbo].[tbl_imagenes] ([id], [descripcion], [modulo], [eliminado]) VALUES (6, N'wdwqeqwewqewqe', N'Academia de Fútbol', 0)
INSERT [dbo].[tbl_imagenes] ([id], [descripcion], [modulo], [eliminado]) VALUES (7, N'sdasdasdsad', N'Academia de Fútbol', 0)
INSERT [dbo].[tbl_imagenes] ([id], [descripcion], [modulo], [eliminado]) VALUES (8, N'asdsadasd', N'Academia de Fútbol', 0)
INSERT [dbo].[tbl_imagenes] ([id], [descripcion], [modulo], [eliminado]) VALUES (9, N'dfsadfsadfsdaf', N'Academia de Fútbol', 0)
INSERT [dbo].[tbl_imagenes] ([id], [descripcion], [modulo], [eliminado]) VALUES (10, N'asdfadfadsfadsf', N'Academia de Fútbol', 0)
SET IDENTITY_INSERT [dbo].[tbl_imagenes] OFF
SET IDENTITY_INSERT [dbo].[tbl_pais] ON 

INSERT [dbo].[tbl_pais] ([id], [nombre]) VALUES (1, N'Bolivia')
SET IDENTITY_INSERT [dbo].[tbl_pais] OFF
SET IDENTITY_INSERT [dbo].[tbl_producto] ON 

INSERT [dbo].[tbl_producto] ([id], [nombre], [descripcion], [precio], [medida], [idcategoria], [eliminado]) VALUES (1, N'producto', N'producto', 100, N'10', 1, 1)
INSERT [dbo].[tbl_producto] ([id], [nombre], [descripcion], [precio], [medida], [idcategoria], [eliminado]) VALUES (2, N'asdsd', N'asdasd', 10101010, N'10', 1, 0)
INSERT [dbo].[tbl_producto] ([id], [nombre], [descripcion], [precio], [medida], [idcategoria], [eliminado]) VALUES (3, N'ukglguil', N'adfaqf', 123, N'aeqre', 1, 0)
SET IDENTITY_INSERT [dbo].[tbl_producto] OFF
SET IDENTITY_INSERT [dbo].[tbl_sponsors] ON 

INSERT [dbo].[tbl_sponsors] ([id], [nombre], [modulo], [imageurl], [eliminado]) VALUES (1, N'Alianza', N'Academia de Fútbol', N'S/I', 0)
INSERT [dbo].[tbl_sponsors] ([id], [nombre], [modulo], [imageurl], [eliminado]) VALUES (2, N'El Cuartito', N'Eventos', N'S/I', 0)
INSERT [dbo].[tbl_sponsors] ([id], [nombre], [modulo], [imageurl], [eliminado]) VALUES (3, N'Malta Real', N'Academia de Fútbol', N'S/I', 0)
SET IDENTITY_INSERT [dbo].[tbl_sponsors] OFF
SET IDENTITY_INSERT [dbo].[tbl_usuarios] ON 

INSERT [dbo].[tbl_usuarios] ([id], [nombre], [apellidos], [email], [telefono], [celular], [direccion], [username], [password], [tipo], [imagem], [idCiudad], [eliminado]) VALUES (28, N'luis', N'Taraune', N'luis@gmail.com', N'', N'', N'', N'luis', N'123', N'Usuario Normal', N'images/profile.png', 1, 0)
INSERT [dbo].[tbl_usuarios] ([id], [nombre], [apellidos], [email], [telefono], [celular], [direccion], [username], [password], [tipo], [imagem], [idCiudad], [eliminado]) VALUES (31, N'AD', N'Administrador', N'luistj@gmail.com', N'3658910', N'7845211', N'', N'admin', N'123', N'Administrador', N'images/profile.png', 1, 0)
INSERT [dbo].[tbl_usuarios] ([id], [nombre], [apellidos], [email], [telefono], [celular], [direccion], [username], [password], [tipo], [imagem], [idCiudad], [eliminado]) VALUES (32, N'Pedro', N'Peres', N'pedro@hotmail.com', N'', N'', N'pedro', N'Av. Busch', N'123', N'Usuario Normal', N'images/profile.png', 1, 1)
INSERT [dbo].[tbl_usuarios] ([id], [nombre], [apellidos], [email], [telefono], [celular], [direccion], [username], [password], [tipo], [imagem], [idCiudad], [eliminado]) VALUES (33, N'juan', N'juan', N'juan@gmail.com', N'', N'', N'juan', N'', N'123', N'Administrador', N'images/profile.png', 1, 1)
INSERT [dbo].[tbl_usuarios] ([id], [nombre], [apellidos], [email], [telefono], [celular], [direccion], [username], [password], [tipo], [imagem], [idCiudad], [eliminado]) VALUES (39, N'osb', N'osb', N'info@osbolivia.com', N'', N'', N'', N'osb', N'123', N'Administrador', N'images/profile.png', 1, 1)
INSERT [dbo].[tbl_usuarios] ([id], [nombre], [apellidos], [email], [telefono], [celular], [direccion], [username], [password], [tipo], [imagem], [idCiudad], [eliminado]) VALUES (40, N'juan', N'juan', N'juan23@gmail.com', N'3555556', N'', N'', N'juan', N'123', N'Usuario Normal', N'images/profile.png', 1, 0)
INSERT [dbo].[tbl_usuarios] ([id], [nombre], [apellidos], [email], [telefono], [celular], [direccion], [username], [password], [tipo], [imagem], [idCiudad], [eliminado]) VALUES (41, N'dante', N'rojas', N'rojasldante@gmail.com', N'0', N'0', N'0', N'dantesillo', N'123456', N'Usuario Normal', N'images/profile.png', 1, 0)
INSERT [dbo].[tbl_usuarios] ([id], [nombre], [apellidos], [email], [telefono], [celular], [direccion], [username], [password], [tipo], [imagem], [idCiudad], [eliminado]) VALUES (42, N'a', N'b', N'ab@g.com', N'0', N'0', N'0', N'ab', N'123', N'Usuario Normal', N'images/profile.png', 1, 1)
INSERT [dbo].[tbl_usuarios] ([id], [nombre], [apellidos], [email], [telefono], [celular], [direccion], [username], [password], [tipo], [imagem], [idCiudad], [eliminado]) VALUES (43, N'ab', N'c', N'abc@g.com', N'', N'', N'', N'abc', N'123', N'Administrador', N'images/profile.png', 1, 0)
INSERT [dbo].[tbl_usuarios] ([id], [nombre], [apellidos], [email], [telefono], [celular], [direccion], [username], [password], [tipo], [imagem], [idCiudad], [eliminado]) VALUES (46, N'abc', N'd', N'd@g.com', N'', N'', N'', N'd', N'123', N'Administrador', N'images/profile.png', 1, 1)
SET IDENTITY_INSERT [dbo].[tbl_usuarios] OFF
SET IDENTITY_INSERT [dbo].[tbl_video] ON 

INSERT [dbo].[tbl_video] ([id], [url], [modulo], [descripcion], [eliminado]) VALUES (2, N'https://www.youtube.com/watch?v=ZxEpB8yooHQ', N'Academia de Fútbol', N'video got klop', 0)
INSERT [dbo].[tbl_video] ([id], [url], [modulo], [descripcion], [eliminado]) VALUES (3, N'https://www.youtube.com/watch?v=YwEk8Pf92mc', N'Academia de Fútbol', N'qwreqreqrqrqer', 0)
INSERT [dbo].[tbl_video] ([id], [url], [modulo], [descripcion], [eliminado]) VALUES (4, N'https://www.youtube.com/watch?v=yx9dRL1BCCQ', N'Academia de Fútbol', N'Academia de Fútbol', 0)
INSERT [dbo].[tbl_video] ([id], [url], [modulo], [descripcion], [eliminado]) VALUES (5, N'https://www.youtube.com/watch?v=oWnvMeS2m08', N'Academia de Fútbol', N'Academia de Fútbol', 0)
INSERT [dbo].[tbl_video] ([id], [url], [modulo], [descripcion], [eliminado]) VALUES (6, N'https://www.youtube.com/watch?v=EeMyN5RymYU', N'Academia de Fútbol', N'Academia de Fútbol', 0)
INSERT [dbo].[tbl_video] ([id], [url], [modulo], [descripcion], [eliminado]) VALUES (7, N'https://www.youtube.com/watch?v=Hilc28irl5k', N'Academia de Fútbol', N'Academia de Fútbol', 0)
INSERT [dbo].[tbl_video] ([id], [url], [modulo], [descripcion], [eliminado]) VALUES (8, N'https://www.youtube.com/watch?v=C5baSJMKkrg', N'Academia de Fútbol', N'Academia de Fútbol', 0)
SET IDENTITY_INSERT [dbo].[tbl_video] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_usua__AB6E6164D1C88E29]    Script Date: 25/08/2017 11:04:11 ******/
ALTER TABLE [dbo].[tbl_usuarios] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_usua__F3DBC572C7A93063]    Script Date: 25/08/2017 11:04:11 ******/
ALTER TABLE [dbo].[tbl_usuarios] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_ciudad]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ciudad_tbl_pais] FOREIGN KEY([idpais])
REFERENCES [dbo].[tbl_pais] ([id])
GO
ALTER TABLE [dbo].[tbl_ciudad] CHECK CONSTRAINT [FK_tbl_ciudad_tbl_pais]
GO
ALTER TABLE [dbo].[tbl_producto]  WITH CHECK ADD  CONSTRAINT [FK_tbl_producto_tbl_categoria] FOREIGN KEY([idcategoria])
REFERENCES [dbo].[tbl_categoria] ([id])
GO
ALTER TABLE [dbo].[tbl_producto] CHECK CONSTRAINT [FK_tbl_producto_tbl_categoria]
GO
ALTER TABLE [dbo].[tbl_usuarios]  WITH CHECK ADD FOREIGN KEY([idCiudad])
REFERENCES [dbo].[tbl_ciudad] ([id])
GO
/****** Object:  StoredProcedure [dbo].[sp_categoriaDelete]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_categoriaDelete]
(
	@Original_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tbl_categoria] WHERE (([id] = @Original_id))
GO
/****** Object:  StoredProcedure [dbo].[sp_categoriaDeleteState]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_categoriaDeleteState]
(
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE tbl_categoria
SET          eliminado = 1
WHERE  (id = @id)

GO
/****** Object:  StoredProcedure [dbo].[sp_categoriaInsert]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_categoriaInsert]
(
	@nombre varchar(50),
	@eliminado tinyint
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tbl_categoria] ([nombre], [eliminado]) VALUES (@nombre, @eliminado);
	
SELECT id, nombre, eliminado FROM tbl_categoria WHERE (id = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[sp_CategoriaSelect]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CategoriaSelect]
AS
	SET NOCOUNT ON;
SELECT id, nombre, eliminado
FROM     tbl_categoria
GO
/****** Object:  StoredProcedure [dbo].[sp_categoriaSelectById]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_categoriaSelectById]
(
	@id int
)
AS
	SET NOCOUNT ON;
SELECT id, nombre, eliminado
FROM     tbl_categoria
WHERE  (id = @id)

GO
/****** Object:  StoredProcedure [dbo].[sp_categoriaSelectNoEliminados]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_categoriaSelectNoEliminados]
AS
	SET NOCOUNT ON;
SELECT id, nombre, eliminado
FROM     tbl_categoria
WHERE  (eliminado = 0)
GO
/****** Object:  StoredProcedure [dbo].[sp_categoriaUpdate]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_categoriaUpdate]
(
	@nombre varchar(50),
	@eliminado tinyint,
	@Original_id int,
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE [tbl_categoria] SET [nombre] = @nombre, [eliminado] = @eliminado WHERE (([id] = @Original_id));
	
SELECT id, nombre, eliminado FROM tbl_categoria WHERE (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[sp_imagenDelete]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_imagenDelete]
(
	@Original_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tbl_imagenes] WHERE (([id] = @Original_id))
GO
/****** Object:  StoredProcedure [dbo].[sp_imagenDeleteState]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_imagenDeleteState]
(
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE tbl_imagenes
SET          eliminado = 1
WHERE  (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[sp_imagenInsert]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_imagenInsert]
(
	@descripcion varchar(100),
	@modulo varchar(50),
	@eliminado tinyint
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tbl_imagenes] ([descripcion], [modulo], [eliminado]) VALUES (@descripcion, @modulo, @eliminado);
	
SELECT id, descripcion, modulo, eliminado FROM tbl_imagenes WHERE (id = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[sp_imagenNoEliminados]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_imagenNoEliminados]
AS
	SET NOCOUNT ON;
SELECT id, descripcion, modulo, eliminado
FROM     tbl_imagenes
WHERE  (eliminado = 0)
GO
/****** Object:  StoredProcedure [dbo].[sp_imagenSelect]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_imagenSelect]
AS
	SET NOCOUNT ON;
SELECT id, descripcion, modulo, eliminado
FROM     tbl_imagenes
GO
/****** Object:  StoredProcedure [dbo].[sp_imagenSelectById]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_imagenSelectById]
(
	@id int
)
AS
	SET NOCOUNT ON;
SELECT descripcion, modulo, eliminado, id
FROM     tbl_imagenes
WHERE  (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[sp_imagenSelectByModulo]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_imagenSelectByModulo]
(
	@modulo varchar(50)
)
AS
	SET NOCOUNT ON;
SELECT id, descripcion, modulo, eliminado
FROM     tbl_imagenes
WHERE  (modulo = @modulo)
GO
/****** Object:  StoredProcedure [dbo].[sp_imagenUpdate]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_imagenUpdate]
(
	@descripcion varchar(100),
	@modulo varchar(50),
	@eliminado tinyint,
	@Original_id int,
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE [tbl_imagenes] SET [descripcion] = @descripcion, [modulo] = @modulo, [eliminado] = @eliminado WHERE (([id] = @Original_id));
	
SELECT id, descripcion, modulo, eliminado FROM tbl_imagenes WHERE (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[sp_productoDelete]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_productoDelete]
(
	@Original_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tbl_producto] WHERE (([id] = @Original_id))
GO
/****** Object:  StoredProcedure [dbo].[sp_productoDeleteState]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_productoDeleteState]
(
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE tbl_producto
SET          eliminado = 1
WHERE  (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[sp_productoInsert]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_productoInsert]
(
	@descripcion varchar(200),
	@nombre varchar(50),
	@precio float,
	@medida varchar(50),
	@idcategoria int,
	@eliminado tinyint
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tbl_producto] ([descripcion], [nombre], [precio], [medida], [idcategoria], [eliminado]) VALUES (@descripcion, @nombre, @precio, @medida, @idcategoria, @eliminado);
	
SELECT id, descripcion, nombre, precio, medida, idcategoria, eliminado FROM tbl_producto WHERE (id = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[sp_productoSelect]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_productoSelect]
AS
	SET NOCOUNT ON;
SELECT id, descripcion, nombre, precio, medida, idcategoria, eliminado
FROM     tbl_producto
GO
/****** Object:  StoredProcedure [dbo].[sp_productoSelectByCategoria]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_productoSelectByCategoria]
(
	@idcategoria int
)
AS
	SET NOCOUNT ON;
SELECT id, nombre, descripcion, precio, medida, idcategoria, eliminado
FROM     tbl_producto
WHERE  (idcategoria = @idcategoria) and (eliminado = 0)

GO
/****** Object:  StoredProcedure [dbo].[sp_productoSelectById]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_productoSelectById]
(
	@id int
)
AS
	SET NOCOUNT ON;
SELECT id, nombre, descripcion, precio, medida, idcategoria, eliminado
FROM     tbl_producto
WHERE  (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[sp_productoSelectNoEliminados]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_productoSelectNoEliminados]
AS
	SET NOCOUNT ON;
SELECT id, nombre, descripcion, precio, medida, idcategoria, eliminado
FROM     tbl_producto
WHERE  (eliminado = 0)
GO
/****** Object:  StoredProcedure [dbo].[sp_productoUpdate]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_productoUpdate]
(
	@descripcion varchar(200),
	@nombre varchar(50),
	@precio float,
	@medida varchar(50),
	@idcategoria int,
	@eliminado tinyint,
	@Original_id int,
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE [tbl_producto] SET [descripcion] = @descripcion, [nombre] = @nombre, [precio] = @precio, [medida] = @medida, [idcategoria] = @idcategoria, [eliminado] = @eliminado WHERE (([id] = @Original_id));
	
SELECT id, descripcion, nombre, precio, medida, idcategoria, eliminado FROM tbl_producto WHERE (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[sp_sponsorDeleteState]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sponsorsDelete]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sponsorsInsert]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sponsorsNoEliminados]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sponsorsSelectAll]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sponsorsSelectById]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sponsorsSelectByModulo]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_sponsorsUpdate]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_userDelete]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_userInsert]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_usersDeleteState]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_userSelectAll]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_userSelectById]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_userSelectByUsernamePassword]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_userSelectNoEliminados]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UserUpdate]    Script Date: 25/08/2017 11:04:11 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_videoDelete]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_videoDelete]
(
	@Original_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tbl_video] WHERE (([id] = @Original_id))
GO
/****** Object:  StoredProcedure [dbo].[sp_videoDeleteState]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_videoDeleteState]
(
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE tbl_video
SET          eliminado = 1
WHERE  (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[sp_videoInsert]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_videoInsert]
(
	@url varchar(50),
	@modulo varchar(50),
	@descripcion varchar(100),
	@eliminado tinyint
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tbl_video] ([url], [modulo], [descripcion], [eliminado]) VALUES (@url, @modulo, @descripcion, @eliminado);
	
SELECT id, url, modulo, descripcion, eliminado FROM tbl_video WHERE (id = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[sp_videoNoEliminados]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_videoNoEliminados]
AS
	SET NOCOUNT ON;
SELECT id, url, modulo, descripcion, eliminado
FROM     tbl_video
WHERE  (eliminado = 0)
GO
/****** Object:  StoredProcedure [dbo].[sp_videoSelect]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_videoSelect]
AS
	SET NOCOUNT ON;
SELECT id, url, modulo, descripcion, eliminado
FROM     tbl_video
GO
/****** Object:  StoredProcedure [dbo].[sp_videoSelectById]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_videoSelectById]
(
	@id int
)
AS
	SET NOCOUNT ON;
SELECT id, url, modulo, descripcion, eliminado
FROM     tbl_video
WHERE  (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[sp_videoSelectByModulo]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_videoSelectByModulo]
(
	@modulo varchar(50)
)
AS
	SET NOCOUNT ON;
SELECT id, url, descripcion, modulo, eliminado
FROM     tbl_video
WHERE  (modulo = @modulo)
GO
/****** Object:  StoredProcedure [dbo].[sp_videoUpdate]    Script Date: 25/08/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_videoUpdate]
(
	@url varchar(50),
	@modulo varchar(50),
	@descripcion varchar(100),
	@eliminado tinyint,
	@Original_id int,
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE [tbl_video] SET [url] = @url, [modulo] = @modulo, [descripcion] = @descripcion, [eliminado] = @eliminado WHERE (([id] = @Original_id));
	
SELECT id, url, modulo, descripcion, eliminado FROM tbl_video WHERE (id = @id)
GO
USE [master]
GO
ALTER DATABASE [sea] SET  READ_WRITE 
GO
