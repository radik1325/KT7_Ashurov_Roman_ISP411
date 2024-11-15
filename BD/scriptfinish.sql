USE [master]
GO
/****** Object:  Database [MasterPolData]    Script Date: 14.11.2024 13:25:35 ******/
CREATE DATABASE [MasterPolData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MasterPolData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MasterPolData.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MasterPolData_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MasterPolData_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MasterPolData] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MasterPolData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MasterPolData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MasterPolData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MasterPolData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MasterPolData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MasterPolData] SET ARITHABORT OFF 
GO
ALTER DATABASE [MasterPolData] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MasterPolData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MasterPolData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MasterPolData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MasterPolData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MasterPolData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MasterPolData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MasterPolData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MasterPolData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MasterPolData] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MasterPolData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MasterPolData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MasterPolData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MasterPolData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MasterPolData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MasterPolData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MasterPolData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MasterPolData] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MasterPolData] SET  MULTI_USER 
GO
ALTER DATABASE [MasterPolData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MasterPolData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MasterPolData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MasterPolData] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MasterPolData] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MasterPolData] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MasterPolData] SET QUERY_STORE = OFF
GO
USE [MasterPolData]
GO
/****** Object:  Table [dbo].[AdressPartners]    Script Date: 14.11.2024 13:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdressPartners](
	[AdressPartnerId] [int] IDENTITY(1,1) NOT NULL,
	[AdressPartnerIndex] [nvarchar](50) NOT NULL,
	[AdressPartnerIdArea] [int] NOT NULL,
	[AdressPartnerIdCity] [int] NOT NULL,
	[AdressPartnerIdStreet] [int] NOT NULL,
	[AdressPartnerIdHouse] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AdressPartners] PRIMARY KEY CLUSTERED 
(
	[AdressPartnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 14.11.2024 13:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[AreaId] [int] IDENTITY(1,1) NOT NULL,
	[AreaName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[AreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 14.11.2024 13:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DirectorPartners]    Script Date: 14.11.2024 13:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DirectorPartners](
	[DirectorPartnersId] [int] IDENTITY(1,1) NOT NULL,
	[DirectorPartnersName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_DirectorPartners] PRIMARY KEY CLUSTERED 
(
	[DirectorPartnersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 14.11.2024 13:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[MaterialTypeId] [nvarchar](100) NOT NULL,
	[MaterialTypeProcentBraka] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[MaterialTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerProduct]    Script Date: 14.11.2024 13:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerProduct](
	[PartnerProductId] [int] NOT NULL,
	[PartnerProductProductId] [int] NOT NULL,
	[PartnerProductPartnerId] [int] NOT NULL,
	[PartnerProductCountProduct] [int] NOT NULL,
	[PartnerProductDate] [date] NOT NULL,
 CONSTRAINT [PK_PartnerProduct] PRIMARY KEY CLUSTERED 
(
	[PartnerProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 14.11.2024 13:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[PartnerId] [int] IDENTITY(1,1) NOT NULL,
	[PartnerTypeId] [int] NOT NULL,
	[PartnerName] [nvarchar](100) NOT NULL,
	[PartnerDirectorId] [int] NOT NULL,
	[PartnerEmail] [nvarchar](100) NOT NULL,
	[PartnerPhone] [nvarchar](50) NOT NULL,
	[PartnerAdressId] [int] NOT NULL,
	[PartnerINN] [nvarchar](50) NULL,
	[PartnerRating] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[PartnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 14.11.2024 13:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductsId] [int] NOT NULL,
	[ProductsTypeId] [int] NOT NULL,
	[ProductsName] [nvarchar](250) NOT NULL,
	[ProductsArticul] [nvarchar](50) NOT NULL,
	[ProductsMinCost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Street]    Script Date: 14.11.2024 13:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Street](
	[StreetId] [int] IDENTITY(1,1) NOT NULL,
	[StreetName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Street] PRIMARY KEY CLUSTERED 
(
	[StreetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypePartners]    Script Date: 14.11.2024 13:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypePartners](
	[TypePartnerId] [int] NOT NULL,
	[TypePartnerName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypePartners] PRIMARY KEY CLUSTERED 
(
	[TypePartnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeProducts]    Script Date: 14.11.2024 13:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeProducts](
	[TypeProductId] [int] NOT NULL,
	[TypeProductName] [nvarchar](100) NOT NULL,
	[TypeProductKoef] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TypeProducts] PRIMARY KEY CLUSTERED 
(
	[TypeProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdressPartners] ON 

INSERT [dbo].[AdressPartners] ([AdressPartnerId], [AdressPartnerIndex], [AdressPartnerIdArea], [AdressPartnerIdCity], [AdressPartnerIdStreet], [AdressPartnerIdHouse]) VALUES (1, N'652050', 3, 5, 1, N'15')
INSERT [dbo].[AdressPartners] ([AdressPartnerId], [AdressPartnerIndex], [AdressPartnerIdArea], [AdressPartnerIdCity], [AdressPartnerIdStreet], [AdressPartnerIdHouse]) VALUES (2, N'309500', 2, 4, 3, N'122')
INSERT [dbo].[AdressPartners] ([AdressPartnerId], [AdressPartnerIndex], [AdressPartnerIdArea], [AdressPartnerIdCity], [AdressPartnerIdStreet], [AdressPartnerIdHouse]) VALUES (3, N'164500', 1, 3, 5, N'18')
INSERT [dbo].[AdressPartners] ([AdressPartnerId], [AdressPartnerIndex], [AdressPartnerIdArea], [AdressPartnerIdCity], [AdressPartnerIdStreet], [AdressPartnerIdHouse]) VALUES (4, N'143960', 5, 2, 4, N'51')
INSERT [dbo].[AdressPartners] ([AdressPartnerId], [AdressPartnerIndex], [AdressPartnerIdArea], [AdressPartnerIdCity], [AdressPartnerIdStreet], [AdressPartnerIdHouse]) VALUES (5, N'188910', 4, 1, 2, N'21')
SET IDENTITY_INSERT [dbo].[AdressPartners] OFF
GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([AreaId], [AreaName]) VALUES (1, N'Архангельская область')
INSERT [dbo].[Area] ([AreaId], [AreaName]) VALUES (2, N'Белгородская область')
INSERT [dbo].[Area] ([AreaId], [AreaName]) VALUES (3, N'Кемеровская область')
INSERT [dbo].[Area] ([AreaId], [AreaName]) VALUES (4, N'Ленинградская область')
INSERT [dbo].[Area] ([AreaId], [AreaName]) VALUES (5, N'Московская область')
SET IDENTITY_INSERT [dbo].[Area] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityId], [CityName]) VALUES (1, N'Город Приморск')
INSERT [dbo].[City] ([CityId], [CityName]) VALUES (2, N'Город Реутов')
INSERT [dbo].[City] ([CityId], [CityName]) VALUES (3, N'Город Северодвинск')
INSERT [dbo].[City] ([CityId], [CityName]) VALUES (4, N'Город Старый Оскол')
INSERT [dbo].[City] ([CityId], [CityName]) VALUES (5, N'Город Юрга')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[DirectorPartners] ON 

INSERT [dbo].[DirectorPartners] ([DirectorPartnersId], [DirectorPartnersName]) VALUES (1, N'Воробьева Екатерина Валерьевна')
INSERT [dbo].[DirectorPartners] ([DirectorPartnersId], [DirectorPartnersName]) VALUES (2, N'Иванова Александра Ивановна')
INSERT [dbo].[DirectorPartners] ([DirectorPartnersId], [DirectorPartnersName]) VALUES (3, N'Петров Василий Петрович')
INSERT [dbo].[DirectorPartners] ([DirectorPartnersId], [DirectorPartnersName]) VALUES (4, N'Соловьев Андрей Николаевич')
INSERT [dbo].[DirectorPartners] ([DirectorPartnersId], [DirectorPartnersName]) VALUES (5, N'Степанов Степан Сергеевич')
SET IDENTITY_INSERT [dbo].[DirectorPartners] OFF
GO
INSERT [dbo].[MaterialType] ([MaterialTypeId], [MaterialTypeProcentBraka]) VALUES (N'Тип материала 1', CAST(0.10 AS Decimal(18, 2)))
INSERT [dbo].[MaterialType] ([MaterialTypeId], [MaterialTypeProcentBraka]) VALUES (N'Тип материала 2', CAST(0.95 AS Decimal(18, 2)))
INSERT [dbo].[MaterialType] ([MaterialTypeId], [MaterialTypeProcentBraka]) VALUES (N'Тип материала 3', CAST(0.28 AS Decimal(18, 2)))
INSERT [dbo].[MaterialType] ([MaterialTypeId], [MaterialTypeProcentBraka]) VALUES (N'Тип материала 4', CAST(0.55 AS Decimal(18, 2)))
INSERT [dbo].[MaterialType] ([MaterialTypeId], [MaterialTypeProcentBraka]) VALUES (N'Тип материала 5', CAST(0.34 AS Decimal(18, 2)))
GO
INSERT [dbo].[PartnerProduct] ([PartnerProductId], [PartnerProductProductId], [PartnerProductPartnerId], [PartnerProductCountProduct], [PartnerProductDate]) VALUES (1, 1, 1, 15500, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[PartnerProduct] ([PartnerProductId], [PartnerProductProductId], [PartnerProductPartnerId], [PartnerProductCountProduct], [PartnerProductDate]) VALUES (2, 3, 1, 12350, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[PartnerProduct] ([PartnerProductId], [PartnerProductProductId], [PartnerProductPartnerId], [PartnerProductCountProduct], [PartnerProductDate]) VALUES (3, 4, 1, 37400, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProduct] ([PartnerProductId], [PartnerProductProductId], [PartnerProductPartnerId], [PartnerProductCountProduct], [PartnerProductDate]) VALUES (4, 2, 3, 35000, CAST(N'2022-12-02' AS Date))
INSERT [dbo].[PartnerProduct] ([PartnerProductId], [PartnerProductProductId], [PartnerProductPartnerId], [PartnerProductCountProduct], [PartnerProductDate]) VALUES (5, 5, 3, 1250, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[PartnerProduct] ([PartnerProductId], [PartnerProductProductId], [PartnerProductPartnerId], [PartnerProductCountProduct], [PartnerProductDate]) VALUES (6, 3, 3, 1000, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProduct] ([PartnerProductId], [PartnerProductProductId], [PartnerProductPartnerId], [PartnerProductCountProduct], [PartnerProductDate]) VALUES (7, 1, 3, 7550, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[PartnerProduct] ([PartnerProductId], [PartnerProductProductId], [PartnerProductPartnerId], [PartnerProductCountProduct], [PartnerProductDate]) VALUES (8, 1, 5, 7250, CAST(N'2023-01-22' AS Date))
INSERT [dbo].[PartnerProduct] ([PartnerProductId], [PartnerProductProductId], [PartnerProductPartnerId], [PartnerProductCountProduct], [PartnerProductDate]) VALUES (9, 2, 5, 2500, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[PartnerProduct] ([PartnerProductId], [PartnerProductProductId], [PartnerProductPartnerId], [PartnerProductCountProduct], [PartnerProductDate]) VALUES (10, 4, 4, 59050, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[PartnerProduct] ([PartnerProductId], [PartnerProductProductId], [PartnerProductPartnerId], [PartnerProductCountProduct], [PartnerProductDate]) VALUES (11, 3, 4, 37200, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[PartnerProduct] ([PartnerProductId], [PartnerProductProductId], [PartnerProductPartnerId], [PartnerProductCountProduct], [PartnerProductDate]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[PartnerProduct] ([PartnerProductId], [PartnerProductProductId], [PartnerProductPartnerId], [PartnerProductCountProduct], [PartnerProductDate]) VALUES (13, 3, 2, 50000, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[PartnerProduct] ([PartnerProductId], [PartnerProductProductId], [PartnerProductPartnerId], [PartnerProductCountProduct], [PartnerProductDate]) VALUES (14, 4, 2, 670000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[PartnerProduct] ([PartnerProductId], [PartnerProductProductId], [PartnerProductPartnerId], [PartnerProductCountProduct], [PartnerProductDate]) VALUES (15, 1, 2, 35000, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[PartnerProduct] ([PartnerProductId], [PartnerProductProductId], [PartnerProductPartnerId], [PartnerProductCountProduct], [PartnerProductDate]) VALUES (16, 2, 2, 25000, CAST(N'2024-06-12' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([PartnerId], [PartnerTypeId], [PartnerName], [PartnerDirectorId], [PartnerEmail], [PartnerPhone], [PartnerAdressId], [PartnerINN], [PartnerRating]) VALUES (1, 1, N'База Строитель', 2, N'aleksandraivanova@ml.ru', N'4931234567', 1, N'2222455179', N'7')
INSERT [dbo].[Partners] ([PartnerId], [PartnerTypeId], [PartnerName], [PartnerDirectorId], [PartnerEmail], [PartnerPhone], [PartnerAdressId], [PartnerINN], [PartnerRating]) VALUES (2, 1, N'МонтажПро', 5, N'stepanov@stepan.ru', N'9128883333', 2, N'5552431140', N'10')
INSERT [dbo].[Partners] ([PartnerId], [PartnerTypeId], [PartnerName], [PartnerDirectorId], [PartnerEmail], [PartnerPhone], [PartnerAdressId], [PartnerINN], [PartnerRating]) VALUES (3, 3, N'Паркет 29', 3, N'vppetrov@vl.ru', N'9871235678', 3, N'3333888520', N'7')
INSERT [dbo].[Partners] ([PartnerId], [PartnerTypeId], [PartnerName], [PartnerDirectorId], [PartnerEmail], [PartnerPhone], [PartnerAdressId], [PartnerINN], [PartnerRating]) VALUES (4, 2, N'Ремонт и отделка', 1, N'ekaterina.vorobeva@ml.ru', N'4442223311', 4, N'1111520857', N'5')
INSERT [dbo].[Partners] ([PartnerId], [PartnerTypeId], [PartnerName], [PartnerDirectorId], [PartnerEmail], [PartnerPhone], [PartnerAdressId], [PartnerINN], [PartnerRating]) VALUES (5, 4, N'Стройсервис', 4, N'ansolovev@st.ru', N'8122233200', 5, N'4440391035', N'7')
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
INSERT [dbo].[Products] ([ProductsId], [ProductsTypeId], [ProductsName], [ProductsArticul], [ProductsMinCost]) VALUES (1, 3, N'Паркетная доска Ясень темный однополосная 14 мм', N'8758385', CAST(4456.90 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ProductsId], [ProductsTypeId], [ProductsName], [ProductsArticul], [ProductsMinCost]) VALUES (2, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', N'8858958', CAST(7330.99 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ProductsId], [ProductsTypeId], [ProductsName], [ProductsArticul], [ProductsMinCost]) VALUES (3, 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', N'7750282', CAST(1799.33 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ProductsId], [ProductsTypeId], [ProductsName], [ProductsArticul], [ProductsMinCost]) VALUES (4, 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', N'7028748', CAST(3890.41 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ProductsId], [ProductsTypeId], [ProductsName], [ProductsArticul], [ProductsMinCost]) VALUES (5, 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', N'5012543', CAST(5450.59 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Street] ON 

INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (1, N'Улица Лесная')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (2, N'Улица Парковая')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (3, N'Улица Рабочая')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (4, N'Улица Свободы')
INSERT [dbo].[Street] ([StreetId], [StreetName]) VALUES (5, N'Улица Строителей')
SET IDENTITY_INSERT [dbo].[Street] OFF
GO
INSERT [dbo].[TypePartners] ([TypePartnerId], [TypePartnerName]) VALUES (1, N'ЗАО')
INSERT [dbo].[TypePartners] ([TypePartnerId], [TypePartnerName]) VALUES (2, N'ОАО')
INSERT [dbo].[TypePartners] ([TypePartnerId], [TypePartnerName]) VALUES (3, N'ООО')
INSERT [dbo].[TypePartners] ([TypePartnerId], [TypePartnerName]) VALUES (4, N'ПАО')
GO
INSERT [dbo].[TypeProducts] ([TypeProductId], [TypeProductName], [TypeProductKoef]) VALUES (1, N'Ламинат', CAST(2.35 AS Decimal(18, 2)))
INSERT [dbo].[TypeProducts] ([TypeProductId], [TypeProductName], [TypeProductKoef]) VALUES (2, N'Массивная доска', CAST(5.15 AS Decimal(18, 2)))
INSERT [dbo].[TypeProducts] ([TypeProductId], [TypeProductName], [TypeProductKoef]) VALUES (3, N'Паркетная доска', CAST(4.34 AS Decimal(18, 2)))
INSERT [dbo].[TypeProducts] ([TypeProductId], [TypeProductName], [TypeProductKoef]) VALUES (4, N'Пробковое покрытие', CAST(1.50 AS Decimal(18, 2)))
GO
ALTER TABLE [dbo].[AdressPartners]  WITH CHECK ADD  CONSTRAINT [FK_AdressPartners_Area] FOREIGN KEY([AdressPartnerIdArea])
REFERENCES [dbo].[Area] ([AreaId])
GO
ALTER TABLE [dbo].[AdressPartners] CHECK CONSTRAINT [FK_AdressPartners_Area]
GO
ALTER TABLE [dbo].[AdressPartners]  WITH CHECK ADD  CONSTRAINT [FK_AdressPartners_City] FOREIGN KEY([AdressPartnerIdCity])
REFERENCES [dbo].[City] ([CityId])
GO
ALTER TABLE [dbo].[AdressPartners] CHECK CONSTRAINT [FK_AdressPartners_City]
GO
ALTER TABLE [dbo].[AdressPartners]  WITH CHECK ADD  CONSTRAINT [FK_AdressPartners_Street] FOREIGN KEY([AdressPartnerIdStreet])
REFERENCES [dbo].[Street] ([StreetId])
GO
ALTER TABLE [dbo].[AdressPartners] CHECK CONSTRAINT [FK_AdressPartners_Street]
GO
ALTER TABLE [dbo].[PartnerProduct]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProduct_Partners] FOREIGN KEY([PartnerProductProductId])
REFERENCES [dbo].[Partners] ([PartnerId])
GO
ALTER TABLE [dbo].[PartnerProduct] CHECK CONSTRAINT [FK_PartnerProduct_Partners]
GO
ALTER TABLE [dbo].[PartnerProduct]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProduct_Products] FOREIGN KEY([PartnerProductProductId])
REFERENCES [dbo].[Products] ([ProductsId])
GO
ALTER TABLE [dbo].[PartnerProduct] CHECK CONSTRAINT [FK_PartnerProduct_Products]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_AdressPartners] FOREIGN KEY([PartnerAdressId])
REFERENCES [dbo].[AdressPartners] ([AdressPartnerId])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_AdressPartners]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_DirectorPartners] FOREIGN KEY([PartnerDirectorId])
REFERENCES [dbo].[DirectorPartners] ([DirectorPartnersId])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_DirectorPartners]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_TypePartners] FOREIGN KEY([PartnerTypeId])
REFERENCES [dbo].[TypePartners] ([TypePartnerId])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_TypePartners]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_TypeProducts] FOREIGN KEY([ProductsTypeId])
REFERENCES [dbo].[TypeProducts] ([TypeProductId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_TypeProducts]
GO
USE [master]
GO
ALTER DATABASE [MasterPolData] SET  READ_WRITE 
GO
