USE [master]
GO

CREATE DATABASE [BDTrabjoFinal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDTrabjoFinal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BDTrabjoFinal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDTrabjoFinal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BDTrabjoFinal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BDTrabjoFinal] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDTrabjoFinal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDTrabjoFinal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDTrabjoFinal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDTrabjoFinal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDTrabjoFinal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDTrabjoFinal] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDTrabjoFinal] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BDTrabjoFinal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDTrabjoFinal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDTrabjoFinal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDTrabjoFinal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDTrabjoFinal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDTrabjoFinal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDTrabjoFinal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDTrabjoFinal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDTrabjoFinal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BDTrabjoFinal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDTrabjoFinal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDTrabjoFinal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDTrabjoFinal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDTrabjoFinal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDTrabjoFinal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDTrabjoFinal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDTrabjoFinal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDTrabjoFinal] SET  MULTI_USER 
GO
ALTER DATABASE [BDTrabjoFinal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDTrabjoFinal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDTrabjoFinal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDTrabjoFinal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDTrabjoFinal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDTrabjoFinal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BDTrabjoFinal] SET QUERY_STORE = OFF
GO
USE [BDTrabjoFinal]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARRITO](
	[IDPEDIDO] [int] IDENTITY(1,1) NOT NULL,
	[TIPO_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPEDIDO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroPago](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TipoTarjeta] [varchar](50) NULL,
	[Titular] [varchar](50) NULL,
	[NumTarjeta] [int] NULL,
	[PagoTotal] [float] NULL,
 CONSTRAINT [PK_RegistroPago] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TablaMenu](
	[Id_Tipo] [int] IDENTITY(1,1) NOT NULL,
	[TipoDescripcion] [varchar](150) NULL,
	[Precio] [float] NULL,
 CONSTRAINT [PK_TablaMenu] PRIMARY KEY CLUSTERED 
(
	[Id_Tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarLog](
	[usuario] [varchar](50) NOT NULL,
	[passwrd] [varchar](50) NULL,
	[admin] [nchar](10) NULL,
 CONSTRAINT [PK_UsuarLog] PRIMARY KEY CLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CARRITO]  WITH CHECK ADD  CONSTRAINT [RELACION_A_Carrito] FOREIGN KEY([TIPO_ID])
REFERENCES [dbo].[TablaMenu] ([Id_Tipo])
GO
ALTER TABLE [dbo].[CARRITO] CHECK CONSTRAINT [RELACION_A_Carrito]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[BorrarelCarrito]
as
delete from CARRITO 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Elminar_seleccionado_carrito]
@id int
as
delete from CARRITO where IDPEDIDO=@id
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertarAlCarrito]
@usuarioid varchar(50),
@tipoid int
as
insert into CARRITO values (@usuarioid,@tipoid)
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertarCarrito]

@tipoid int
as
insert into CARRITO (TIPO_ID) values (@tipoid)
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertarUsuarioCarrito]
@userid varchar(50)
as
insert into CARRITO (USUARIO_ID) values (@userid)
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Listar_el_Carrito]
as
select TipoDescripcion as 'Descripcion de la compra            ',Precio as 'Precio por producto'
from CARRITO
inner join TablaMenu on CARRITO.TIPO_ID=TablaMenu.Id_Tipo
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Listar_en_el_Carrito]
as
select IDPEDIDO as 'Código de producto',TipoDescripcion as 'Descripción',Precio as 'Precio'
from CARRITO
inner join TablaMenu on CARRITO.TIPO_ID=TablaMenu.Id_Tipo
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listarcompras]
as
select * from RegistroPago

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ListarelCarrito]
as
select TipoDescripcion as Descripcion,Precio as 'Precio por producto'
from CARRITO
inner join TablaMenu on CARRITO.TIPO_ID=TablaMenu.Id_Tipo
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[llenarfactura]
@TTarjeta varchar(150),
@Tlr varchar(150),
@NumTarjeta int
as
begin
declare @codmax varchar(50)
set @codmax = (select max(Id) from RegistroPago)
end
update RegistroPago set TipoTarjeta=@TTarjeta,Titular=@Tlr,NumTarjeta=@NumTarjeta where id =@codmax
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[llenarpago]
@Pagototal float
as
insert into RegistroPago (PagoTotal) values (@Pagototal)
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[logadmin]
@admin varchar(50),
@pasword varchar(50)
as
select * from UsuarLog where admin=@admin and passwrd=@pasword
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_buscarUser]
@usu varchar(50)
as
select usuario from UsuarLog where usuario=@usu 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_login]
@usu varchar(50),
@pass varchar(50)
as
select * from UsuarLog where usuario=@usu and passwrd=@pass
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Registrar]
@usu varchar(50),
@pass varchar(50),
@accion varchar(50) output
as
if(@accion='1')
begin
insert into UsuarLog(usuario,passwrd) values(@usu,@pass)
set @accion='Se creo la cuenta'  
end
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RegistrarUsuario]
@usu varchar(50),
@pass varchar(50)
as
insert into UsuarLog(usuario,passwrd) values(@usu,@pass)
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_rUsuario]
@usu varchar(50),
@pass varchar(50)
as
insert into UsuarLog(usuario,passwrd) values(@usu,@pass)
GO
USE [master]
GO
ALTER DATABASE [BDTrabjoFinal] SET  READ_WRITE 
GO
