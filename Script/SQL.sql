USE [DB_MITIENDA]
GO
/****** Object:  Table [dbo].[inv_categoria_prod]    Script Date: 29/6/2020 7:43:37 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_categoria_prod](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [nvarchar](50) NULL,
	[fecha_insert] [datetime] NULL,
 CONSTRAINT [PK_INV_CATEGORIA_PROD] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inv_productos]    Script Date: 29/6/2020 7:43:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_productos](
	[id_productos] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[id_categoria] [int] NULL,
	[fecha_insert] [datetime] NULL,
 CONSTRAINT [PK_INV_PRODUCTOS] PRIMARY KEY CLUSTERED 
(
	[id_productos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ventas_mst]    Script Date: 29/6/2020 7:43:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas_mst](
	[id_ventas_mst] [int] IDENTITY(1,1) NOT NULL,
	[id_tienda] [int] NULL,
	[fecha_venta] [date] NULL,
	[fecha_insert] [datetime] NULL,
 CONSTRAINT [PK_VENTAS] PRIMARY KEY CLUSTERED 
(
	[id_ventas_mst] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ventas_det]    Script Date: 29/6/2020 7:43:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas_det](
	[id_ventas_det] [int] IDENTITY(1,1) NOT NULL,
	[id_ventas_mst] [int] NULL,
	[id_producto] [int] NULL,
	[fecha_insert] [datetime] NULL,
	[cantidad] [int] NULL,
	[costo_venta] [decimal](8, 4) NULL,
	[costo_compra] [decimal](8, 4) NULL,
 CONSTRAINT [PK_VENTAS_DET] PRIMARY KEY CLUSTERED 
(
	[id_ventas_det] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_ventas_categorias]    Script Date: 29/6/2020 7:43:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ventas_categorias]
AS
SELECT        dbo.inv_categoria_prod.id_categoria, dbo.inv_categoria_prod.categoria, SUM(dbo.ventas_det.costo_venta) AS total_venta
FROM            dbo.ventas_mst INNER JOIN
                         dbo.ventas_det ON dbo.ventas_mst.id_ventas_mst = dbo.ventas_det.id_ventas_mst INNER JOIN
                         dbo.inv_productos ON dbo.ventas_det.id_producto = dbo.inv_productos.id_productos INNER JOIN
                         dbo.inv_categoria_prod ON dbo.inv_productos.id_categoria = dbo.inv_categoria_prod.id_categoria
GROUP BY dbo.inv_categoria_prod.id_categoria, dbo.inv_categoria_prod.categoria
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 29/6/2020 7:43:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_usuarios]    Script Date: 29/6/2020 7:43:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](15) NULL,
	[password] [nvarchar](15) NULL,
	[id_perfil] [int] NULL,
 CONSTRAINT [PK_ADM_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 29/6/2020 7:43:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 29/6/2020 7:43:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 29/6/2020 7:43:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 29/6/2020 7:43:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 29/6/2020 7:43:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 29/6/2020 7:43:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 29/6/2020 7:43:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tiendas]    Script Date: 29/6/2020 7:43:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tiendas](
	[id_tienda] [int] IDENTITY(1,1) NOT NULL,
	[codigo_tienda] [nvarchar](50) NULL,
	[direccion] [nvarchar](50) NULL,
	[fecha_insert] [datetime] NULL,
 CONSTRAINT [PK_TIENDAS] PRIMARY KEY CLUSTERED 
(
	[id_tienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'3.0.0')
SET IDENTITY_INSERT [dbo].[adm_usuarios] ON 

INSERT [dbo].[adm_usuarios] ([id_usuario], [username], [password], [id_perfil]) VALUES (1, N'ADMIN USER', N'1234', 1)
INSERT [dbo].[adm_usuarios] ([id_usuario], [username], [password], [id_perfil]) VALUES (2, N'VENDOR', N'1234', 2)
INSERT [dbo].[adm_usuarios] ([id_usuario], [username], [password], [id_perfil]) VALUES (3, N'MARCIAL', N'56789', 1)
SET IDENTITY_INSERT [dbo].[adm_usuarios] OFF
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'648d53ea-0cac-47de-bdaa-acf9962334d3', N'mhenriquez2003@hotmail.com', N'MHENRIQUEZ2003@HOTMAIL.COM', N'mhenriquez2003@hotmail.com', N'MHENRIQUEZ2003@HOTMAIL.COM', 1, N'AQAAAAEAACcQAAAAEDQE3vMsykQjZE4XeJbxe7r5RmnWDsZv/fMR35t5qV2u0pq8Noe+zLyLwypnjZb0GA==', N'55Z2S6ZMGPAYDRD6JETF26S543N7ZY4Q', N'9e2fb5da-ad70-4fea-9784-5d2f7ade1ece', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'd376c5da-14eb-4da0-a346-4bf74b6e89fe', N'mhenriquez2003@gmail.com', N'MHENRIQUEZ2003@GMAIL.COM', N'mhenriquez2003@gmail.com', N'MHENRIQUEZ2003@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEJXtagvoJLQPg2ZEOAt+0MDG75V58NBKeWMWGD980GgFTXCPSIf4umfwoRDSAIs+Xw==', N'CAENDBXAUWGZNQWF66TEHJLK6FSOPRQQ', N'ec973c97-7630-4e03-b606-e9f5c7510125', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[inv_categoria_prod] ON 

INSERT [dbo].[inv_categoria_prod] ([id_categoria], [categoria], [fecha_insert]) VALUES (11, N'ABARROTES', CAST(N'2020-06-26T23:19:31.230' AS DateTime))
INSERT [dbo].[inv_categoria_prod] ([id_categoria], [categoria], [fecha_insert]) VALUES (12, N'ROPA DEPORTIVA', CAST(N'2020-06-26T23:19:31.230' AS DateTime))
INSERT [dbo].[inv_categoria_prod] ([id_categoria], [categoria], [fecha_insert]) VALUES (13, N'ROPA DE GALA', CAST(N'2020-06-26T23:34:14.350' AS DateTime))
INSERT [dbo].[inv_categoria_prod] ([id_categoria], [categoria], [fecha_insert]) VALUES (14, N'PRODUCTOS DE CONSUMO', CAST(N'2020-06-26T23:37:04.290' AS DateTime))
INSERT [dbo].[inv_categoria_prod] ([id_categoria], [categoria], [fecha_insert]) VALUES (15, N'DETERGENTES', CAST(N'2020-06-26T23:40:45.050' AS DateTime))
INSERT [dbo].[inv_categoria_prod] ([id_categoria], [categoria], [fecha_insert]) VALUES (16, N'PRODUCTOS ENLATADOS', CAST(N'2020-06-27T00:21:05.197' AS DateTime))
INSERT [dbo].[inv_categoria_prod] ([id_categoria], [categoria], [fecha_insert]) VALUES (17, N'PRODUCTOS DE LIMPIEZA', CAST(N'2020-06-27T00:22:04.450' AS DateTime))
INSERT [dbo].[inv_categoria_prod] ([id_categoria], [categoria], [fecha_insert]) VALUES (18, N'PRUEBA', CAST(N'2020-06-27T00:53:31.450' AS DateTime))
INSERT [dbo].[inv_categoria_prod] ([id_categoria], [categoria], [fecha_insert]) VALUES (19, N'FARMACOS', CAST(N'2020-06-27T02:49:15.477' AS DateTime))
SET IDENTITY_INSERT [dbo].[inv_categoria_prod] OFF
SET IDENTITY_INSERT [dbo].[inv_productos] ON 

INSERT [dbo].[inv_productos] ([id_productos], [nombre], [id_categoria], [fecha_insert]) VALUES (1, N'ALCOHOL GEL', 17, CAST(N'2020-06-27T14:36:49.857' AS DateTime))
INSERT [dbo].[inv_productos] ([id_productos], [nombre], [id_categoria], [fecha_insert]) VALUES (2, N'JABÓN ANTIBACTERIAL', 17, CAST(N'2020-06-27T14:37:00.870' AS DateTime))
INSERT [dbo].[inv_productos] ([id_productos], [nombre], [id_categoria], [fecha_insert]) VALUES (3, N'HIDROXICLOROQUINA', 19, CAST(N'2020-06-27T14:38:28.130' AS DateTime))
SET IDENTITY_INSERT [dbo].[inv_productos] OFF
SET IDENTITY_INSERT [dbo].[tiendas] ON 

INSERT [dbo].[tiendas] ([id_tienda], [codigo_tienda], [direccion], [fecha_insert]) VALUES (1, N'001', N'SUC. SAN SALVADOR', CAST(N'2020-06-26T01:35:59.550' AS DateTime))
INSERT [dbo].[tiendas] ([id_tienda], [codigo_tienda], [direccion], [fecha_insert]) VALUES (2, N'002', N'SUC. SAN MIGUEL', CAST(N'2020-06-26T01:36:05.770' AS DateTime))
INSERT [dbo].[tiendas] ([id_tienda], [codigo_tienda], [direccion], [fecha_insert]) VALUES (3, N'003', N'SUC. SANTA ANA', CAST(N'2020-06-26T01:36:10.323' AS DateTime))
SET IDENTITY_INSERT [dbo].[tiendas] OFF
SET IDENTITY_INSERT [dbo].[ventas_det] ON 

INSERT [dbo].[ventas_det] ([id_ventas_det], [id_ventas_mst], [id_producto], [fecha_insert], [cantidad], [costo_venta], [costo_compra]) VALUES (1, 1, 1, CAST(N'2020-06-27T14:41:39.167' AS DateTime), 2, CAST(5.5000 AS Decimal(8, 4)), CAST(4.0000 AS Decimal(8, 4)))
INSERT [dbo].[ventas_det] ([id_ventas_det], [id_ventas_mst], [id_producto], [fecha_insert], [cantidad], [costo_venta], [costo_compra]) VALUES (2, 1, 2, CAST(N'2020-06-27T14:41:39.167' AS DateTime), 3, CAST(4.0000 AS Decimal(8, 4)), CAST(2.0000 AS Decimal(8, 4)))
INSERT [dbo].[ventas_det] ([id_ventas_det], [id_ventas_mst], [id_producto], [fecha_insert], [cantidad], [costo_venta], [costo_compra]) VALUES (3, 1, 3, CAST(N'2020-06-27T14:41:53.577' AS DateTime), 1, CAST(6.0000 AS Decimal(8, 4)), CAST(2.5000 AS Decimal(8, 4)))
INSERT [dbo].[ventas_det] ([id_ventas_det], [id_ventas_mst], [id_producto], [fecha_insert], [cantidad], [costo_venta], [costo_compra]) VALUES (4, 2, 2, CAST(N'2020-06-27T14:52:47.183' AS DateTime), 8, CAST(25.0000 AS Decimal(8, 4)), CAST(2.5000 AS Decimal(8, 4)))
SET IDENTITY_INSERT [dbo].[ventas_det] OFF
SET IDENTITY_INSERT [dbo].[ventas_mst] ON 

INSERT [dbo].[ventas_mst] ([id_ventas_mst], [id_tienda], [fecha_venta], [fecha_insert]) VALUES (1, 1, CAST(N'2020-06-27' AS Date), CAST(N'2020-06-27T14:39:51.177' AS DateTime))
INSERT [dbo].[ventas_mst] ([id_ventas_mst], [id_tienda], [fecha_venta], [fecha_insert]) VALUES (2, 2, CAST(N'2020-06-27' AS Date), CAST(N'2020-06-27T14:39:56.177' AS DateTime))
SET IDENTITY_INSERT [dbo].[ventas_mst] OFF
ALTER TABLE [dbo].[inv_categoria_prod] ADD  CONSTRAINT [DF_INV_CATEGORIA_PROD_FECHA_INSERT]  DEFAULT (getdate()) FOR [fecha_insert]
GO
ALTER TABLE [dbo].[inv_productos] ADD  CONSTRAINT [DF_INV_PRODUCTOS_FECHA_INSERT]  DEFAULT (getdate()) FOR [fecha_insert]
GO
ALTER TABLE [dbo].[tiendas] ADD  CONSTRAINT [DF_TIENDAS_FECHA_INSERT]  DEFAULT (getdate()) FOR [fecha_insert]
GO
ALTER TABLE [dbo].[ventas_det] ADD  CONSTRAINT [DF_VENTAS_DET_FECHA_INSERT]  DEFAULT (getdate()) FOR [fecha_insert]
GO
ALTER TABLE [dbo].[ventas_mst] ADD  CONSTRAINT [DF_VENTAS_FECHA_INSERT]  DEFAULT (getdate()) FOR [fecha_insert]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[inv_productos]  WITH CHECK ADD  CONSTRAINT [FK_INV_PRODUCTOS_INV_CATEGORIA_PROD] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[inv_categoria_prod] ([id_categoria])
GO
ALTER TABLE [dbo].[inv_productos] CHECK CONSTRAINT [FK_INV_PRODUCTOS_INV_CATEGORIA_PROD]
GO
ALTER TABLE [dbo].[ventas_det]  WITH CHECK ADD  CONSTRAINT [FK_VENTAS_DET_INV_PRODUCTOS] FOREIGN KEY([id_producto])
REFERENCES [dbo].[inv_productos] ([id_productos])
GO
ALTER TABLE [dbo].[ventas_det] CHECK CONSTRAINT [FK_VENTAS_DET_INV_PRODUCTOS]
GO
ALTER TABLE [dbo].[ventas_det]  WITH CHECK ADD  CONSTRAINT [FK_VENTAS_DET_VENTAS_MST] FOREIGN KEY([id_ventas_mst])
REFERENCES [dbo].[ventas_mst] ([id_ventas_mst])
GO
ALTER TABLE [dbo].[ventas_det] CHECK CONSTRAINT [FK_VENTAS_DET_VENTAS_MST]
GO
ALTER TABLE [dbo].[ventas_mst]  WITH CHECK ADD  CONSTRAINT [FK_VENTAS_MST_TIENDAS] FOREIGN KEY([id_tienda])
REFERENCES [dbo].[tiendas] ([id_tienda])
GO
ALTER TABLE [dbo].[ventas_mst] CHECK CONSTRAINT [FK_VENTAS_MST_TIENDAS]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[31] 4[23] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ventas_mst"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 139
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ventas_det"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 187
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "inv_productos"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "inv_categoria_prod"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 119
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 2475
         Width = 2115
         Width = 2235
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ventas_categorias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ventas_categorias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ventas_categorias'
GO
