USE [master]
GO
/****** Object:  Database [dbtaller]    Script Date: 7/06/2022 20:57:49 ******/
CREATE DATABASE [dbtaller]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbtaller', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbtaller.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbtaller_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbtaller_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbtaller] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbtaller].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbtaller] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbtaller] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbtaller] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbtaller] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbtaller] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbtaller] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbtaller] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbtaller] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbtaller] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbtaller] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbtaller] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbtaller] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbtaller] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbtaller] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbtaller] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbtaller] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbtaller] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbtaller] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbtaller] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbtaller] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbtaller] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbtaller] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbtaller] SET RECOVERY FULL 
GO
ALTER DATABASE [dbtaller] SET  MULTI_USER 
GO
ALTER DATABASE [dbtaller] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbtaller] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbtaller] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbtaller] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbtaller] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbtaller] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbtaller', N'ON'
GO
ALTER DATABASE [dbtaller] SET QUERY_STORE = OFF
GO
USE [dbtaller]
GO
/****** Object:  Table [dbo].[auto]    Script Date: 7/06/2022 20:57:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auto](
	[placa] [varchar](50) NULL,
	[marca] [varchar](50) NULL,
	[modelo] [varchar](50) NULL,
	[color] [varchar](50) NULL,
	[fabricacion] [int] NULL,
	[registro] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servicio]    Script Date: 7/06/2022 20:57:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicio](
	[codigo] [varchar](50) NULL,
	[tipo] [varchar](50) NULL,
	[precio] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SxA]    Script Date: 7/06/2022 20:57:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SxA](
	[placa] [varchar](50) NULL,
	[codigo] [varchar](50) NULL,
	[fecha_ingreso] [int] NULL,
	[fecha_salida] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[edit]    Script Date: 7/06/2022 20:57:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[edit]
@plac varchar(50),
@marc varchar(50),
@model varchar(50),
@colo varchar(50),
@fabricacio int, 
@registr int
as
update auto set marca=@marc, modelo=@model,color=@colo, fabricacion=@fabricacio, registro=@registr 
where placa=@plac
GO
/****** Object:  StoredProcedure [dbo].[eliminat]    Script Date: 7/06/2022 20:57:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminat]
@pla varchar(50)
as
delete from auto where placa=@pla
GO
/****** Object:  StoredProcedure [dbo].[insertarautos]    Script Date: 7/06/2022 20:57:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertarautos]
@placa varchar(50),
@marca varchar(50),
@modelo varchar(50),
@color varchar(50),
@fabricacion int, 
@registro int
as
insert into auto values (@placa,@marca,@modelo,@color,@fabricacion,@registro)
GO
/****** Object:  StoredProcedure [dbo].[insertarservicios]    Script Date: 7/06/2022 20:57:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertarservicios]
@codigo varchar(50),
@tipo varchar(50),
@precio int
as
insert into servicio values (@codigo,@tipo,@precio)
GO
/****** Object:  StoredProcedure [dbo].[insertarsxa]    Script Date: 7/06/2022 20:57:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertarsxa]
@placa varchar(50),
@codigo varchar(50),
@ingreso int,
@salida int
as
insert into SxA values (@placa,@codigo,@ingreso,@salida)
GO
/****** Object:  StoredProcedure [dbo].[listarautos]    Script Date: 7/06/2022 20:57:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listarautos]
as
select * from auto
GO
/****** Object:  StoredProcedure [dbo].[listarservicios]    Script Date: 7/06/2022 20:57:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listarservicios]
as
select * from servicio
GO
/****** Object:  StoredProcedure [dbo].[listarsxa]    Script Date: 7/06/2022 20:57:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listarsxa]
as
select * from SxA
GO
USE [master]
GO
ALTER DATABASE [dbtaller] SET  READ_WRITE 
GO
