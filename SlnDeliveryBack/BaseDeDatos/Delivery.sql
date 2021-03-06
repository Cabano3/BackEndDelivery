USE [master]
GO
/****** Object:  Database [Delivery]    Script Date: 16/9/2020 23:55:14 ******/
CREATE DATABASE [Delivery]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Delivery', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.CRISTIAN\MSSQL\DATA\Delivery.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Delivery_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.CRISTIAN\MSSQL\DATA\Delivery_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Delivery] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Delivery].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Delivery] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Delivery] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Delivery] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Delivery] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Delivery] SET ARITHABORT OFF 
GO
ALTER DATABASE [Delivery] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Delivery] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Delivery] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Delivery] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Delivery] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Delivery] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Delivery] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Delivery] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Delivery] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Delivery] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Delivery] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Delivery] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Delivery] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Delivery] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Delivery] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Delivery] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Delivery] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Delivery] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Delivery] SET  MULTI_USER 
GO
ALTER DATABASE [Delivery] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Delivery] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Delivery] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Delivery] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Delivery] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Delivery] SET QUERY_STORE = OFF
GO
USE [Delivery]
GO
/****** Object:  Table [dbo].[DetallePedido]    Script Date: 16/9/2020 23:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallePedido](
	[idDetPedido] [int] IDENTITY(1,1) NOT NULL,
	[cantidad] [int] NULL,
	[subtotal] [decimal](18, 4) NULL,
	[recargaentrega] [decimal](18, 4) NULL,
	[iva] [decimal](10, 3) NULL,
	[idPedido] [int] NULL,
	[idProducto] [int] NULL,
 CONSTRAINT [PK_DetallePedido] PRIMARY KEY CLUSTERED 
(
	[idDetPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 16/9/2020 23:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[idPedido] [int] IDENTITY(1,1) NOT NULL,
	[fechapedido] [datetime] NULL,
	[estadopedido] [varchar](5) NULL,
	[idUsuario] [int] NULL,
	[total] [decimal](8, 4) NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 16/9/2020 23:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[precio] [decimal](18, 4) NULL,
	[comentario] [varchar](75) NULL,
	[estado] [varchar](5) NULL,
	[fechaelaboracion] [date] NULL,
	[fechavencimiento] [date] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 16/9/2020 23:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[cedula] [varchar](15) NULL,
	[telefono] [varchar](15) NULL,
	[direccion] [varchar](50) NULL,
	[contrasena] [varchar](15) NULL,
	[usuariosesion] [varchar](15) NULL,
	[rol] [varchar](10) NULL,
	[correo] [varchar](50) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DetallePedido] ON 

INSERT [dbo].[DetallePedido] ([idDetPedido], [cantidad], [subtotal], [recargaentrega], [iva], [idPedido], [idProducto]) VALUES (6, 8, CAST(20.1200 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.120 AS Decimal(10, 3)), 5019, 2005)
INSERT [dbo].[DetallePedido] ([idDetPedido], [cantidad], [subtotal], [recargaentrega], [iva], [idPedido], [idProducto]) VALUES (7, 4, CAST(20.1200 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.120 AS Decimal(10, 3)), 5019, 2006)
INSERT [dbo].[DetallePedido] ([idDetPedido], [cantidad], [subtotal], [recargaentrega], [iva], [idPedido], [idProducto]) VALUES (8, 3, CAST(7.6200 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.120 AS Decimal(10, 3)), 5020, 2005)
INSERT [dbo].[DetallePedido] ([idDetPedido], [cantidad], [subtotal], [recargaentrega], [iva], [idPedido], [idProducto]) VALUES (9, 8, CAST(40.1200 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.120 AS Decimal(10, 3)), 5020, 2006)
INSERT [dbo].[DetallePedido] ([idDetPedido], [cantidad], [subtotal], [recargaentrega], [iva], [idPedido], [idProducto]) VALUES (10, 8, CAST(40.1200 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.120 AS Decimal(10, 3)), 5021, 2006)
INSERT [dbo].[DetallePedido] ([idDetPedido], [cantidad], [subtotal], [recargaentrega], [iva], [idPedido], [idProducto]) VALUES (1010, 4, CAST(20.1200 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.120 AS Decimal(10, 3)), 6021, 2005)
INSERT [dbo].[DetallePedido] ([idDetPedido], [cantidad], [subtotal], [recargaentrega], [iva], [idPedido], [idProducto]) VALUES (1012, 3, CAST(7.6200 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.120 AS Decimal(10, 3)), 6022, 2005)
INSERT [dbo].[DetallePedido] ([idDetPedido], [cantidad], [subtotal], [recargaentrega], [iva], [idPedido], [idProducto]) VALUES (1013, 3, CAST(7.6200 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.120 AS Decimal(10, 3)), 6023, 3003)
INSERT [dbo].[DetallePedido] ([idDetPedido], [cantidad], [subtotal], [recargaentrega], [iva], [idPedido], [idProducto]) VALUES (1014, 5, CAST(5.6200 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.120 AS Decimal(10, 3)), 6023, 3005)
INSERT [dbo].[DetallePedido] ([idDetPedido], [cantidad], [subtotal], [recargaentrega], [iva], [idPedido], [idProducto]) VALUES (1015, 4, CAST(4.5200 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.120 AS Decimal(10, 3)), 6024, 4008)
INSERT [dbo].[DetallePedido] ([idDetPedido], [cantidad], [subtotal], [recargaentrega], [iva], [idPedido], [idProducto]) VALUES (1016, 2, CAST(5.1200 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.120 AS Decimal(10, 3)), 6024, 2005)
SET IDENTITY_INSERT [dbo].[DetallePedido] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedido] ON 

INSERT [dbo].[Pedido] ([idPedido], [fechapedido], [estadopedido], [idUsuario], [total]) VALUES (5019, CAST(N'2020-09-06T03:48:32.240' AS DateTime), N'D', 2, CAST(40.2400 AS Decimal(8, 4)))
INSERT [dbo].[Pedido] ([idPedido], [fechapedido], [estadopedido], [idUsuario], [total]) VALUES (5020, CAST(N'2020-09-06T19:23:21.210' AS DateTime), N'D', 2021, CAST(47.7400 AS Decimal(8, 4)))
INSERT [dbo].[Pedido] ([idPedido], [fechapedido], [estadopedido], [idUsuario], [total]) VALUES (5021, CAST(N'2020-09-08T12:22:32.000' AS DateTime), N'D', 2, CAST(36.4000 AS Decimal(8, 4)))
INSERT [dbo].[Pedido] ([idPedido], [fechapedido], [estadopedido], [idUsuario], [total]) VALUES (6021, CAST(N'2020-10-08T12:22:32.000' AS DateTime), N'D', 2, CAST(20.1200 AS Decimal(8, 4)))
INSERT [dbo].[Pedido] ([idPedido], [fechapedido], [estadopedido], [idUsuario], [total]) VALUES (6022, CAST(N'2020-09-16T18:49:07.907' AS DateTime), N'D', 2, CAST(7.6200 AS Decimal(8, 4)))
INSERT [dbo].[Pedido] ([idPedido], [fechapedido], [estadopedido], [idUsuario], [total]) VALUES (6023, CAST(N'2020-09-16T18:52:35.183' AS DateTime), N'D', 2024, CAST(13.2400 AS Decimal(8, 4)))
INSERT [dbo].[Pedido] ([idPedido], [fechapedido], [estadopedido], [idUsuario], [total]) VALUES (6024, CAST(N'2020-09-16T18:55:37.327' AS DateTime), N'D', 2024, CAST(9.6400 AS Decimal(8, 4)))
SET IDENTITY_INSERT [dbo].[Pedido] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([idProducto], [nombre], [precio], [comentario], [estado], [fechaelaboracion], [fechavencimiento]) VALUES (2002, N'Salchichas', CAST(4.5000 AS Decimal(18, 4)), N'Pack x 6', N'A', CAST(N'2020-08-08' AS Date), CAST(N'2020-08-27' AS Date))
INSERT [dbo].[Producto] ([idProducto], [nombre], [precio], [comentario], [estado], [fechaelaboracion], [fechavencimiento]) VALUES (2005, N'Milanesa', CAST(2.5000 AS Decimal(18, 4)), N'Paquete de 200gr', N'D', CAST(N'2020-08-06' AS Date), CAST(N'2020-08-18' AS Date))
INSERT [dbo].[Producto] ([idProducto], [nombre], [precio], [comentario], [estado], [fechaelaboracion], [fechavencimiento]) VALUES (2006, N'Sal', CAST(5.0000 AS Decimal(18, 4)), N'asdf', N'D', CAST(N'2020-08-06' AS Date), CAST(N'2020-08-26' AS Date))
INSERT [dbo].[Producto] ([idProducto], [nombre], [precio], [comentario], [estado], [fechaelaboracion], [fechavencimiento]) VALUES (3003, N'Salmon', CAST(2.5000 AS Decimal(18, 4)), N'asfd', N'D', CAST(N'2020-08-19' AS Date), CAST(N'2020-08-28' AS Date))
INSERT [dbo].[Producto] ([idProducto], [nombre], [precio], [comentario], [estado], [fechaelaboracion], [fechavencimiento]) VALUES (3005, N'Salchichones', CAST(1.1000 AS Decimal(18, 4)), N'Producto creado', N'D', CAST(N'2020-08-08' AS Date), CAST(N'2020-08-27' AS Date))
INSERT [dbo].[Producto] ([idProducto], [nombre], [precio], [comentario], [estado], [fechaelaboracion], [fechavencimiento]) VALUES (4008, N'Carne', CAST(1.1000 AS Decimal(18, 4)), N'libra', N'D', CAST(N'2020-08-20' AS Date), CAST(N'2020-08-28' AS Date))
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [cedula], [telefono], [direccion], [contrasena], [usuariosesion], [rol], [correo]) VALUES (2, N'Cristian', N'Baño', N'1726620162', N'0979406707', N'Lucha de los Pobres ', N'12345', N'cabano2', N'A', N'cris@gmail.com')
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [cedula], [telefono], [direccion], [contrasena], [usuariosesion], [rol], [correo]) VALUES (3, N'Ricky', N'Iza ', N'1565498', N'097845612', N'Latacunga', N'12548', N'ricky', N'C', N'raiza@gmail.com')
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [cedula], [telefono], [direccion], [contrasena], [usuariosesion], [rol], [correo]) VALUES (2021, N'Jorge', N'Zamora', N'1805476905', N'45152015', N'Los Pinos', N'1234', N'jorge', N'C', N'jorge@gmail.com')
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [cedula], [telefono], [direccion], [contrasena], [usuariosesion], [rol], [correo]) VALUES (2023, N'Jorge', N'Baño', N'1234567890', N'02645178', N'Lucha de los Pobres', N'123456', N'jorgeb', N'C', N'jorge@gmail.com')
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [cedula], [telefono], [direccion], [contrasena], [usuariosesion], [rol], [correo]) VALUES (2024, N'Leidy', N'Romero', N'1545879541', N'0215457', N'Lucha de los Pobres', N'12345', N'leidy', N'C', N'leidy@gmail.com')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[DetallePedido]  WITH CHECK ADD  CONSTRAINT [FK_DetallePedido_Pedido] FOREIGN KEY([idPedido])
REFERENCES [dbo].[Pedido] ([idPedido])
GO
ALTER TABLE [dbo].[DetallePedido] CHECK CONSTRAINT [FK_DetallePedido_Pedido]
GO
ALTER TABLE [dbo].[DetallePedido]  WITH CHECK ADD  CONSTRAINT [FK_DetallePedido_Producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[DetallePedido] CHECK CONSTRAINT [FK_DetallePedido_Producto]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[rptAgrupadosPedidosClientesMes]    Script Date: 16/9/2020 23:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptAgrupadosPedidosClientesMes]
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT DATEPART(MONTH, ped.fechapedido) AS MES, COUNT(ped.idUsuario) as Pedidos, CONCAT(us.nombre, ' ', us.apellido) as Cliente
	FROM dbo.Pedido AS ped
	INNER JOIN dbo.Usuario us ON ped.idUsuario = us.idUsuario
	GROUP BY DATEPART(MONTH, ped.fechapedido), us.nombre, us.apellido 
END
GO
/****** Object:  StoredProcedure [dbo].[rptNumeroPedidos]    Script Date: 16/9/2020 23:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptNumeroPedidos]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT COUNT(ped.idUsuario) as Pedidos, CONCAT(us.nombre, ' ', us.apellido) as Cliente FROM dbo.Pedido AS ped
	INNER JOIN dbo.Usuario us ON ped.idUsuario = us.idUsuario
	GROUP BY us.nombre, us.apellido
END
GO
/****** Object:  StoredProcedure [dbo].[rptProductosVendidos]    Script Date: 16/9/2020 23:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptProductosVendidos]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select SUM(det.cantidad) as Cantidad, pr.nombre as Producto from dbo.DetallePedido AS det
	INNER JOIN dbo.Producto pr ON det.idProducto = pr.idProducto
	GROUP BY pr.nombre
END
GO
/****** Object:  StoredProcedure [dbo].[rptProductosVendidosMes]    Script Date: 16/9/2020 23:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptProductosVendidosMes]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DATEPART(MONTH, ped.fechapedido) AS MES, SUM(det.cantidad) as Cantidad, pr.nombre AS Producto 
	FROM dbo.DetallePedido AS det
	INNER JOIN dbo.Pedido AS ped ON det.idPedido = ped.idPedido
	INNER JOIN dbo.Producto AS pr ON det.idProducto = pr.idProducto
	GROUP BY DATEPART(MONTH, ped.fechapedido), pr.nombre 
END
GO
USE [master]
GO
ALTER DATABASE [Delivery] SET  READ_WRITE 
GO
