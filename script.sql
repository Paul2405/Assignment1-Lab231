USE [master]
GO
/****** Object:  Database [LAB231_ASS1]    Script Date: 5/25/2021 9:30:05 AM ******/
CREATE DATABASE [LAB231_ASS1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LAB231_ASS1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LAB231_ASS1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LAB231_ASS1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LAB231_ASS1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LAB231_ASS1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LAB231_ASS1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LAB231_ASS1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET ARITHABORT OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LAB231_ASS1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LAB231_ASS1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LAB231_ASS1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LAB231_ASS1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET RECOVERY FULL 
GO
ALTER DATABASE [LAB231_ASS1] SET  MULTI_USER 
GO
ALTER DATABASE [LAB231_ASS1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LAB231_ASS1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LAB231_ASS1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LAB231_ASS1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LAB231_ASS1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LAB231_ASS1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LAB231_ASS1', N'ON'
GO
ALTER DATABASE [LAB231_ASS1] SET QUERY_STORE = OFF
GO
USE [LAB231_ASS1]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/25/2021 9:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](150) NOT NULL,
	[CategoryDescription] [varchar](max) NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rent]    Script Date: 5/25/2021 9:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[NumberOfRentalDay] [int] NOT NULL,
	[RentDate] [date] NOT NULL,
	[Status] [nchar](25) NOT NULL,
 CONSTRAINT [PK_Rent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 5/25/2021 9:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Color] [varchar](150) NOT NULL,
	[Quantity] [int] NOT NULL,
	[UsingDate] [int] NOT NULL,
	[Description] [varchar](250) NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/25/2021 9:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nchar](25) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [nvarchar](80) NOT NULL,
	[Phone] [nchar](10) NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Role] [nchar](10) NOT NULL,
	[Status] [nchar](10) NOT NULL,
 CONSTRAINT [PK_User1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CategoryName], [CategoryDescription], [CategoryId]) VALUES (1, N'Office', N'everything in office', NULL)
INSERT [dbo].[Category] ([Id], [CategoryName], [CategoryDescription], [CategoryId]) VALUES (2, N'Entertainment', N'To watch video or sing', NULL)
INSERT [dbo].[Category] ([Id], [CategoryName], [CategoryDescription], [CategoryId]) VALUES (3, N'Paper documents', N'Document about some field in your company', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Rent] ON 

INSERT [dbo].[Rent] ([Id], [ResourceId], [UserId], [NumberOfRentalDay], [RentDate], [Status]) VALUES (4, 2, 15, 2, CAST(N'2021-05-20' AS Date), N'inactive                 ')
INSERT [dbo].[Rent] ([Id], [ResourceId], [UserId], [NumberOfRentalDay], [RentDate], [Status]) VALUES (5, 1, 15, 3, CAST(N'2021-05-19' AS Date), N'rejected                 ')
SET IDENTITY_INSERT [dbo].[Rent] OFF
GO
SET IDENTITY_INSERT [dbo].[Resource] ON 

INSERT [dbo].[Resource] ([Id], [Name], [Color], [Quantity], [UsingDate], [Description], [CategoryId]) VALUES (1, N'Table', N'yellow', 12, 21, N'Not inlude chair', 1)
INSERT [dbo].[Resource] ([Id], [Name], [Color], [Quantity], [UsingDate], [Description], [CategoryId]) VALUES (2, N'Chair', N'grow', 10, 10, N'Not include chair', 1)
SET IDENTITY_INSERT [dbo].[Resource] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserID], [Password], [Name], [Phone], [Address], [CreateDate], [Role], [Status]) VALUES (1, N'manager                  ', N'123', N'Paul', N'0356266031', N'TP.HCM', CAST(N'2021-05-11' AS Date), N'manager   ', N'active    ')
INSERT [dbo].[User] ([Id], [UserID], [Password], [Name], [Phone], [Address], [CreateDate], [Role], [Status]) VALUES (5, N'employee                 ', N'123', N'King', N'0356266031', N'TP.Thủ Đức', CAST(N'2021-05-11' AS Date), N'employee  ', N'enable    ')
INSERT [dbo].[User] ([Id], [UserID], [Password], [Name], [Phone], [Address], [CreateDate], [Role], [Status]) VALUES (15, N'haudqse130599@fpt.edu.vn ', N'a', N'Cake 4', N'0356266031', N'NewYork', CAST(N'2021-05-12' AS Date), N'employee  ', N'active    ')
INSERT [dbo].[User] ([Id], [UserID], [Password], [Name], [Phone], [Address], [CreateDate], [Role], [Status]) VALUES (21, N'haudq25251325@gmail.com  ', N'a', N'PRN192', N'0356266031', N'An Duc', CAST(N'2021-05-17' AS Date), N'employee  ', N'active    ')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Rent] ADD  CONSTRAINT [DF_Rent_RentDate]  DEFAULT (getdate()) FOR [RentDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Category]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_Resource1] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_Resource1]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_User]
GO
ALTER TABLE [dbo].[Resource]  WITH CHECK ADD  CONSTRAINT [FK_Resource_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Resource] CHECK CONSTRAINT [FK_Resource_Category]
GO
USE [master]
GO
ALTER DATABASE [LAB231_ASS1] SET  READ_WRITE 
GO
