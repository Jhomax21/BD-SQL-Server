USE [master]
GO
/****** Object:  Database [dbAlquilerAutos]    Script Date: 21/11/2021 02:16:01 ******/
CREATE DATABASE [dbAlquilerAutos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbAlquilerAutos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbAlquilerAutos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbAlquilerAutos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbAlquilerAutos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbAlquilerAutos] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbAlquilerAutos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbAlquilerAutos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbAlquilerAutos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbAlquilerAutos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbAlquilerAutos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbAlquilerAutos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET RECOVERY FULL 
GO
ALTER DATABASE [dbAlquilerAutos] SET  MULTI_USER 
GO
ALTER DATABASE [dbAlquilerAutos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbAlquilerAutos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbAlquilerAutos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbAlquilerAutos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbAlquilerAutos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbAlquilerAutos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbAlquilerAutos', N'ON'
GO
ALTER DATABASE [dbAlquilerAutos] SET QUERY_STORE = OFF
GO
USE [dbAlquilerAutos]
GO
/****** Object:  Table [dbo].[Autos]    Script Date: 21/11/2021 02:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autos](
	[placa] [varchar](50) NULL,
	[codigo] [int] NULL,
	[marca] [varchar](50) NULL,
	[modelo] [varchar](50) NULL,
	[asientos] [int] NULL,
	[fabricacion] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oficinas]    Script Date: 21/11/2021 02:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oficinas](
	[codigo] [int] NULL,
	[ciudad] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [varchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Oficinas] ([codigo], [ciudad], [direccion], [telefono]) VALUES (NULL, NULL, NULL, NULL)
GO
/****** Object:  StoredProcedure [dbo].[edit]    Script Date: 21/11/2021 02:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[edit]
@plac varchar(50),
@codig int,
@marc varchar(50),
@model varchar(50),
@asiento int, 
@fabricacio int
as
update Autos set codigo=@codig, marca=@marc,modelo=@model, asientos=@asiento, fabricacion=@fabricacio 
where placa=@plac

GO
/****** Object:  StoredProcedure [dbo].[eliminat]    Script Date: 21/11/2021 02:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminat]
@codi int
as
delete from Autos where codigo=@codi
GO
/****** Object:  StoredProcedure [dbo].[insertarautos]    Script Date: 21/11/2021 02:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertarautos]
@placa varchar(50),
@codigo int,
@marca varchar(50),
@modelo varchar(50),
@asientos int, 
@fabricacion int
as
insert into Autos values (@placa,@codigo,@marca,@modelo,@asientos,@fabricacion)

GO
/****** Object:  StoredProcedure [dbo].[insertaroficinas]    Script Date: 21/11/2021 02:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertaroficinas]
@codigo int,
@ciudad varchar(50),
@direccion varchar(50),
@telefono varchar(50)
as
insert into Oficinas values (@codigo,@ciudad,@direccion,@telefono)
GO
/****** Object:  StoredProcedure [dbo].[listarautos]    Script Date: 21/11/2021 02:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listarautos]
as
select * from Autos
GO
/****** Object:  StoredProcedure [dbo].[listaroficinas]    Script Date: 21/11/2021 02:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listaroficinas]
as
select * from Oficinas
GO
USE [master]
GO
ALTER DATABASE [dbAlquilerAutos] SET  READ_WRITE 
GO
