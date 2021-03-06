USE [master]
GO
/****** Object:  Database [dbministerio]    Script Date: 7/06/2022 20:56:58 ******/
CREATE DATABASE [dbministerio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbministerio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbministerio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbministerio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbministerio_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbministerio] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbministerio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbministerio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbministerio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbministerio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbministerio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbministerio] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbministerio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbministerio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbministerio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbministerio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbministerio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbministerio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbministerio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbministerio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbministerio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbministerio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbministerio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbministerio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbministerio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbministerio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbministerio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbministerio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbministerio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbministerio] SET RECOVERY FULL 
GO
ALTER DATABASE [dbministerio] SET  MULTI_USER 
GO
ALTER DATABASE [dbministerio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbministerio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbministerio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbministerio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbministerio] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbministerio] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbministerio', N'ON'
GO
ALTER DATABASE [dbministerio] SET QUERY_STORE = OFF
GO
USE [dbministerio]
GO
/****** Object:  Table [dbo].[Empres]    Script Date: 7/06/2022 20:56:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empres](
	[Ruc] [char](11) NULL,
	[Distrito] [varchar](50) NULL,
	[Tipo] [varchar](50) NULL,
	[Fechaevaluacion] [varchar](50) NULL,
	[Resultado] [varchar](50) NULL,
	[Estado] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 7/06/2022 20:56:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[Ruc] [char](11) NULL,
	[Distrito] [varchar](50) NULL,
	[Tipo] [varchar](50) NULL,
	[Fechaevaluacion] [int] NULL,
	[Resultado] [varchar](50) NULL,
	[Estado] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[informe]    Script Date: 7/06/2022 20:56:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[informe](
	[id] [int] NOT NULL,
	[tipo_descuento] [varchar](50) NULL,
	[tiempo] [int] NULL,
	[tasa_nominal] [float] NULL,
	[tasa_efectiva] [float] NULL,
	[TCEA] [float] NULL,
	[valor_neto] [float] NULL,
	[valor_entregado] [float] NULL,
	[valor_recibido] [float] NULL,
	[rusuario_usuario] [int] NOT NULL,
 CONSTRAINT [PK_informe] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Monedero]    Script Date: 7/06/2022 20:56:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Monedero](
	[monedero] [int] NOT NULL,
	[usuario] [int] NOT NULL,
	[monto] [float] NULL,
	[moneda] [varchar](50) NULL,
 CONSTRAINT [PK_Monedero] PRIMARY KEY CLUSTERED 
(
	[monedero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rubro]    Script Date: 7/06/2022 20:56:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rubro](
	[Codigo] [char](6) NULL,
	[Descripcion] [varchar](50) NULL,
	[Categoria] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RubroXEmpresa]    Script Date: 7/06/2022 20:56:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RubroXEmpresa](
	[Codigo] [char](6) NULL,
	[Ruc] [char](11) NULL,
	[FechaInscripcion] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 7/06/2022 20:56:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[usuario] [int] NOT NULL,
	[nombres] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[dni] [int] NULL,
	[celular] [int] NULL,
	[contraseña] [varchar](50) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Empresa] ([Ruc], [Distrito], [Tipo], [Fechaevaluacion], [Resultado], [Estado]) VALUES (N'dsasda     ', N'sad', N'dssd', 212, N'dws', N'wasds')
GO
INSERT [dbo].[Rubro] ([Codigo], [Descripcion], [Categoria]) VALUES (N'dd    ', N'sads', N'das')
GO
ALTER TABLE [dbo].[Monedero]  WITH CHECK ADD  CONSTRAINT [FK_usuario] FOREIGN KEY([monedero])
REFERENCES [dbo].[Monedero] ([monedero])
GO
ALTER TABLE [dbo].[Monedero] CHECK CONSTRAINT [FK_usuario]
GO
/****** Object:  StoredProcedure [dbo].[edit]    Script Date: 7/06/2022 20:56:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[edit]
@ru char(11),
@distrit varchar(50),
@tip varchar(50),
@fech int,
@resultad varchar(50),
@estad varchar(50)
as
update Empresa set Distrito=@distrit, Tipo=@tip,Fechaevaluacion=@fech, Resultado=@resultad, Estado=@estad 
where Ruc=@ru

GO
/****** Object:  StoredProcedure [dbo].[eliminat]    Script Date: 7/06/2022 20:56:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[eliminat]
@fecha int 
as
delete from Empresa where Fechaevaluacion=@fecha
GO
/****** Object:  StoredProcedure [dbo].[insertarempresa]    Script Date: 7/06/2022 20:56:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertarempresa]
@ruc char(11),
@distrito varchar(50),
@tipo varchar(50),
@fecha int,
@resultado varchar(50),
@estado varchar(50)
as
insert into Empresa values (@ruc,@distrito,@tipo,@fecha,@resultado,@estado)
GO
/****** Object:  StoredProcedure [dbo].[insertarrubro]    Script Date: 7/06/2022 20:56:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertarrubro]
@c char(6),
@d varchar(50),
@ca varchar(50)
as
insert into Rubro values (@c,@d,@ca)
GO
/****** Object:  StoredProcedure [dbo].[listarempresa]    Script Date: 7/06/2022 20:56:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listarempresa]
as
select * from Empresa

GO
/****** Object:  StoredProcedure [dbo].[listarrubro]    Script Date: 7/06/2022 20:56:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listarrubro]
as
select * from Rubro
GO
USE [master]
GO
ALTER DATABASE [dbministerio] SET  READ_WRITE 
GO
