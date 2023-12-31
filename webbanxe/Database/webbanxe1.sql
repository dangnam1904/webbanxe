USE [master]
GO

CREATE DATABASE [webbanxe1]
GO
Use webbanxe1
go

CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accessaries]    Script Date: 12/13/2023 1:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessaries](
	[IdAccessary] [int] IDENTITY(1,1) NOT NULL,
	[NameAccessary] [nvarchar](500) NOT NULL,
	[DescriptionAccessary] [nvarchar](max) NOT NULL,
	[ImageAccessary] [nvarchar](700) NOT NULL,
	[Price] [float] NOT NULL,
	[PricePromotion] [float] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Accessaries] PRIMARY KEY CLUSTERED 
(
	[IdAccessary] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminMenu]    Script Date: 12/13/2023 1:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminMenu](
	[AdminMenuID] [bigint] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](max) NULL,
	[ItemLevel] [int] NOT NULL,
	[ParentLevel] [int] NOT NULL,
	[ItemOrder] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[ItemTarget] [nvarchar](max) NULL,
	[AreaName] [nvarchar](max) NULL,
	[ControllerName] [nvarchar](max) NULL,
	[ActionName] [nvarchar](max) NULL,
	[Icon] [nvarchar](max) NULL,
	[IdName] [nvarchar](max) NULL,
 CONSTRAINT [PK_AdminMenu] PRIMARY KEY CLUSTERED 
(
	[AdminMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bike]    Script Date: 12/13/2023 1:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bike](
	[IdBike] [int] IDENTITY(1,1) NOT NULL,
	[NameBike] [nvarchar](200) NOT NULL,
	[price] [float] NOT NULL,
	[PricePromotion] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ImageBike] [nvarchar](700) NOT NULL,
	[DescriptionBike] [nvarchar](max) NOT NULL,
	[IdType] [int] NOT NULL,
 CONSTRAINT [PK_Bike] PRIMARY KEY CLUSTERED 
(
	[IdBike] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 12/13/2023 1:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[IdCart] [int] IDENTITY(1,1) NOT NULL,
	[QuantityPurchased] [int] NOT NULL,
	[IdBike] [int] NULL,
	[IdUser] [int] NOT NULL,
	[IdOrder] [int] NULL,
	[IdAccessary] [int] NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[IdCart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 12/13/2023 1:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[ControllerName] [nvarchar](max) NULL,
	[ActionName] [nvarchar](max) NULL,
	[Levels] [int] NOT NULL,
	[ParentID] [int] NOT NULL,
	[Link] [nvarchar](max) NULL,
	[MenuOrder] [int] NOT NULL,
	[Position] [int] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/13/2023 1:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[NumberPhone] [nvarchar](13) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[idCart] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 12/13/2023 1:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Abstract] [nvarchar](max) NULL,
	[Contents] [nvarchar](max) NULL,
	[Images] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL,
	[Author] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[IsActive] [bit] NULL,
	[PostOrder] [int] NOT NULL,
	[Category] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[MenuID] [int] NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/13/2023 1:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IdRole] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slides]    Script Date: 12/13/2023 1:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slides](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[SloganTitle] [nvarchar](500) NOT NULL,
	[NameImg] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Slides] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeBike]    Script Date: 12/13/2023 1:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeBike](
	[IdType] [int] IDENTITY(1,1) NOT NULL,
	[NameType] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_TypeBike] PRIMARY KEY CLUSTERED 
(
	[IdType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/13/2023 1:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](13) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[view_Post_Menu]    Script Date: 12/13/2023 1:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[view_Post_Menu](
	[PostID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Abstract] [nvarchar](max) NULL,
	[Contents] [nvarchar](max) NULL,
	[Images] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL,
	[Author] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[IsActive] [bit] NULL,
	[PostOrder] [int] NOT NULL,
	[MenuID] [int] NOT NULL,
	[Category] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[MenuName] [nvarchar](max) NULL,
 CONSTRAINT [PK_view_Post_Menu] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231106111346_init', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231106111657_modify-index-set-off', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231106111846_modify-index-set-off1', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231106145037_int2', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231110085046_modify-cloumn_TypeBike', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231127154608_addmodeloder', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231127154709_addmodelpayment', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231127155338_modifymodelOrder', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231127155507_modifymodelOrder1', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231127155910_addmodelOrderPayment', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231127160134_addmodelOrderPayment', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231127172128_addModeOrder', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231127172300_addFKOrder', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231128160816_allmodel_Order', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231201165820_add_Model_Slide', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231211155417_add-accessaries', N'7.0.13')
GO
SET IDENTITY_INSERT [dbo].[Accessaries] ON 
GO
INSERT [dbo].[Accessaries] ([IdAccessary], [NameAccessary], [DescriptionAccessary], [ImageAccessary], [Price], [PricePromotion], [Quantity]) VALUES (2, N'Đồ bảo hộ', N'<p>ADFSDFG</p>
', N'1.jpg;download.jpg', 2000000, 0.03, 3)
GO
INSERT [dbo].[Accessaries] ([IdAccessary], [NameAccessary], [DescriptionAccessary], [ImageAccessary], [Price], [PricePromotion], [Quantity]) VALUES (3, N'Đồ bảo hộ', N'<p>ds</p>
', N'download (1)20231213103048Tlrf.jpg', 1500000, 0.01, 0)
GO
SET IDENTITY_INSERT [dbo].[Accessaries] OFF
GO
SET IDENTITY_INSERT [dbo].[AdminMenu] ON 
GO
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (1, N'Bảng điều khiển', 0, 0, 1, 1, NULL, N'Admin', N'Home', N'Index', NULL, NULL)
GO
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (2, N'Thông tin cá nhân', 0, 0, 1, 0, NULL, N'Admin', N'Home', N'Index', NULL, NULL)
GO
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (3, N'Hướng dẫn sử dụng', 0, 0, 2, 0, NULL, N'Admin', N'Home', N'Index', NULL, NULL)
GO
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (4, N'Liên lạc', 0, 0, 3, 0, NULL, N'Admin', N'Home', N'Index', NULL, NULL)
GO
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (5, N'Đăng xuất', 0, 0, 4, 0, NULL, N'Admin', N'Home', N'Index', NULL, NULL)
GO
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (6, N'Quản lý bài viết', 1, 0, 1, 1, N'components-nav', N'Admin', N'Home', N'Index', N'bi bi-menu-button-wide', N'components-nav')
GO
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (7, N'Cập nhật bài viết', 2, 6, 1, 1, NULL, N'Admin', N'Home', N'Index', NULL, NULL)
GO
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (8, N'Duyệt và đăng bài viết', 2, 6, 2, 1, NULL, N'Admin', N'Home', N'Index', NULL, NULL)
GO
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (9, N'Bài viết đã đăng', 2, 6, 3, 1, NULL, N'Admin', N'Home', N'Index', NULL, NULL)
GO
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (10, N'Quản lý menu', 1, 0, 1, 1, N'forms-nav', N'Admin', N'Home', N'Index', N'bi bi-journal-text', N'forms-nav')
GO
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (11, N'Thêm mới menu', 2, 10, 1, 1, NULL, N'Admin', N'Menu', N'Index', NULL, NULL)
GO
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (12, N'Chỉnh sửa menu', 2, 10, 2, 1, NULL, N'Admin', N'Home', N'Index', NULL, NULL)
GO
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (13, N'Quản lý Slide', 1, 0, 1, 1, N'charts-nav', N'Admin', N'Home', N'Index', N'bi bi-bar-chart', N'charts-nav')
GO
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (14, N'Thêm mới Slide', 2, 13, 1, 1, NULL, N'Admin', N'Home', N'Index', NULL, NULL)
GO
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (15, N'Chỉnh sửa Slide', 2, 13, 2, 1, NULL, N'Admin', N'Home', N'Index', NULL, NULL)
GO
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (16, N'Xe ', 2, 14, 1, 1, NULL, N'Admin', N'Bikes', N'Index', NULL, NULL)
GO
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (17, N'Loại xe ', 2, 14, 2, 1, NULL, N'Admin', N'TypeBike', N'Index', NULL, NULL)
GO
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (18, N'Quản lý xe ', 1, 0, 1, 1, NULL, N'Admin', N'Bikes', N'Index', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[AdminMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[Bike] ON 
GO
INSERT [dbo].[Bike] ([IdBike], [NameBike], [price], [PricePromotion], [Quantity], [ImageBike], [DescriptionBike], [IdType]) VALUES (2, N'Xe Đạp điện', 7000000, 0.5, 4, N'hinh-anh-xe-do-dep-doc-dao-moi-nhat-2022-1-1.jpg', N'Xe máy điện < 50cc', 2)
GO
INSERT [dbo].[Bike] ([IdBike], [NameBike], [price], [PricePromotion], [Quantity], [ImageBike], [DescriptionBike], [IdType]) VALUES (9, N'33', 4564646, 1, 7, N'download.jpg', N'34', 1)
GO
INSERT [dbo].[Bike] ([IdBike], [NameBike], [price], [PricePromotion], [Quantity], [ImageBike], [DescriptionBike], [IdType]) VALUES (10, N'Xe Ware', 16000000, 0.1, 7, N'144532-frontview-1-.jpg;SYM-Elegant-110-8477-1649899780.jpg;20170831151616-wave-alpha.jpg', N'345', 1)
GO
INSERT [dbo].[Bike] ([IdBike], [NameBike], [price], [PricePromotion], [Quantity], [ImageBike], [DescriptionBike], [IdType]) VALUES (11, N'Xe test', 45445, 0.1, 7, N'144532-frontview-1-.jpg;SYM-Elegant-110-8477-1649899780.jpg;20170831151616-wave-alpha.jpg;images (1).jpg', N'33', 1)
GO
SET IDENTITY_INSERT [dbo].[Bike] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 
GO
INSERT [dbo].[Carts] ([IdCart], [QuantityPurchased], [IdBike], [IdUser], [IdOrder], [IdAccessary]) VALUES (2, 1, 2, 2, NULL, 0)
GO
INSERT [dbo].[Carts] ([IdCart], [QuantityPurchased], [IdBike], [IdUser], [IdOrder], [IdAccessary]) VALUES (6, 2, 0, 2, NULL, 2)
GO
INSERT [dbo].[Carts] ([IdCart], [QuantityPurchased], [IdBike], [IdUser], [IdOrder], [IdAccessary]) VALUES (7, 3, 0, 2, NULL, 2)
GO
INSERT [dbo].[Carts] ([IdCart], [QuantityPurchased], [IdBike], [IdUser], [IdOrder], [IdAccessary]) VALUES (9, 1, 2, 2, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (1, N'Trang chủ', 1, NULL, NULL, 1, 0, NULL, 1, 1)
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (2, N'Về BuyUrBike', 1, NULL, NULL, 1, 0, NULL, 2, 1)
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (3, N'Dịch vụ', 1, NULL, NULL, 1, 0, NULL, 3, 1)
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (4, N'Chợ xe', 1, NULL, NULL, 1, 0, NULL, 4, 1)
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (5, N'Tin tức', 1, NULL, NULL, 1, 0, NULL, 5, 1)
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (6, N'Liên hệ', 1, NULL, NULL, 1, 0, NULL, 6, 1)
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (7, N'Tư vấn', 1, NULL, NULL, 2, 3, NULL, 1, 1)
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (8, N'So sánh xe', 1, NULL, NULL, 2, 3, NULL, 2, 1)
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (9, N'Giá linh kiện', 1, NULL, NULL, 2, 3, NULL, 3, 1)
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (10, N'Chính sách bảo hành', 1, NULL, NULL, 2, 3, NULL, 4, 1)
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (12, N'Phụ kiện', 1, NULL, NULL, 1, 0, NULL, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([IdOrder], [NumberPhone], [Address], [OrderStatus], [idCart]) VALUES (9, N'0665685', N'Con Cuông 2', 0, 2)
GO
INSERT [dbo].[Order] ([IdOrder], [NumberPhone], [Address], [OrderStatus], [idCart]) VALUES (10, N'0665685', N'Con Cuông 2', 0, 7)
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 
GO
INSERT [dbo].[Post] ([PostID], [Title], [Abstract], [Contents], [Images], [Link], [Author], [CreatedDate], [IsActive], [PostOrder], [Category], [Status], [MenuID]) VALUES (2, N'XE MÁY ĐIỆN CÓ PHẢI LẮP GƯƠNG KHÔNG? QUY ĐỊNH THẾ NÀO?', N'Gương chiếu hậu là thiết bị giúp người lái quan sát được phía sau mà không cần quay đầu lại. Nhờ vậy mà việc di chuyển như nhập làn, chuyển làn, vào cua, rẽ trái/phải an toàn hơn. Vậy nếu đi xe máy điện có phải lắp gương không? Tìm hiểu ngay trong bài viết sau đây nhé.', N'<p>1. [Giải đ&aacute;p] Đi xe m&aacute;y điện c&oacute; cần lắp gương kh&ocirc;ng? Theo Luật giao th&ocirc;ng đường bộ Việt Nam, xe m&aacute;y điện cần lắp gương chiếu hậu khi lưu th&ocirc;ng, c&ograve;n đối với d&ograve;ng xe điện c&oacute; tốc độ chạy khoảng 25km/h th&igrave; kh&ocirc;ng bắt buộc phải c&oacute; gương. Cụ thể: Theo Điều 53 Luật giao th&ocirc;ng đường bộ 2008, c&oacute; đủ gương chiếu hậu l&agrave; một trong những điều kiện tham gia giao th&ocirc;ng của xe cơ giới. Khoản 18 Điều 3 Luật n&agrave;y đ&atilde; liệt k&ecirc; c&aacute;c loại xe cơ giới gồm: Xe &ocirc; t&ocirc;; m&aacute;y k&eacute;o; rơ mo&oacute;c hoặc sơ mi rơ mo&oacute;c được k&eacute;o bởi xe &ocirc; t&ocirc;, m&aacute;y k&eacute;o; xe m&ocirc; t&ocirc; hai b&aacute;nh; xe m&ocirc; t&ocirc; ba b&aacute;nh; xe gắn m&aacute;y (kể cả xe m&aacute;y điện) v&agrave; c&aacute;c loại xe tương tự. xe m&aacute;y điện c&oacute; phải lắp gương kh&ocirc;ng Theo quy định, sử dụng xe m&aacute;y điện cần phải lắp gương chiếu hậu.</p>

<p>2. Đi xe m&aacute;y điện kh&ocirc;ng lắp gương phạt bao nhi&ecirc;u tiền? Theo Điểm a khoản 1 Điều 17 Nghị định số 100/2019/NĐ-CP, xe m&aacute;y điện kh&ocirc;ng c&oacute; gương chiếu hậu b&ecirc;n tr&aacute;i hoặc c&oacute; nhưng kh&ocirc;ng c&oacute; t&aacute;c dụng sẽ bị phạt từ 100.000 &ndash; 200.000 đồng. Trường hợp kh&ocirc;ng c&oacute; gương chiếu hậu b&ecirc;n phải th&igrave; kh&ocirc;ng bị xử phạt h&agrave;nh ch&iacute;nh. Người vi phạm c&oacute; thể nộp phạt trực tiếp, kh&ocirc;ng cần phải đến Kho bạc. Đồng thời người xử phạt kh&ocirc;ng cần lập bi&ecirc;n bản nhưng phải x&eacute; bi&ecirc;n lai đưa cho người vi phạm.</p>

<p>3. Quy định về gương chiếu hậu của xe m&aacute;y điện Kh&ocirc;ng chỉ cần lắp gương v&agrave;o xe m&aacute;y điện m&agrave; gương chiếu hậu cũng cần đảm bảo chất lượng, lắp đặt đ&uacute;ng c&aacute;ch theo quy chuẩn QCVN 28: 2010/BGTVT về gương chiếu hậu xe m&ocirc; t&ocirc;, xe gắn m&aacute;y. Gương phải điều chỉnh được v&ugrave;ng quan s&aacute;t. M&eacute;p của bề mặt phản xạ gương phải nằm trong vỏ bảo vệ (đế gương) v&agrave; m&eacute;p của vỏ bảo vệ phải c&oacute; b&aacute;n k&iacute;nh cong &ldquo;c&rdquo; c&oacute; gi&aacute; trị kh&ocirc;ng nhỏ hơn 2,5 mm tại mọi điểm v&agrave; theo mọi hướng. Tất cả c&aacute;c bộ phận của gương phải c&oacute; b&aacute;n k&iacute;nh cong &ldquo;c&rdquo; kh&ocirc;ng nhỏ hơn 2,5 mm. Diện t&iacute;ch của bề mặt phản xạ kh&ocirc;ng được nhỏ hơn 69 cm2.</p>

<p>Trong trường hợp gương tr&ograve;n, đường k&iacute;nh của bề mặt phản xạ kh&ocirc;ng được nhỏ hơn 94 mm v&agrave; kh&ocirc;ng được lớn hơn 150 mm. Trong trường hợp gương kh&ocirc;ng tr&ograve;n k&iacute;ch thước của bề mặt phản xạ phải đủ lớn để chứa được một h&igrave;nh tr&ograve;n nội tiếp c&oacute; đường k&iacute;nh 78 mm, nhưng phải nằm được trong một h&igrave;nh chữ nhật c&oacute; k&iacute;ch thước 120 mm x 200 mm. Bề mặt phản xạ của gương phải c&oacute; dạng h&igrave;nh cầu lồi. Tr&ecirc;n đ&acirc;y l&agrave; những th&ocirc;ng tin giải đ&aacute;p cho thắc mắc xe m&aacute;y điện c&oacute; phải lắp gương kh&ocirc;ng. Nh&igrave;n chung, bạn n&ecirc;n chọn mua gương xe điện ở những nơi uy t&iacute;n hoặc sử dụng gương xe ch&iacute;nh h&atilde;ng từ nh&agrave; sản xuất. Khi lắp gương, nếu kh&ocirc;ng c&oacute; nhiều kinh nghiệm th&igrave; n&ecirc;n mang ra đại l&yacute; hoặc cửa h&agrave;ng xe để được đội ngũ kỹ thuật hỗ trợ.</p>
', N'download20231213104924qOzu.jpg', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, 0, 0, 0, 1)
GO
INSERT [dbo].[Post] ([PostID], [Title], [Abstract], [Contents], [Images], [Link], [Author], [CreatedDate], [IsActive], [PostOrder], [Category], [Status], [MenuID]) VALUES (3, N'ĐI XE ĐIỆN CÓ CẦN ĐỘI MŨ BẢO HIỂM KHÔNG? QUY ĐỊNH NHƯ THẾ NÀO? ', N'Xe điện là phương tiện được khá nhiều người sử dụng hiện nay. Tuy nhiên đi xe điện có cần đội mũ bảo hiểm không? Quy định cụ thể thế nào? Cùng tìm hiểu chi tiết vấn đề này trong bài viết dưới đây nhé.', N'<p>1. T&igrave;m hiểu về xe điện Xe điện phổ biến hiện nay c&oacute; thể kể đến như xe m&aacute;y điện v&agrave; xe đạp điện, trong đ&oacute;: Xe m&aacute;y điện l&agrave; phương tiện giao th&ocirc;ng cơ giới đường bộ c&oacute; c&ocirc;ng suất kh&ocirc;ng vượt qu&aacute; 4000W v&agrave; vận tốc tối đa dưới 50km/h. Người từ đủ 16 tuổi trở l&ecirc;n c&oacute; thể sử dụng được xe m&aacute;y điện. Xe đạp điện l&agrave; phương tiện giao th&ocirc;ng th&ocirc; sơ đường bộ, vận tốc tối đa dưới 25km/h, khi tắt m&aacute;y th&igrave; vẫn c&oacute; thể đạp xe được. Người dưới 16 tuổi c&oacute; thể sử dụng được xe đạp điện.</p>

<p>2. Đi xe điện c&oacute; cần đội mũ bảo hiểm kh&ocirc;ng? Người điều khiển v&agrave; người ngồi sau xe m&aacute;y điện hay xe đạp điện đều cần đội mũ bảo hiểm. Cụ thể: Với xe m&aacute;y điện: Theo Nghị định 100/2019/NĐ-CP, người l&aacute;i v&agrave; người ngồi tr&ecirc;n xe m&ocirc; t&ocirc;, xe gắn m&aacute;y (bao gồm xe m&aacute;y điện) bắt buộc phải đội mũ bảo hiểm khi tham gia giao th&ocirc;ng. Với xe đạp điện: Theo Khoản 2, Điều 31, Luật Giao th&ocirc;ng đường bộ năm 2008, người điều khiển, người ngồi tr&ecirc;n xe đạp m&aacute;y phải đội mũ bảo hiểm c&oacute; c&agrave;i quai đ&uacute;ng quy c&aacute;ch. đi xe điện c&oacute; cần đội mũ bảo hiểm kh&ocirc;ng 1 Người đi xe điện cần đội mũ bảo hiểm v&agrave; c&agrave;i quai đ&uacute;ng quy c&aacute;ch khi tham gia giao th&ocirc;ng.</p>

<p>3. Lỗi đi xe m&aacute;y điện kh&ocirc;ng đội mũ bảo hiểm phạt bao nhi&ecirc;u tiền? Nếu đi xe m&aacute;y điện v&agrave; xe đạp điện kh&ocirc;ng đội mũ bảo hiểm sẽ bị xử phạt h&agrave;nh ch&iacute;nh. Căn cứ theo quy định tại Khoản 4, Điều 8, Nghị định 100/2019/NĐ-CP sửa đổi bổ sung bởi Khoản 6 Điều 2 Nghị định 123/2021/NĐ-CP c&oacute; hiệu lực từ ng&agrave;y 01/01/2022, phạt tiền từ 400.000 đến 600.000 đồng: Người điều khiển xe đạp m&aacute;y (kể cả xe đạp điện), xe gắn m&aacute;y (kể cả xe m&aacute;y điện) kh&ocirc;ng đội &ldquo;mũ bảo hiểm cho người đi m&ocirc; t&ocirc;, xe m&aacute;y&rdquo; hoặc đội &ldquo;mũ bảo hiểm cho người đi m&ocirc; t&ocirc;, xe m&aacute;y&rdquo; kh&ocirc;ng c&agrave;i quai đ&uacute;ng quy c&aacute;ch khi tham gia giao th&ocirc;ng tr&ecirc;n đường bộ. Chở người ngồi tr&ecirc;n xe đạp m&aacute;y (kể cả xe đạp điện), xe gắn m&aacute;y (kể cả xe m&aacute;y điện) kh&ocirc;ng đội &ldquo;mũ bảo hiểm cho người đi m&ocirc; t&ocirc;, xe m&aacute;y&rdquo; hoặc đội &ldquo;mũ bảo hiểm cho người đi m&ocirc; t&ocirc;, xe m&aacute;y&rdquo; kh&ocirc;ng c&agrave;i quai đ&uacute;ng quy c&aacute;ch, trừ trường hợp chở người bệnh đi cấp cứu, trẻ em dưới 06 tuổi, &aacute;p giải người c&oacute; h&agrave;nh vi vi phạm ph&aacute;p luật; Như vậy, khi đi xe điện, gồm cả xe m&aacute;y điện v&agrave; xe đạp điện nếu kh&ocirc;ng đội mũ bảo hiểm, người điều khiển phương tiện c&oacute; thể bị phạt từ 400.000 đến 600.000 đồng.</p>

<p>B&agrave;i viết tr&ecirc;n l&agrave; c&aacute;c th&ocirc;ng tin giải đ&aacute;p cho thắc mắc đi xe điện c&oacute; cần đội mũ bảo hiểm kh&ocirc;ng. Qua đ&oacute;, người đi xe điện buộc phải đội mũ bảo hiểm khi tham gia giao th&ocirc;ng, nếu kh&ocirc;ng chấp h&agrave;nh c&oacute; thể bị xử phạt h&agrave;nh ch&iacute;nh từ 400.000 &ndash; 600.000 đồng. Ngo&agrave;i tu&acirc;n thủ quy định khi tham gia giao th&ocirc;ng, bạn cũng cần lưu &yacute; lựa chọn loại xe điện chất lượng để đảm bảo an to&agrave;n khi di chuyển cũng như c&oacute; trải nghiệm l&aacute;i tốt hơn.</p>
', N'blog-3.jpg', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, 0, 0, 0, 1)
GO
INSERT [dbo].[Post] ([PostID], [Title], [Abstract], [Contents], [Images], [Link], [Author], [CreatedDate], [IsActive], [PostOrder], [Category], [Status], [MenuID]) VALUES (9, N'5 nhà khoa học Việt vào bảng xếp hạng thế giới', N'tetrrert', N'<p>C&aacute;c nh&agrave; khoa học được gắn huy hiệu &quot;Rising Star&quot; - ng&ocirc;i sao khoa học đang l&ecirc;n xuất sắc tr&ecirc;n thế giới, do website Research.com c&ocirc;ng bố ng&agrave;y 2/12.</p>

<p>Website Research.com, cổng th&ocirc;ng tin điện tử uy t&iacute;n d&agrave;nh cho c&aacute;c nh&agrave; khoa học thế giới, vừa c&ocirc;ng bố kết quả xếp hạng c&aacute;c nh&agrave; khoa học c&oacute; th&agrave;nh t&iacute;ch xuất sắc trong c&ocirc;ng bố khoa học năm 2023. Đ&acirc;y l&agrave; năm thứ hai bảng xếp hạng &quot;Best Rising Stars of Science in the World&quot; được c&ocirc;ng bố. Bảng xếp hạng gồm danh s&aacute;ch 1.000 nh&agrave; khoa học h&agrave;ng đầu từ tất cả lĩnh vực nghi&ecirc;n cứu ch&iacute;nh, trong đ&oacute; thống k&ecirc; chỉ x&eacute;t người c&oacute; c&ocirc;ng bố đầu ti&ecirc;n trong 12 năm trở lại đ&acirc;y.</p>

<p>Trong số 7 nh&agrave; khoa học đang l&agrave;m việc tại Việt Nam c&oacute; t&ecirc;n, 5 người trong nước v&agrave; 2 người nước ngo&agrave;i, gồm: GS.TS Trần Xu&acirc;n B&aacute;ch (Đại học Y H&agrave; Nội, xếp hạng 2 thế giới); TS Trần Nguyễn Hải (trường Đại học Duy T&acirc;n, xếp hạng 603), TS Th&aacute;i Ho&agrave;ng Chiến (trường Đại học T&ocirc;n Đức Thắng, xếp hạng 621), TS Ph&ugrave;ng Văn Ph&uacute;c (Đại học C&ocirc;ng nghệ TP HCM, xếp hạng 762) v&agrave; TS Ho&agrave;ng Nhật Đức (trường Đại học Duy T&acirc;n, xếp hạng 968).</p>

<p><img alt="Các nhà khoa học đang làm việc tại Việt Nam có mặt trong danh sách. Ảnh chụp màn hình" src="https://i1-vnexpress.vnecdn.net/2023/12/02/A-nh-chu-p-Ma-n-hi-nh-2023-12-6341-5328-1701487784.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=NKQw7wLNyXgwa3sU1JQwpw" /></p>

<p>C&aacute;c nh&agrave; khoa học đang l&agrave;m việc tại Việt Nam c&oacute; mặt trong danh s&aacute;ch.&nbsp;<em>Ảnh chụp m&agrave;n h&igrave;nh</em></p>

<p>Theo danh s&aacute;ch, GS.TS Trần Xu&acirc;n B&aacute;ch, Đại học Y H&agrave; Nội, l&agrave; nh&agrave; khoa học của Việt Nam duy nhất c&oacute; mặt trong top 10 nh&agrave; khoa học đầu bảng (xếp hạng 2, tăng một bậc so với năm 2022), lĩnh vực Y học cộng đồng. Năm 2016, Trần Xu&acirc;n B&aacute;ch trở th&agrave;nh Ph&oacute; gi&aacute;o sư trẻ nhất Việt Nam ở tuổi 32. Năm 2015, anh được Trung t&acirc;m nghi&ecirc;n cứu AIDS, Đại học Johns Hopkins (Mỹ) trao giải thưởng Nghi&ecirc;n cứu quốc tế về l&acirc;m s&agrave;ng v&agrave; dự ph&ograve;ng. Anh được nhận giải thưởng Noam Chomsky - Giải thưởng về Th&agrave;nh tựu trong nghi&ecirc;n cứu 2020. PGS-TS Trần Xu&acirc;n B&aacute;ch đạt ti&ecirc;u chuẩn c&ocirc;ng nhận chức danh gi&aacute;o sư ng&agrave;nh y học v&agrave; l&agrave; 1 trong 3 người trẻ nhất được c&ocirc;ng nhận chức danh gi&aacute;o sư năm nay. Anh cũng l&agrave; nh&agrave; khoa học trong top 1% được tr&iacute;ch dẫn nhiều nhất của Clarivate năm 2023.</p>

<p><img alt="GS.TS Trần Xuân Bách. Ảnh: Fb nhân vật" src="https://i1-vnexpress.vnecdn.net/2023/12/02/260099267-10159550582228389-70-3808-6872-1701487785.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=LEqfK7S8lzIBSao5LpwFXA" /></p>

<p>GS.TS Trần Xu&acirc;n B&aacute;ch. Ảnh:&nbsp;<em>Fb nh&acirc;n vật</em></p>

<p>So với năm 2022, danh s&aacute;ch n&agrave;y c&oacute; số lượng nh&agrave; khoa học người Việt tăng th&ecirc;m 2 v&agrave; c&oacute; 3 gương mặt mới (gồm TS Trần Nguyễn Hải, TS Th&aacute;i Ho&agrave;ng Chiến v&agrave; TS Ho&agrave;ng Nhật Đức). C&oacute; hai nh&agrave; khoa học l&agrave; người nước ngo&agrave;i gồm Hossein Moayedi (trường Đại học Duy T&acirc;n, xếp hạng 306); Mohammad Ghalambaz (Trường Đại học T&ocirc;n Đức Thắng, xếp hạng 337).</p>

<p><img alt="TS Trần Nguyễn Hải, thành viên Ban biên tập cho 12 tạp chí quốc tế chuẩn ISI, là gương mặt mới vào danh sách năm 2023. Ảnh:Hai Tran" src="https://i1-vnexpress.vnecdn.net/2023/12/02/403606952-1520256508774009-200-4890-9723-1701487785.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=384QzHDru3bb10MXf0S7rw" /></p>

<p>TS Trần Nguyễn Hải, th&agrave;nh vi&ecirc;n Ban bi&ecirc;n tập cho 12 tạp ch&iacute; quốc tế chuẩn ISI, l&agrave; gương mặt mới v&agrave;o danh s&aacute;ch năm 2023. Ảnh:&nbsp;<em>Hai Tran</em></p>

<p>Trung Quốc l&agrave; quốc gia c&oacute; nhiều nh&agrave; khoa học nhất (353), sau đ&oacute; l&agrave; Mỹ (171), một số quốc gia kh&aacute;c như Iran (51), Anh (40), Australia (48), Đức (27), Singapore (26), H&agrave;n Quốc (15). Người dẫn đầu bảng xếp hạng l&agrave; Mohsen Sheikholeslami (Iran). Top 10 nh&agrave; khoa học dẫn đầu đến từ c&aacute;c quốc gia: Trung Quốc (5), Mỹ, Việt Nam, Italy, Iran, Pakistan (1).</p>

<p>Ti&ecirc;u ch&iacute; để một nh&agrave; khoa học được đ&aacute;nh gi&aacute; trong bảng xếp hạng to&agrave;n cầu dựa tr&ecirc;n chỉ số General H-index (chỉ số đ&aacute;nh gi&aacute; tr&ecirc;n cơ sở c&aacute;c b&agrave;i b&aacute;o khoa học v&agrave; gi&aacute; trị tr&iacute;ch dẫn tr&ecirc;n tất cả c&aacute;c chuy&ecirc;n ng&agrave;nh), tỷ lệ đ&oacute;ng g&oacute;p trong lĩnh vực nhất định, b&ecirc;n cạnh c&aacute;c giải thưởng v&agrave; th&agrave;nh tựu của họ.</p>

<p>Ở đợt xếp hạng lần n&agrave;y, Research.com xem x&eacute;t dữ liệu của 166.880 nh&agrave; khoa, c&oacute; năng suất c&ocirc;ng bố v&agrave; tr&iacute;ch dẫn h&agrave;ng đầu thế giới, sử dụng dữ liệu từ Google Scholar v&agrave; Microsoft Academic Graph. Chỉ 1.000 nh&agrave; khoa học h&agrave;ng đầu c&oacute; chỉ số H cao nhất mới được đưa v&agrave;o bảng xếp hạng. Research.com cho biết vị tr&iacute; xếp hạng kh&ocirc;ng phải l&agrave; thước đo tuyệt đối để định lượng sự đ&oacute;ng g&oacute;p của c&aacute;c nh&agrave; khoa học. Họ đối chiếu ch&eacute;o v&agrave; kiểm định từng nh&agrave; khoa học th&ocirc;ng qua một số ti&ecirc;u ch&iacute; phụ kh&aacute;c như số lượng c&ocirc;ng bố tại c&aacute;c tạp ch&iacute; lớn, kỷ yếu hội nghị để xem x&eacute;t c&aacute;c t&aacute;c động của họ trong một số chuy&ecirc;n ng&agrave;nh nhất định.</p>
', N'20170831151616-wave-alpha.jpg', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, 0, 0, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([IdRole], [RoleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Roles] ([IdRole], [RoleName]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Slides] ON 
GO
INSERT [dbo].[Slides] ([Id], [Title], [SloganTitle], [NameImg]) VALUES (3, N'TỐC ĐỘ VÀ ĐỘ BỀN, KHÔNG CÓ GIỚI HẠN', N'Chinh phục mọi nơi Thăng hoa cảm xúc', N'carousel-51.jpg')
GO
INSERT [dbo].[Slides] ([Id], [Title], [SloganTitle], [NameImg]) VALUES (4, N'SỨC MẠNH VÀ PHONG CÁCH, ĐỀU CÓ TRONG TỪNG CHUYẾN ĐI', N'BuyUrBike - Đối tác đồng hành trên mọi hành trình ', N'carousel-41.jpg')
GO
INSERT [dbo].[Slides] ([Id], [Title], [SloganTitle], [NameImg]) VALUES (5, N'TỰ DO VÀ LINH HOẠT MỌI LÚC, MỌI NƠI', N'Khám phá cuộc sống thông qua từng chuyến đi', N'carousel-31.jpg')
GO
INSERT [dbo].[Slides] ([Id], [Title], [SloganTitle], [NameImg]) VALUES (6, N'ewr', N'ưerwr', N'download.jpg')
GO
SET IDENTITY_INSERT [dbo].[Slides] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeBike] ON 
GO
INSERT [dbo].[TypeBike] ([IdType], [NameType]) VALUES (1, N'Xe máy')
GO
INSERT [dbo].[TypeBike] ([IdType], [NameType]) VALUES (2, N'Xe điện')
GO
INSERT [dbo].[TypeBike] ([IdType], [NameType]) VALUES (3, N'Xe tay ga')
GO
INSERT [dbo].[TypeBike] ([IdType], [NameType]) VALUES (4, N'Xe thể thao')
GO
SET IDENTITY_INSERT [dbo].[TypeBike] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([IdUser], [UserName], [Password], [DisplayName], [Phone], [RoleId]) VALUES (1, N'admin', N'21232f297a57a5a743894a0e4a801fc3', N'admin', N'0665685', 1)
GO
INSERT [dbo].[Users] ([IdUser], [UserName], [Password], [DisplayName], [Phone], [RoleId]) VALUES (2, N'dangnam', N'6ba6f33a6c1112128dbfec91adbeb7ec', N'dangnam', N'0665685', 2)
GO
INSERT [dbo].[Users] ([IdUser], [UserName], [Password], [DisplayName], [Phone], [RoleId]) VALUES (3, N'123', N'202cb962ac59075b964b07152d234b70', N'123', N'123', 2)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Bike_IdType]    Script Date: 12/13/2023 1:03:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bike_IdType] ON [dbo].[Bike]
(
	[IdType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Carts_IdBike]    Script Date: 12/13/2023 1:03:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Carts_IdBike] ON [dbo].[Carts]
(
	[IdBike] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Carts_IdUser]    Script Date: 12/13/2023 1:03:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Carts_IdUser] ON [dbo].[Carts]
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Post_MenuID]    Script Date: 12/13/2023 1:03:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Post_MenuID] ON [dbo].[Post]
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_RoleId]    Script Date: 12/13/2023 1:03:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bike]  WITH CHECK ADD  CONSTRAINT [FK_Bike_TypeBike_IdType] FOREIGN KEY([IdType])
REFERENCES [dbo].[TypeBike] ([IdType])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bike] CHECK CONSTRAINT [FK_Bike_TypeBike_IdType]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Users_IdUser] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([IdUser])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Users_IdUser]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Menu_MenuID] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menu] ([MenuID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Menu_MenuID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([IdRole])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
USE [master]
GO
ALTER DATABASE [webbanxe1] SET  READ_WRITE 
GO
