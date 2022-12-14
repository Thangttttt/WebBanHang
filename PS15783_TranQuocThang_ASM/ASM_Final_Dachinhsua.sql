USE [master]
GO
/****** Object:  Database [shop]    Script Date: 6/18/2022 4:27:26 PM ******/
CREATE DATABASE [shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [shop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [shop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [shop] SET  MULTI_USER 
GO
ALTER DATABASE [shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shop] SET QUERY_STORE = OFF
GO
USE [shop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 6/18/2022 4:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Fullname] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Admin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/18/2022 4:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/18/2022 4:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NULL,
	[ProductId] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/18/2022 4:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[Address] [nvarchar](100) NULL,
	[Sdt] [nvarchar](10) NULL,
	[Paid] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/18/2022 4:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
	[Price] [float] NULL,
	[CreateDate] [datetime] NULL,
	[CategoryId] [char](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Admin]) VALUES (N'admin1', N'123', N'Nguyễn Văn Tèo', N'teonv@gmail', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Admin]) VALUES (N'admin2', N'567', N'Đỗ Tuấn Huy', N'letuanhuy640@gmail.com', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Admin]) VALUES (N'admin3', N'899', N'Lê Văn Đua', N'vanduale4@gmail.com', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Admin]) VALUES (N'user1', N'9999', N'Trần Quốc Thắng', N'tranquocthang972002@gmail.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Admin]) VALUES (N'user2', N'abcd', N'Nguyễn Bảo Ngọc', N'baongocn434@gmail.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Admin]) VALUES (N'user3', N'3792', N'Lê Hồng Thắm', N'lehongtham4345@gmail.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Admin]) VALUES (N'user4', N'aaa', N'Vo Chi Cuong', N'ccc@gmail.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Admin]) VALUES (N'user8', N'111', N'Vo Chi Cuong111', N'tranquocthang972002@gmail.com', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (N's1  ', N'Thời Trang Nam & Nữ', N'product-1.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (N's2  ', N'Phụ Kiện & Di Động', N'pk&dd1.webp')
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (N's3  ', N'Điện Tử', N'dt1.webp')
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (N's4  ', N'Quần Áo Trẻ Em', N'te1.webp')
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (N's5  ', N'Y Tế', N'y1.webp')
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (N's6  ', N'Mỹ Phẩm', N'mp1.webp')
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (N's7  ', N'Đồ Chơi', N'dc1.webp')
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (2, 7, 2, 99, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (3, 7, 3, 100, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (4, 22, 3, 100, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (5, 23, 3, 100, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (6, 23, 4, 150, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (7, 25, 6, 300, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (8, 27, 3, 100, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (9, 28, 6, 300, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (10, 29, 3, 100, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (11, 29, 6, 300, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (12, 29, 10, 1000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (13, 30, 5, 200, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (14, 31, 1, 99, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (15, 32, 3, 100, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (16, 33, 6, 300, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (17, 34, 2, 99, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (18, 34, 7, 240, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (19, 34, 11, 1200, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (20, 35, 5, 200, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (21, 35, 15, 1234, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (22, 36, 1, 99, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (23, 36, 10, 1000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (24, 37, 1, 99, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (25, 37, 2, 99, 2)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Sdt], [Paid]) VALUES (1, N'user1', CAST(N'2022-02-02T00:00:00.000' AS DateTime), N'123 Quang Trung', N'0375273911', 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Sdt], [Paid]) VALUES (2, N'user2', CAST(N'2022-02-02T00:00:00.000' AS DateTime), N'18A Dong An Binh Hoa Thuan An', N'0328162039', 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Sdt], [Paid]) VALUES (3, N'user3', CAST(N'2022-02-02T00:00:00.000' AS DateTime), N'Tinh Bien An Giang', N'0368275035', 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Sdt], [Paid]) VALUES (7, N'user1', CAST(N'2022-06-16T00:00:00.000' AS DateTime), N'fhcg', N'2222', 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Sdt], [Paid]) VALUES (22, N'user1', CAST(N'2022-06-16T00:00:00.000' AS DateTime), N'uduud', N'9999', 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Sdt], [Paid]) VALUES (23, N'user1', CAST(N'2022-06-16T00:00:00.000' AS DateTime), N'ididi', N'2828', 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Sdt], [Paid]) VALUES (25, N'user1', CAST(N'2022-06-16T00:00:00.000' AS DateTime), N'hdjjd', N'8878', 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Sdt], [Paid]) VALUES (27, N'user2', CAST(N'2022-06-12T00:00:00.000' AS DateTime), N'Ha Noi', N'0375289475', 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Sdt], [Paid]) VALUES (28, N'user2', CAST(N'2022-06-11T00:00:00.000' AS DateTime), N'Tp HCM', N'036573849', 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Sdt], [Paid]) VALUES (29, N'user3', CAST(N'2022-06-17T00:00:00.000' AS DateTime), N'An Giang ', N'037562865', 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Sdt], [Paid]) VALUES (30, N'user2', CAST(N'2022-06-17T00:00:00.000' AS DateTime), N'Vinh Long', N'2222', 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Sdt], [Paid]) VALUES (31, N'user2', CAST(N'2022-06-17T00:00:00.000' AS DateTime), N'aaa', N'44444', 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Sdt], [Paid]) VALUES (32, N'user2', CAST(N'2022-06-17T00:00:00.000' AS DateTime), N'aaaaa', N'9999', 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Sdt], [Paid]) VALUES (33, N'user2', CAST(N'2022-06-17T00:00:00.000' AS DateTime), N'quan 12 ', N'44444', 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Sdt], [Paid]) VALUES (34, N'user2', CAST(N'2022-06-18T00:00:00.000' AS DateTime), N'HCM Cyti', N'44444', 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Sdt], [Paid]) VALUES (35, N'user2', CAST(N'2022-06-18T00:00:00.000' AS DateTime), N'HCM Q12', N'037562891', 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Sdt], [Paid]) VALUES (36, N'user8', CAST(N'2022-06-18T00:00:00.000' AS DateTime), N'aaaaa', N'44444', 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Sdt], [Paid]) VALUES (37, N'user8', CAST(N'2022-06-18T00:00:00.000' AS DateTime), N'aaaaa', N'44444', 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (1, N'Váy Đen', N'product-1.jpg', 99, CAST(N'2019-01-19T00:00:00.000' AS DateTime), N's1  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (2, N'Áo Nữ Xanh', N'product-2.jpg', 99, CAST(N'2019-02-20T00:00:00.000' AS DateTime), N's1  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (3, N'Đầm Nữ', N'product-3.jpg', 100, CAST(N'2019-03-21T00:00:00.000' AS DateTime), N's1  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (4, N'Áo Nâu', N'product-4.jpg', 150, CAST(N'2019-04-22T00:00:00.000' AS DateTime), N's1  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (5, N'Quần Jaean & Áo', N'product-5.jpg', 200, CAST(N'2019-05-23T00:00:00.000' AS DateTime), N's1  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (6, N'Quần Jean Đôi', N'product-6.jpg', 300, CAST(N'2019-06-24T00:00:00.000' AS DateTime), N's1  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (7, N'Áo Khoác Nữ ', N'product-7.jpg', 240, CAST(N'2019-07-25T00:00:00.000' AS DateTime), N's1  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (8, N'Áo Nữ Đen', N'product-8.jpg', 120, CAST(N'2019-08-23T00:00:00.000' AS DateTime), N's1  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (9, N'Á Thun Nữ', N'product-9.jpg', 170, CAST(N'2019-09-23T00:00:00.000' AS DateTime), N's1  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (10, N'Iphone 11 ', N'pk&dd1.webp', 1000, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's2  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (11, N'Iphone 13 Pro', N'pk&dd2.webp', 1200, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's2  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (12, N'Smart Phone X', N'pk&dd3.webp', 1300, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's2  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (13, N'Máy tính bảng X', N'pk&dd4.webp', 1240, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's2  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (14, N'May Tính Bảng AX', N'pk&dd5.webp', 1220, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's2  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (15, N'May Tính Bảng SS', N'pk&dd6.webp', 1234, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's2  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (16, N'May Tính Bảng BB', N'pk&dd7.webp', 2200, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's2  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (17, N'May Tính Bảng CC', N'pk&dd8.webp', 3000, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's2  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (18, N'May Tính Bảng LL', N'pk&dd9.webp', 2100, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's2  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (19, N'Điện Tử 1', N'dt1.webp', 100, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's3  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (20, N'Điện Tử 2', N'dt2.webp', 100, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's3  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (21, N'Điện Tử 3', N'dt3.webp', 110, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's3  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (22, N'Điện Tử 4', N'dt4.webp', 50, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's3  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (23, N'Điện Tử 5', N'dt5.webp', 70, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's3  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (24, N'Điện Tử 6', N'dt6.webp', 80, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's3  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (25, N'Điện Tử 7', N'dt7.webp', 55, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's3  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (26, N'Điện Tử 8', N'dt8.webp', 140, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's3  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (27, N'Điện Tử 9', N'dt9.webp', 111, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's3  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (28, N'QA & TE 1', N'te1.webp', 20, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's4  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (29, N'QA & TE 2', N'te2.webp', 25, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's4  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (30, N'QA & TE 3', N'te3.webp', 22, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's4  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (31, N'QA & TE 4', N'te4.webp', 17, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's4  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (32, N'QA & TE 5', N'te5.webp', 43, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's4  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (33, N'QA & TE 6', N'te6.webp', 34, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's4  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (34, N' QA & TE 7', N'te7.webp', 22, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's4  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (35, N'QA & TE 8', N'te8.webp', 67, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's4  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (36, N'QA & TE 9', N'te9.webp', 36, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's4  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (37, N'YT 1 ', N'y1.webp', 13, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's5  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (38, N'YT 2', N'y2.webp', 32, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's5  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (39, N'YT3', N'y3.webp', 22, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's5  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (40, N'YT4', N'y4.webp', 15, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's5  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (41, N'YT5', N'y5.webp', 46, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's5  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (42, N'YT6', N'y6.webp', 36, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's5  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (43, N'YT7', N'y7.webp', 25, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's5  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (44, N'YT8', N'y8.webp', 73, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's5  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (45, N'YT9', N'y9.webp', 23, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's5  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (46, N'MỸ PHẨM 1', N'mp1.webp', 65, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's6  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (47, N'MỸ PHẨM 2', N'mp2.webp', 24, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's6  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (48, N'MỸ PHẨM 3', N'mp3.webp', 22, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's6  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (49, N'MỸ PHẨM 4', N'mp4.webp', 15, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's6  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (50, N'MỸ PHẨM 5', N'mp5.webp', 17, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's6  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (51, N'MỸ PHẨM 6', N'mp6.webp', 33, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's6  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (52, N'MỸ PHẨM 7', N'mp7.webp', 45, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's6  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (53, N'MỸ PHẨM 8', N'mp8.webp', 42, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's6  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (54, N'MỸ PHẨM 9', N'mp9.webp', 25, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's6  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (55, N'ĐỒ CHƠI 1', N'dc1.webp', 8, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's7  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (56, N'ĐỒ CHƠI 2', N'dc2.webp', 6, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's7  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (57, N'ĐỒ CHƠI 3', N'dc3.webp', 12, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's7  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (58, N' ĐỒ CHƠI 4', N'dc4.webp', 16, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's7  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (59, N'ĐỒ CHƠI 5', N'dc5.webp', 22, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's7  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (60, N'ĐỒ CHƠI 6', N'dc6.webp', 13, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's7  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (61, N'ĐỒ CHƠI 7', N'dc7.webp', 32, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's7  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (62, N'ĐỒ CHƠI 8', N'dc8.webp', 25, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's7  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (63, N'ĐỒ CHƠI 9', N'dc9.webp', 28, CAST(N'2019-10-23T00:00:00.000' AS DateTime), N's7  ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [CategoryId]) VALUES (71, N'Quoc Thang', N'avax walet.png', 11111, CAST(N'2022-06-18T00:00:00.000' AS DateTime), N's1  ')
SET IDENTITY_INSERT [dbo].[Products] OFF
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
USE [master]
GO
ALTER DATABASE [shop] SET  READ_WRITE 
GO
