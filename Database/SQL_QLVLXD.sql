USE [master]
GO
/****** Object:  Database [QL_Vat_Lieu_Xay_Dung]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE DATABASE [QL_Vat_Lieu_Xay_Dung]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_Vat_Lieu_Xay_Dung', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QL_Vat_Lieu_Xay_Dung.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QL_Vat_Lieu_Xay_Dung_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QL_Vat_Lieu_Xay_Dung_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_Vat_Lieu_Xay_Dung].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET RECOVERY FULL 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET  MULTI_USER 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QL_Vat_Lieu_Xay_Dung', N'ON'
GO
USE [QL_Vat_Lieu_Xay_Dung]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/8/2020 11:41:01 PM ******/
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
/****** Object:  Table [dbo].[Announcements]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Announcements](
	[Id] [nvarchar](450) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Content] [nvarchar](250) NULL,
	[Image] [nvarchar](255) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Announcements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnnouncementUsers]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnnouncementUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[HasRead] [bit] NULL,
	[AnnouncementId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AnnouncementUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppRoleClaims]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppRoles]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppRoles](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[NormalizedName] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_AppRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUserClaims]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUserLogins]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserLogins](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginProvider] [nvarchar](max) NULL,
	[ProviderKey] [nvarchar](max) NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUserRoles]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AppUserRoles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUsers]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUsers](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[NormalizedUserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[NormalizedEmail] [nvarchar](max) NULL,
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
	[FullName] [nvarchar](max) NULL,
	[BirthDay] [datetime2](7) NULL,
	[Avatar] [nvarchar](max) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_AppUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUserTokens]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserTokens](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginProvider] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetails]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BillId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[SizeId] [int] NOT NULL,
 CONSTRAINT [PK_BillDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](256) NOT NULL,
	[CustomerAddress] [nvarchar](256) NOT NULL,
	[CustomerMobile] [nvarchar](256) NOT NULL,
	[CustomerMessage] [nvarchar](256) NOT NULL,
	[Total] [decimal](18, 2) NULL,
	[PaymentMethod] [int] NOT NULL,
	[BillStatus] [int] NOT NULL,
	[CustomerId] [uniqueidentifier] NULL,
	[Status] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Image] [nvarchar](255) NULL,
	[DisplayOrder] [int] NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
	[SeoPageTitle] [nvarchar](max) NULL,
	[SeoAlias] [nvarchar](max) NULL,
	[SeoKeywords] [nvarchar](max) NULL,
	[SeoDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](250) NULL,
	[Website] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Other] [nvarchar](max) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Email] [nvarchar](250) NULL,
	[Message] [nvarchar](500) NULL,
	[Status] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Functions]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Functions](
	[Id] [varchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[URL] [nvarchar](250) NOT NULL,
	[ParentId] [nvarchar](128) NULL,
	[IconCss] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_Functions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[FunctionId] [varchar](128) NOT NULL,
	[CanCreate] [bit] NOT NULL,
	[CanRead] [bit] NOT NULL,
	[CanUpdate] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[ParentId] [int] NULL,
	[HomeOrder] [int] NULL,
	[Image] [nvarchar](max) NULL,
	[HomeFlag] [bit] NULL,
	[Status] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	[SeoPageTitle] [nvarchar](max) NULL,
	[SeoAlias] [varchar](255) NULL,
	[SeoKeywords] [nvarchar](255) NULL,
	[SeoDescription] [nvarchar](255) NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Path] [nvarchar](250) NULL,
	[Caption] [nvarchar](250) NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductReceiptDetails]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReceiptDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[ProductReceiptId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[OriginalPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_ProductReceiptDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductReceipts]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReceipts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[UserrId] [uniqueidentifier] NULL,
	[DateModified] [datetime2](7) NOT NULL,
	[ReceiptStatus] [int] NOT NULL,
 CONSTRAINT [PK_ProductReceipts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Image] [nvarchar](255) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[PromotionPrice] [decimal](18, 2) NULL,
	[Description] [nvarchar](max) NULL,
	[BrandId] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[HomeFlag] [bit] NULL,
	[HotFlag] [bit] NULL,
	[ViewCount] [int] NULL,
	[Tags] [nvarchar](255) NULL,
	[Unit] [nvarchar](255) NULL,
	[Status] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	[SeoPageTitle] [nvarchar](max) NULL,
	[SeoAlias] [varchar](255) NULL,
	[SeoKeywords] [nvarchar](255) NULL,
	[SeoDescription] [nvarchar](255) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTags]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[TagId] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductTags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slides]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slides](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Image] [nvarchar](250) NOT NULL,
	[Url] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Status] [int] NOT NULL,
	[GroupAlias] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Slides] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[PhoneNumber] [varchar](255) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200808162929_initialize', N'3.0.3')
GO
INSERT [dbo].[AppRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Description]) VALUES (N'fb5873aa-78cd-405a-08ff-08d83bb87583', N'Admin', N'ADMIN', N'ea2d0e00-bdd5-4733-a35d-4eed0b90b0f4', N'Top manager')
INSERT [dbo].[AppRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Description]) VALUES (N'7209c3ff-0b0d-4d0f-0900-08d83bb87583', N'Staff', N'STAFF', N'4ddcae5e-74e1-4e6b-9cf7-b55fb73e87f1', N'Staff')
INSERT [dbo].[AppRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Description]) VALUES (N'db412646-0526-4150-0901-08d83bb87583', N'Customer', N'CUSTOMER', N'bb2004d2-9e4c-4f00-a990-53846c664866', N'Customer')
GO
INSERT [dbo].[AppUserRoles] ([UserId], [RoleId]) VALUES (N'698dced4-2448-4e8c-b9f2-08d83bb875b3', N'fb5873aa-78cd-405a-08ff-08d83bb87583')
GO
INSERT [dbo].[AppUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [BirthDay], [Avatar], [DateCreated], [DateModified], [Status]) VALUES (N'698dced4-2448-4e8c-b9f2-08d83bb875b3', N'admin', N'ADMIN', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEDRgsYr2UBi8q7DnRWPEowXNNQV9PXHdnkc7MkT536zeJ3uVl0SgL/yUjoH+sztmHw==', N'QJ3JEBAWD34Z4ZP4HTVDHLK7GL7Z4GGF', N'b7691721-e4c1-4871-b7f3-791d7f7602b2', N'0123456789', 0, 0, NULL, 1, 0, N'Administrator', NULL, NULL, CAST(N'2020-08-08T23:31:10.6613434' AS DateTime2), CAST(N'2020-08-08T23:31:10.6630780' AS DateTime2), 1)
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [Name], [Image], [DisplayOrder], [DateCreated], [DateModified], [Status], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (1, N'Inax', N'/img_ds/brand1.png', 1, CAST(N'2020-08-08T23:31:10.9200715' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'Inax', N'lixilvietnam', N'Inax', N'Inax')
INSERT [dbo].[Brands] ([Id], [Name], [Image], [DisplayOrder], [DateCreated], [DateModified], [Status], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (2, N'Đại Gia Long', N'/img_ds/brand10.png', 10, CAST(N'2020-08-08T23:31:10.9204783' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'', N'daigialong', N'Đại Gia Long', N'')
INSERT [dbo].[Brands] ([Id], [Name], [Image], [DisplayOrder], [DateCreated], [DateModified], [Status], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (3, N'Blue Bird', N'/img_ds/brand8.png', 8, CAST(N'2020-08-08T23:31:10.9204775' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'Blue Bird', N'bluebird', N'Blue Bird', N'Blue Bird')
INSERT [dbo].[Brands] ([Id], [Name], [Image], [DisplayOrder], [DateCreated], [DateModified], [Status], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (4, N'Mosaic', N'/img_ds/brand7.png', 7, CAST(N'2020-08-08T23:31:10.9204773' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'Mosaic', N'mosaicsg', N'Mosaic', N'Mosaic')
INSERT [dbo].[Brands] ([Id], [Name], [Image], [DisplayOrder], [DateCreated], [DateModified], [Status], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (5, N'VITTO', N'/img_ds/brand6.png', 6, CAST(N'2020-08-08T23:31:10.9204770' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'VITTO', N'vittogroup', N'VITTO', N'VITTO')
INSERT [dbo].[Brands] ([Id], [Name], [Image], [DisplayOrder], [DateCreated], [DateModified], [Status], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (6, N'Gỗ Lưu Hoàng', N'/img_ds/brand9.png', 9, CAST(N'2020-08-08T23:31:10.9204777' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'Gỗ Lưu Hoàng', N'goluuhoang', N'Gỗ Lưu Hoàng', N'Gỗ Lưu Hoàng')
INSERT [dbo].[Brands] ([Id], [Name], [Image], [DisplayOrder], [DateCreated], [DateModified], [Status], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (7, N'Rubivina', N'/img_ds/brand4.png', 4, CAST(N'2020-08-08T23:31:10.9204759' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'Rubivina', N'rubivina', N'Rubivina', N'Rubivina')
INSERT [dbo].[Brands] ([Id], [Name], [Image], [DisplayOrder], [DateCreated], [DateModified], [Status], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (8, N'Việt Thái', N'/img_ds/brand3.png', 3, CAST(N'2020-08-08T23:31:10.9204756' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'Việt Thái', N'vietthai', N'Việt Thái', N'Việt Thái')
INSERT [dbo].[Brands] ([Id], [Name], [Image], [DisplayOrder], [DateCreated], [DateModified], [Status], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (9, N'Lavender', N'/img_ds/brand2.png', 2, CAST(N'2020-08-08T23:31:10.9204745' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'Lavender', N'lavender', N'Lavender', N'Lavender')
INSERT [dbo].[Brands] ([Id], [Name], [Image], [DisplayOrder], [DateCreated], [DateModified], [Status], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (10, N'BOSCH', N'/img_ds/brand5.png', 5, CAST(N'2020-08-08T23:31:10.9204762' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'BOSCH', N'boschvietnam', N'BOSCH', N'BOSCH')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
INSERT [dbo].[Contacts] ([Id], [Name], [Phone], [Email], [Website], [Address], [Other], [Latitude], [Longitude], [Status]) VALUES (N'Default', N'VLXD Shop', N'0123456789', N'vlxd@gmail.com', N'http://beta.vlxd.com', N'140 Lê Trọng Tấn, Tây Thạnh, Tân Phú, Thành phố Hồ Chí Minh', NULL, 10.806137, 106.62884, 1)
GO
INSERT [dbo].[Functions] ([Id], [Name], [URL], [ParentId], [IconCss], [Status], [SortOrder]) VALUES (N'ANNOUNCEMENT', N'Thông báo', N'/admin/announcement/index', N'UTILITY', N'fa-clone', 1, 1)
INSERT [dbo].[Functions] ([Id], [Name], [URL], [ParentId], [IconCss], [Status], [SortOrder]) VALUES (N'BILL', N'Hóa đơn', N'/admin/bill/index', N'PRODUCT', N'fa-chevron-down', 1, 3)
INSERT [dbo].[Functions] ([Id], [Name], [URL], [ParentId], [IconCss], [Status], [SortOrder]) VALUES (N'BRAND', N'Thương Hiệu', N'/admin/brand/index', N'UTILITY', N'fa-amazon', 1, 4)
INSERT [dbo].[Functions] ([Id], [Name], [URL], [ParentId], [IconCss], [Status], [SortOrder]) VALUES (N'CONTENT', N'Nội dung', N'/admin', NULL, N'fa-table', 1, 1)
INSERT [dbo].[Functions] ([Id], [Name], [URL], [ParentId], [IconCss], [Status], [SortOrder]) VALUES (N'FUNCTION', N'Chức năng', N'/admin/function/index', N'SYSTEM', N'fa-home', 1, 2)
INSERT [dbo].[Functions] ([Id], [Name], [URL], [ParentId], [IconCss], [Status], [SortOrder]) VALUES (N'PRODUCT', N'Sản phẩm', N'/', NULL, N'fa-chevron-down', 1, 3)
INSERT [dbo].[Functions] ([Id], [Name], [URL], [ParentId], [IconCss], [Status], [SortOrder]) VALUES (N'PRODUCT_CATEGORY', N'Danh mục', N'/admin/productcategory/index', N'PRODUCT', N'fa-chevron-down', 1, 1)
INSERT [dbo].[Functions] ([Id], [Name], [URL], [ParentId], [IconCss], [Status], [SortOrder]) VALUES (N'PRODUCT_LIST', N'Sản phẩm', N'/admin/product/index', N'PRODUCT', N'fa-chevron-down', 1, 2)
INSERT [dbo].[Functions] ([Id], [Name], [URL], [ParentId], [IconCss], [Status], [SortOrder]) VALUES (N'PRODUCT_RECEIPT', N'Phiếu Nhập', N'/admin/productreceipt/index', N'PRODUCT', N'fa-indent', 1, 6)
INSERT [dbo].[Functions] ([Id], [Name], [URL], [ParentId], [IconCss], [Status], [SortOrder]) VALUES (N'REPORT', N'Báo cáo', N'/', NULL, N'fa-bar-chart-o', 1, 5)
INSERT [dbo].[Functions] ([Id], [Name], [URL], [ParentId], [IconCss], [Status], [SortOrder]) VALUES (N'REVENUES', N'Báo cáo doanh thu', N'/admin/report/revenues', N'REPORT', N'fa-bar-chart-o', 1, 1)
INSERT [dbo].[Functions] ([Id], [Name], [URL], [ParentId], [IconCss], [Status], [SortOrder]) VALUES (N'ROLE', N'Nhóm', N'/admin/role/index', N'SYSTEM', N'fa-home', 1, 1)
INSERT [dbo].[Functions] ([Id], [Name], [URL], [ParentId], [IconCss], [Status], [SortOrder]) VALUES (N'SLIDE', N'Slide', N'/admin/slide/index', N'UTILITY', N'fa-clone', 1, 3)
INSERT [dbo].[Functions] ([Id], [Name], [URL], [ParentId], [IconCss], [Status], [SortOrder]) VALUES (N'SUPPLIER', N'Nhà Cung Cấp', N'/admin/supplier/index', N'PRODUCT', N'fa-cart-arrow-down', 1, 5)
INSERT [dbo].[Functions] ([Id], [Name], [URL], [ParentId], [IconCss], [Status], [SortOrder]) VALUES (N'SYSTEM', N'Hệ thống', N'/', NULL, N'fa-desktop', 1, 2)
INSERT [dbo].[Functions] ([Id], [Name], [URL], [ParentId], [IconCss], [Status], [SortOrder]) VALUES (N'USER', N'Người dùng', N'/admin/user/index', N'SYSTEM', N'fa-home', 1, 3)
INSERT [dbo].[Functions] ([Id], [Name], [URL], [ParentId], [IconCss], [Status], [SortOrder]) VALUES (N'UTILITY', N'Tiện ích', N'/', NULL, N'fa-clone', 1, 4)
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([Id], [Name], [ParentId], [HomeOrder], [Image], [HomeFlag], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription], [SortOrder]) VALUES (1, N'Gạch', NULL, NULL, N'/img_ds/cate2.png', 0, 1, CAST(N'2020-08-08T23:31:11.0208984' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Gạch', N'gach', N'Gạch', N'Gạch', 1)
INSERT [dbo].[ProductCategories] ([Id], [Name], [ParentId], [HomeOrder], [Image], [HomeFlag], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription], [SortOrder]) VALUES (2, N'Xi Măng', NULL, 5, N'/img_ds/cate3.png', 1, 1, CAST(N'2020-08-08T23:31:11.0208975' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Xi Măng', N'xi-mang', N'Xi Măng', N'Xi Măng', 2)
INSERT [dbo].[ProductCategories] ([Id], [Name], [ParentId], [HomeOrder], [Image], [HomeFlag], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription], [SortOrder]) VALUES (3, N'Sàn Gỗ', NULL, 1, N'/img_ds/cate4.png', 1, 1, CAST(N'2020-08-08T23:31:11.0208972' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Sàn Gỗ', N'gian-giao', N'Sàn Gỗ', N'Sàn Gỗ', 3)
INSERT [dbo].[ProductCategories] ([Id], [Name], [ParentId], [HomeOrder], [Image], [HomeFlag], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription], [SortOrder]) VALUES (4, N'Đá Bazan', NULL, 4, N'/img_ds/cate6.png', 0, 1, CAST(N'2020-08-08T23:31:11.0208968' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Đá Bazan', N'da-bazan', N'Đá Bazan', N'Đá Bazan', 5)
INSERT [dbo].[ProductCategories] ([Id], [Name], [ParentId], [HomeOrder], [Image], [HomeFlag], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription], [SortOrder]) VALUES (5, N'Cát Sỏi Xây Dựng', NULL, 3, N'/img_ds/cate7.png', 1, 1, CAST(N'2020-08-08T23:31:11.0208955' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Cát Sỏi Xây Dựng', N'cat-soi-xay-dung', N'Cát Sỏi Xây Dựng', N'Cát Sỏi Xây Dựng', 6)
INSERT [dbo].[ProductCategories] ([Id], [Name], [ParentId], [HomeOrder], [Image], [HomeFlag], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription], [SortOrder]) VALUES (6, N'Keo Dán Gạch Đá', NULL, 2, N'/img_ds/cate5.png', 0, 1, CAST(N'2020-08-08T23:31:11.0204578' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Keo Dán Gạch Đá', N'keo-dan-gach-da', N'Keo Dán Gạch Đá', N'Keo Dán Gạch Đá', 7)
INSERT [dbo].[ProductCategories] ([Id], [Name], [ParentId], [HomeOrder], [Image], [HomeFlag], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription], [SortOrder]) VALUES (7, N'Gạch Ốp Lát', 1, 7, N'/img_ds/cate1.png', 1, 1, CAST(N'2020-08-08T23:31:11.0208990' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Gạch Ốp Lát', N'gach-op-lat', N'Gạch Ốp Lát', N'Gạch Ốp Lát', 1)
INSERT [dbo].[ProductCategories] ([Id], [Name], [ParentId], [HomeOrder], [Image], [HomeFlag], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription], [SortOrder]) VALUES (8, N'Gạch Block', 1, 6, N'/img_ds/cate1.png', 1, 1, CAST(N'2020-08-08T23:31:11.0208988' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Gạch Block', N'gach-block', N'Gạch Block', N'Gạch Block', 2)
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (1, 14, N'/img_ds/product-40.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (2, 31, N'/img_ds/product-8.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (3, 32, N'/img_ds/product-34.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (4, 32, N'/img_ds/product-35.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (5, 32, N'/img_ds/product-26.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (6, 33, N'/img_ds/product-17.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (7, 33, N'/img_ds/product-36.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (8, 33, N'/img_ds/product-27.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (9, 34, N'/img_ds/product-28.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (10, 34, N'/img_ds/product-31.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (11, 34, N'/img_ds/product-40.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (12, 35, N'/img_ds/product-34.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (13, 35, N'/img_ds/product-32.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (14, 35, N'/img_ds/product-31.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (15, 35, N'/img_ds/product-38.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (16, 35, N'/img_ds/product-39.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (17, 36, N'/img_ds/product-1.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (18, 36, N'/img_ds/product-9.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (19, 31, N'/img_ds/product-7.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (20, 36, N'/img_ds/product-10.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (21, 31, N'/img_ds/product-5.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (22, 30, N'/img_ds/product-28.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (23, 25, N'/img_ds/product-39.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (24, 26, N'/img_ds/product-1.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (25, 26, N'/img_ds/product-9.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (26, 26, N'/img_ds/product-10.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (27, 27, N'/img_ds/product-12.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (28, 27, N'/img_ds/product-13.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (29, 27, N'/img_ds/product-15.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (30, 28, N'/img_ds/product-14.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (31, 28, N'/img_ds/product-18.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (32, 28, N'/img_ds/product-20.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (33, 29, N'/img_ds/product-19.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (34, 29, N'/img_ds/product-21.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (35, 29, N'/img_ds/product-22.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (36, 29, N'/img_ds/product-23.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (37, 30, N'/img_ds/product-25.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (38, 30, N'/img_ds/product-26.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (39, 30, N'/img_ds/product-27.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (40, 31, N'/img_ds/product-12.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (41, 25, N'/img_ds/product-38.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (42, 37, N'/img_ds/product-12.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (43, 37, N'/img_ds/product-15.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (44, 44, N'/img_ds/product-48.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (45, 44, N'/img_ds/product-43.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (46, 44, N'/img_ds/product-45.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (47, 45, N'/img_ds/product-44.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (48, 45, N'/img_ds/product-46.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (49, 45, N'/img_ds/product-47.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (50, 45, N'/img_ds/product-48.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (51, 45, N'/img_ds/product-40.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (52, 46, N'/img_ds/product-41.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (53, 46, N'/img_ds/product-48.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (54, 46, N'/img_ds/product-40.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (55, 47, N'/img_ds/product-42.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (56, 47, N'/img_ds/product-43.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (57, 47, N'/img_ds/product-45.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (58, 48, N'/img_ds/product-44.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (59, 48, N'/img_ds/product-45.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (60, 48, N'/img_ds/product-47.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (61, 43, N'/img_ds/product-47.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (62, 37, N'/img_ds/product-13.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (63, 43, N'/img_ds/product-45.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (64, 42, N'/img_ds/product-41.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (65, 38, N'/img_ds/product-14.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (66, 38, N'/img_ds/product-19.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (67, 38, N'/img_ds/product-20.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (68, 39, N'/img_ds/product-29.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (69, 39, N'/img_ds/product-21.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (70, 39, N'/img_ds/product-22.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (71, 39, N'/img_ds/product-23.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (72, 40, N'/img_ds/product-25.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (73, 40, N'/img_ds/product-26.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (74, 40, N'/img_ds/product-27.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (75, 40, N'/img_ds/product-28.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (76, 41, N'/img_ds/product-42.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (77, 41, N'/img_ds/product-45.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (78, 41, N'/img_ds/product-47.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (79, 41, N'/img_ds/product-48.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (80, 42, N'/img_ds/product-44.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (81, 42, N'/img_ds/product-40.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (82, 43, N'/img_ds/product-42.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (83, 25, N'/img_ds/product-31.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (84, 25, N'/img_ds/product-32.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (85, 2, N'/img_ds/product-27.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (86, 7, N'/img_ds/product-15.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (87, 7, N'/img_ds/product-13.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (88, 7, N'/img_ds/product-12.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (89, 6, N'/img_ds/product-10.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (90, 6, N'/img_ds/product-9.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (91, 6, N'/img_ds/product-1.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (92, 5, N'/img_ds/product-39.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (93, 5, N'/img_ds/product-38.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (94, 5, N'/img_ds/product-31.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (95, 5, N'/img_ds/product-32.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (96, 5, N'/img_ds/product-34.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (97, 4, N'/img_ds/product-4.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (98, 4, N'/img_ds/product-3.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (99, 4, N'/img_ds/product-2.jpg', N'ProductImages')
GO
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (100, 3, N'/img_ds/product-7.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (101, 3, N'/img_ds/product-6.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (102, 3, N'/img_ds/product-1.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (103, 8, N'/img_ds/product-14.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (104, 25, N'/img_ds/product-34.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (105, 8, N'/img_ds/product-18.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (106, 9, N'/img_ds/product-19.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (107, 13, N'/img_ds/product-27.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (108, 13, N'/img_ds/product-36.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (109, 13, N'/img_ds/product-17.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (110, 12, N'/img_ds/product-26.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (111, 12, N'/img_ds/product-35.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (112, 12, N'/img_ds/product-34.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (113, 11, N'/img_ds/product-8.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (114, 11, N'/img_ds/product-7.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (115, 11, N'/img_ds/product-5.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (116, 11, N'/img_ds/product-12.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (117, 10, N'/img_ds/product-28.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (118, 10, N'/img_ds/product-27.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (119, 10, N'/img_ds/product-26.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (120, 10, N'/img_ds/product-25.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (121, 9, N'/img_ds/product-23.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (122, 9, N'/img_ds/product-22.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (123, 9, N'/img_ds/product-21.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (124, 8, N'/img_ds/product-20.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (125, 14, N'/img_ds/product-28.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (126, 2, N'/img_ds/product-37.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (127, 1, N'/img_ds/product-27.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (128, 20, N'/img_ds/product-25.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (129, 20, N'/img_ds/product-26.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (130, 20, N'/img_ds/product-27.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (131, 20, N'/img_ds/product-28.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (132, 21, N'/img_ds/product-6.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (133, 21, N'/img_ds/product-7.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (134, 21, N'/img_ds/product-9.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (135, 21, N'/img_ds/product-27.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (136, 22, N'/img_ds/product-17.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (137, 22, N'/img_ds/product-37.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (138, 22, N'/img_ds/product-27.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (139, 23, N'/img_ds/product-1.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (140, 23, N'/img_ds/product-6.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (141, 23, N'/img_ds/product-7.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (142, 24, N'/img_ds/product-2.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (143, 24, N'/img_ds/product-3.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (144, 24, N'/img_ds/product-4.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (145, 19, N'/img_ds/product-23.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (146, 2, N'/img_ds/product-17.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (147, 19, N'/img_ds/product-22.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (148, 19, N'/img_ds/product-29.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (149, 1, N'/img_ds/product-9.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (150, 1, N'/img_ds/product-7.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (151, 1, N'/img_ds/product-6.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (152, 15, N'/img_ds/product-34.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (153, 15, N'/img_ds/product-32.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (154, 15, N'/img_ds/product-31.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (155, 15, N'/img_ds/product-38.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (156, 15, N'/img_ds/product-39.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (157, 16, N'/img_ds/product-1.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (158, 16, N'/img_ds/product-9.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (159, 16, N'/img_ds/product-10.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (160, 17, N'/img_ds/product-12.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (161, 17, N'/img_ds/product-13.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (162, 17, N'/img_ds/product-15.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (163, 18, N'/img_ds/product-14.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (164, 18, N'/img_ds/product-19.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (165, 18, N'/img_ds/product-20.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (166, 19, N'/img_ds/product-21.jpg', N'ProductImages')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Caption]) VALUES (167, 14, N'/img_ds/product-31.jpg', N'ProductImages')
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductReceiptDetails] ON 

INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (1, 5, 4, 2, 100, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (2, 42, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (3, 43, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (4, 44, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (5, 45, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (6, 46, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (7, 25, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (8, 24, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (9, 12, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (10, 22, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (11, 13, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (12, 14, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (13, 41, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (14, 15, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (15, 11, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (16, 2, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (17, 3, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (18, 4, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (19, 18, 1, 1, 100, CAST(35000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (20, 17, 1, 1, 100, CAST(35000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (21, 18, 1, 1, 100, CAST(35000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (22, 19, 1, 1, 100, CAST(35000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (23, 20, 1, 1, 100, CAST(35000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (24, 21, 1, 1, 100, CAST(35000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (25, 47, 1, 1, 100, CAST(35000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (26, 23, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (27, 40, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (28, 39, 1, 1, 100, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (29, 48, 5, 3, 100, CAST(55000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (30, 41, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (31, 42, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (32, 43, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (33, 44, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (34, 45, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (35, 46, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (36, 25, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (37, 24, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (38, 12, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (39, 22, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (40, 13, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (41, 14, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (42, 15, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (43, 23, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (44, 11, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (45, 2, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (46, 3, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (47, 4, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (48, 18, 5, 3, 100, CAST(55000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (49, 17, 5, 3, 100, CAST(55000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (50, 18, 5, 3, 100, CAST(55000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (51, 19, 5, 3, 100, CAST(55000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (52, 20, 5, 3, 100, CAST(55000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (53, 21, 5, 3, 100, CAST(55000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (54, 47, 5, 3, 100, CAST(55000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (55, 48, 1, 1, 100, CAST(35000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (56, 40, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (57, 39, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (58, 41, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (59, 18, 2, 2, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (60, 17, 2, 2, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (61, 16, 2, 2, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (62, 34, 4, 2, 100, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (63, 35, 4, 2, 100, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (64, 36, 4, 2, 100, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (65, 33, 4, 2, 100, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (66, 37, 4, 2, 100, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (67, 38, 4, 2, 100, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (68, 39, 4, 2, 100, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (69, 40, 4, 2, 100, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (70, 19, 2, 2, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (71, 1, 4, 2, 100, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (72, 31, 4, 2, 100, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (73, 30, 4, 2, 100, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (74, 29, 4, 2, 100, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (75, 28, 4, 2, 100, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (76, 27, 4, 2, 100, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (77, 26, 4, 2, 100, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (78, 10, 4, 2, 100, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (79, 9, 4, 2, 100, CAST(9000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (80, 8, 4, 2, 100, CAST(8000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (81, 7, 4, 2, 100, CAST(7000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (82, 6, 4, 2, 100, CAST(6000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (83, 32, 4, 2, 100, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (84, 20, 2, 2, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (85, 21, 2, 2, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (86, 44, 3, 2, 100, CAST(75000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (87, 42, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (88, 43, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (89, 44, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (90, 45, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (91, 46, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (92, 25, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (93, 24, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (94, 12, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (95, 22, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (96, 13, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (97, 14, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (98, 15, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (99, 23, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (100, 11, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (101, 2, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (102, 3, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (103, 4, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (104, 18, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (105, 17, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (106, 18, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (107, 19, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (108, 20, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (109, 21, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (110, 47, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (111, 48, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (112, 40, 6, 1, 100, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProductReceiptDetails] ([Id], [ProductId], [SizeId], [ProductReceiptId], [Quantity], [OriginalPrice]) VALUES (113, 39, 5, 3, 100, CAST(65000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ProductReceiptDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductReceipts] ON 

INSERT [dbo].[ProductReceipts] ([Id], [SupplierId], [Total], [DateCreated], [UserId], [UserrId], [DateModified], [ReceiptStatus]) VALUES (1, 2, CAST(294000000.00 AS Decimal(18, 2)), CAST(N'2020-08-08T23:31:11.4184687' AS DateTime2), NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[ProductReceipts] ([Id], [SupplierId], [Total], [DateCreated], [UserId], [UserrId], [DateModified], [ReceiptStatus]) VALUES (2, 1, CAST(38500000.00 AS Decimal(18, 2)), CAST(N'2020-08-08T23:31:11.4179702' AS DateTime2), NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[ProductReceipts] ([Id], [SupplierId], [Total], [DateCreated], [UserId], [UserrId], [DateModified], [ReceiptStatus]) VALUES (3, 3, CAST(174000000.00 AS Decimal(18, 2)), CAST(N'2020-08-08T23:31:11.4184753' AS DateTime2), NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3)
SET IDENTITY_INSERT [dbo].[ProductReceipts] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (1, N'Keo dán gạch Weber.tai Gres', 6, N'/img_ds/product-48.jpg', CAST(500000.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 3, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 1, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040713' AS DateTime2), CAST(N'2020-08-08T23:33:00.2704114' AS DateTime2), N'Keo dán gạch Weber.tai Gres', N'keo-dan-gach-weber.tai-gres', N'Keo dán gạch Weber.tai Gres', N'Keo dán gạch Weber.tai Gres')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (2, N'Sàn gỗ tự nhiên Woodtec', 3, N'/img_ds/product-17.jpg', CAST(850000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 9, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'M2', 1, CAST(N'2020-08-08T23:31:11.2040619' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Sàn gỗ tự nhiên Woodtec', N'san-go-tu-nhien-woodtec', N'Sàn gỗ tự nhiên Woodtec', N'Sàn gỗ tự nhiên Woodtec')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (3, N'Sàn gỗ óc chó DongSung', 3, N'/img_ds/product-16.jpg', CAST(750000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 9, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'M2', 1, CAST(N'2020-08-08T23:31:11.2040616' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Sàn gỗ óc chó DongSung', N'san-go-oc-cho-dongsung', N'Sàn gỗ óc chó DongSung', N'Sàn gỗ óc chó DongSung')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (4, N'Sàn gỗ Eurohome D893', 3, N'/img_ds/product-15.jpg', CAST(650000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 9, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'M2', 1, CAST(N'2020-08-08T23:31:11.2040613' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Sàn gỗ Eurohome D893', N'san-go-eurohome-d893', N'Sàn gỗ Eurohome D893', N'Sàn gỗ Eurohome D893')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (5, N'Xi Măng Holcim Đa Dụng', 2, N'/img_ds/product-14.jpg', CAST(95000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 5, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040609' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Xi Măng Holcim Đa Dụng', N'xi-mang-holcim-da-dung', N'Xi Măng Holcim Đa Dụng', N'Xi Măng Holcim Đa Dụng')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (6, N'Xi Măng Hoàng Thạch Đa Dụng', 2, N'/img_ds//product-13.jpg', CAST(95000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 10, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040605' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Xi Măng Hoàng Thạch Đa Dụng', N'xi-mang-hoang-thach-da-dung', N'Xi Măng Hoàng Thạch Đa Dụng', N'Xi Măng Hoàng Thạch Đa Dụng')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (7, N'Xi Măng Hoàng Long Đa Dụng', 2, N'/img_ds/product-12.jpg', CAST(105000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 10, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040601' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Xi Măng Hoàng Long Đa Dụng', N'xi-mang-hoang-mai-da-dung', N'Xi Măng Hoàng Long Đa Dụng', N'Xi Măng Hoàng Long Đa Dụng')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (8, N'Xi Măng Hoàng Mai Đa Dụng', 2, N'/img_ds/product-11.jpg', CAST(85000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 10, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040596' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Xi Măng Hoàng Mai Đa Dụng', N'xi-mang-hoang-long-da-dung', N'Xi Măng Hoàng Mai Đa Dụng', N'Xi Măng Hoàng Mai Đa Dụng')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (9, N'Xi Măng Hà Tiên 2 Đa Dụng', 2, N'/img_ds/product-10.jpg', CAST(85000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 10, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040593' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Xi Măng Hà Tiên 2 Đa Dụng', N'xi-mang-ha-tien-2-da-dung', N'Xi Măng Hà Tiên 2 Đa Dụng', N'Xi Măng Hà Tiên 2 Đa Dụng')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (10, N'Xi Măng Vicem Hà Tiên Đa Dụng', 2, N'/img_ds/product-9.jpg', CAST(85000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 10, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040590' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Xi Măng Vicem Hà Tiên Đa Dụng', N'xi-mang-vicem-ha-tien-da-dung', N'Xi Măng Vicem Hà Tiên Đa Dụng', N'Xi Măng Vicem Hà Tiên Đa Dụng')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (11, N'Sàn gỗ Kingfloor 8769', 3, N'/img_ds/product-18.jpg', CAST(950000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 9, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'M2', 1, CAST(N'2020-08-08T23:31:11.2040623' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Sàn gỗ Kingfloor 8769', N'san-go-kingfloor-8769', N'Sàn gỗ Kingfloor 8769', N'Sàn gỗ Kingfloor 8769')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (12, N'Gạch bánh ú bê tông xi măng', 8, N'/img_ds/product-24.jpg', CAST(22000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 2, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'Viên', 1, CAST(N'2020-08-08T23:31:11.2040575' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Gạch bánh ú bê tông xi măng', N'gach-banh-u-be-tong-xi-mang', N'Gạch bánh ú bê tông xi măng', N'Gạch bánh ú bê tông xi măng')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (13, N'Gạch cổ xây AB02', 8, N'/img_ds/product-22.jpg', CAST(8500.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 2, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'Viên', 1, CAST(N'2020-08-08T23:31:11.2040567' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Gạch cổ xây AB02', N'gach-co-xay-ab02', N'Gạch cổ xây AB02', N'Gạch cổ xây AB02')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (14, N'Gạch cổ xây AB01', 8, N'/img_ds/product-21.jpg', CAST(8500.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 2, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'Viên', 1, CAST(N'2020-08-08T23:31:11.2040561' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Gạch cổ xây AB01', N'gach-co-xay-ab01', N'Gạch cổ xây AB01', N'Gạch cổ xây AB01')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (15, N'Gạch cổ xây AB09', 8, N'/img_ds/product-20.jpg', CAST(8500.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 2, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'Viên', 1, CAST(N'2020-08-08T23:31:11.2040557' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Gạch cổ xây AB09', N'gach-co-xay-ab09', N'Gạch cổ xây AB09', N'Gạch cổ xây AB09')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (16, N'Gạch tranh mosaic nghệ thuật GT020', 7, N'/img_ds/product-8.jpg', CAST(500000.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 7, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'Viên', 1, CAST(N'2020-08-08T23:31:11.2040553' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Gạch tranh mosaic nghệ thuật GT020', N'gach-tranh-mosaic-nghe-thuat-gt020', N'Gạch tranh mosaic nghệ thuật GT020', N'Gạch tranh mosaic nghệ thuật GT020')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (17, N'Gạch tranh mosaic nghệ thuật GT018', 7, N'/img_ds/product-7.jpg', CAST(500000.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 7, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Viên', 1, CAST(N'2020-08-08T23:31:11.2040550' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Gạch tranh mosaic nghệ thuật GT018', N'gach-tranh-mosaic-nghe-thuat-gt018', N'Gạch tranh mosaic nghệ thuật GT018', N'Gạch tranh mosaic nghệ thuật GT018')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (18, N'Gạch tranh mosaic nghệ thuật GT016', 7, N'/img_ds/product-6.jpg', CAST(500000.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 7, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Viên', 1, CAST(N'2020-08-08T23:31:11.2040546' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Gạch tranh mosaic nghệ thuật GT016', N'gach-tranh-mosaic-nghe-thuat-gt016', N'Gạch tranh mosaic nghệ thuật GT016', N'Gạch tranh mosaic nghệ thuật GT016')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (19, N'Gạch tranh mosaic nghệ thuật GT011', 7, N'/img_ds/product-5.jpg', CAST(500000.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 7, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Viên', 1, CAST(N'2020-08-08T23:31:11.2040534' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Gạch tranh mosaic nghệ thuật GT011', N'gach-tranh-mosaic-nghe-thuat-gt011', N'Gạch tranh mosaic nghệ thuật GT011', N'Gạch tranh mosaic nghệ thuật GT011')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (20, N'Gạch tranh mosaic nghệ thuật GT010', 7, N'/img_ds/product-4.jpg', CAST(420000.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 7, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Viên', 1, CAST(N'2020-08-08T23:31:11.2040524' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Gạch tranh mosaic nghệ thuật GT010', N'gach-tranh-mosaic-nghe-thuat-gt010', N'Gạch tranh mosaic nghệ thuật GT010', N'Gạch tranh mosaic nghệ thuật GT010')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (21, N'Gạch tranh mosaic nghệ thuật GT009', 7, N'/img_ds/product-3.jpg', CAST(420000.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 7, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Viên', 1, CAST(N'2020-08-08T23:31:11.2039591' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Gạch tranh mosaic nghệ thuật GT009', N'gach-tranh-mosaic-nghe-thuat-gt009', N'Gạch tranh mosaic nghệ thuật GT009', N'Gạch tranh mosaic nghệ thuật GT009')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (22, N'Gạch Block khuôn bông trang trí V403', 8, N'/img_ds/product-23.jpg', CAST(169000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 2, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'Viên', 1, CAST(N'2020-08-08T23:31:11.2040572' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Gạch Block khuôn bông trang trí V403', N'gach-block-khuon-bong-trang-tri-v403', N'Gạch Block khuôn bông trang trí V403', N'Gạch Block khuôn bông trang trí V403')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (23, N'Sàn gỗ Meister PS300-8044', 3, N'/img_ds/product-19.jpg', CAST(650000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 9, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'M2', 1, CAST(N'2020-08-08T23:31:11.2040626' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Sàn gỗ Meister PS300-8044', N'san-go-meister-ps300-8044', N'Sàn gỗ Meister PS300-8044', N'Sàn gỗ Meister PS300-8044')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (24, N'Đá Bazan Khò Mặt', 4, N'/img_ds/product-25.jpg', CAST(350000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 8, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'Cái', 1, CAST(N'2020-08-08T23:31:11.2040629' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Đá Bazan Khò Mặt', N'da-bazan-kho-mat', N'Đá Bazan Khò Mặt', N'Đá Bazan Khò Mặt')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (25, N'Đá Đen Bazan Quy Cách Rối', 4, N'/img_ds/product-26.jpg', CAST(350000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 8, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'Cái', 1, CAST(N'2020-08-08T23:31:11.2040633' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Đá Đen Bazan Quy Cách Rối', N'da-den-bazan-quy-cach-roi', N'Đá Đen Bazan Quy Cách Rối', N'Đá Đen Bazan Quy Cách Rối')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (26, N'Keo dán gạch ít gây bụi Weber.tai MAX', 6, N'/img_ds/product-47.jpg', CAST(500000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 3, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040709' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Keo dán gạch ít gây bụi Weber.tai MAX', N'keo-dan-gach-it-gay-bui-weber.tai-maXX', N'Keo dán gạch ít gây bụi Weber.tai MAX', N'Keo dán gạch ít gây bụi Weber.tai MAX')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (27, N'Keo dán đá Epoxy Eco Stone Orion Ro-9000', 6, N'/img_ds/product-46.jpg', CAST(500000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 3, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 2, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040707' AS DateTime2), CAST(N'2020-08-08T23:32:52.3705583' AS DateTime2), N'Keo dán đá Epoxy Eco Stone Orion Ro-9000', N'keo-dan-da-epoxy-eco-stone-orion-ro-9000', N'Keo dán đá Epoxy Eco Stone Orion Ro-9000', N'Keo dán đá Epoxy Eco Stone Orion Ro-9000')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (28, N'Keo Chà Ron Weber', 6, N'/img_ds/product-45.jpg', CAST(500000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 3, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040703' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Keo Chà Ron Weber', N'keo-cha-ron-weber-2', N'Keo Chà Ron Weber', N'Keo Chà Ron Weber')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (29, N'Keo dán gạch Tag.Title A9', 6, N'/img_ds/product-44.jpg', CAST(420000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 3, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040700' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Keo dán gạch Tag.Title A9', N'keo-dan-gach-tag.tile-a9', N'Keo dán gạch Tag.Title A9', N'Keo dán gạch Tag.Title A9')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (30, N'Keo dán đá K-Epoxy', 6, N'/img_ds/product-43.jpg', CAST(420000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 3, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040692' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Keo dán đá K-Epoxy', N'keo-dan-da-k-epoxy', N'Keo dán đá K-Epoxy', N'Keo dán đá K-Epoxy')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (31, N'Keo Shilkaler Pro', 6, N'/img_ds/product-42.jpg', CAST(350000.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 3, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040689' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Keo Shilkaler Pro', N'keo-shilkaler-pro', N'Keo Shilkaler Pro', N'Keo Shilkaler Pro')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (32, N'Keo Ốp Lát CiMax', 6, N'/img_ds/product-41.jpg', CAST(350000.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 3, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040685' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Keo Ốp Lát CiMax', N'keo-op-lat-cimax', N'Keo Ốp Lát CiMax', N'Keo Ốp Lát CiMax')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (33, N'Sỏi quay màu vàng MiA-STN-005', 5, N'/img_ds/product-40.jpg', CAST(500000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 8, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040682' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Sỏi quay màu vàng MiA-STN-005', N'soi-quay-mau-vang-mia-stn-005', N'Sỏi quay màu vàng MiA-STN-005', N'Sỏi quay màu vàng MiA-STN-005')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (34, N'Sỏi vàng quay', 5, N'/img_ds/product-39.jpg', CAST(500000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 8, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040679' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Sỏi vàng quay', N'soi-vang-quay', N'Sỏi vàng quay', N'Sỏi vàng quay')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (35, N'Sỏi cuội tự nhiên xanh đen', 5, N'/img_ds/product-38.jpg', CAST(500000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 2, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040674' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Sỏi cuội tự nhiên xanh đen', N'soi-cuoi-tu-nhien-xanh-den', N'Sỏi cuội tự nhiên xanh đen', N'Sỏi cuội tự nhiên xanh đen')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (36, N'Sỏi quay', 5, N'/img_ds/product-37.jpg', CAST(500000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 2, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040670' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Sỏi quay', N'soi-quay', N'Sỏi quay', N'Sỏi quay')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (37, N'Sỏi Hồng tự nhiên (Sỏi sông Hà Nội) MiA-STN-002', 6, N'/img_ds/product-36.jpg', CAST(420000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 4, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Bao', 1, CAST(N'2020-08-08T23:31:11.2040667' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Sỏi Hồng tự nhiên (Sỏi sông Hà Nội) MiA-STN-002', N'soi-hong-tu-nhien-soi-song-ha-noi-mia-stn-002', N'Sỏi Hồng tự nhiên (Sỏi sông Hà Nội) MiA-STN-002', N'Sỏi Hồng tự nhiên (Sỏi sông Hà Nội) MiA-STN-002')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (38, N'Cát Bê Tông CII E&C Loại 2', 5, N'/img_ds/product-35.jpg', CAST(420000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 6, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Tấn', 1, CAST(N'2020-08-08T23:31:11.2040664' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Cát Bê Tông CII E&C Loại 2', N'cat-be-tong-cii-e&c--loai-2', N'Cát Bê Tông CII E&C Loại 2', N'Cát Bê Tông CII E&C Loại 2')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (39, N'Cát Vàng CII E&C', 5, N'/img_ds/product-34.jpg', CAST(350000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 6, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'Tấn', 1, CAST(N'2020-08-08T23:31:11.2040661' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Cát Vàng CII E&C', N'cat-vang-cii-e&c', N'Cát Vàng CII E&C', N'Cát Vàng CII E&C')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (40, N'Cát san lấp nền loại 1 CSL', 5, N'/img_ds/product-33.jpg', CAST(350000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 4, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'Tấn', 1, CAST(N'2020-08-08T23:31:11.2040656' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Cát san lấp nền loại 1 CSL', N'cat-san-lap-nen-loai-1-csl', N'Cát san lấp nền loại 1 CSL', N'Cát san lấp nền loại 1 CSL')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (41, N'Đá Bazan Bánh Dầu', 4, N'/img_ds/product-32.jpg', CAST(500000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 5, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'Cái', 1, CAST(N'2020-08-08T23:31:11.2040652' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Đá Bazan Bánh Dầu', N'gach-tranh-mosaic-nghe-thuat-gt020', N'Đá Bazan Bánh Dầu', N'Đá Bazan Bánh Dầu')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (42, N'Đá Bazan Đen Băm Mặt', 4, N'/img_ds/product-31.jpg', CAST(500000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 5, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'Cái', 1, CAST(N'2020-08-08T23:31:11.2040649' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Đá Bazan Đen Băm Mặt', N'da-bazan-bam-mat', N'Đá Bazan Đen Băm Mặt', N'Đá Bazan Đen Băm Mặt')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (43, N'Đá Bazan Khò Lửa', 4, N'/img_ds/product-30.jpg', CAST(500000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 5, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 1, 1, 0, NULL, N'Cái', 1, CAST(N'2020-08-08T23:31:11.2040646' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Đá Bazan Khò Lửa', N'da-bazan-kho-lua', N'Đá Bazan Khò Lửa', N'Đá Bazan Khò Lửa')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (44, N'Đá Cây Bazan Bo Bồn Hoa', 4, N'/img_ds/product-29.jpg', CAST(500000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 5, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Cây', 1, CAST(N'2020-08-08T23:31:11.2040643' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Đá Cây Bazan Bo Bồn Hoa', N'da-cay-bazan-bo-bon-hoa', N'Đá Cây Bazan Bo Bồn Hoa', N'Đá Cây Bazan Bo Bồn Hoa')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (45, N'Đá Bazan Cubic Băm Mặt', 4, N'/img_ds/product-28.jpg', CAST(420000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 8, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Cái', 1, CAST(N'2020-08-08T23:31:11.2040639' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Đá Bazan Cubic Băm Mặt', N'da-bazan-cubic-bam-mat', N'Đá Bazan Cubic Băm Mặt', N'Đá Bazan Cubic Băm Mặt')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (46, N'Đá Bóc Bazan Đen', 4, N'/img_ds/product-27.jpg', CAST(420000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 8, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Cái', 1, CAST(N'2020-08-08T23:31:11.2040636' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Đá Bóc Bazan Đen', N'da-boc-bazan-den', N'Đá Bóc Bazan Đen', N'Đá Bóc Bazan Đen')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (47, N'Gạch INAX HAL-25B', 7, N'/img_ds/product-2.jpg', CAST(350000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 1, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Viên', 1, CAST(N'2020-08-08T23:31:11.2039580' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Gạch INAX HAL-25B', N'gach-inax-25b', N'Gạch INAX HAL-25B', N'Gạch INAX HAL-25B')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Image], [Price], [PromotionPrice], [Description], [BrandId], [Content], [HomeFlag], [HotFlag], [ViewCount], [Tags], [Unit], [Status], [DateCreated], [DateModified], [SeoPageTitle], [SeoAlias], [SeoKeywords], [SeoDescription]) VALUES (48, N'Gạch INAX-155F', 7, N'/img_ds/product-1.jpg', CAST(350000.00 AS Decimal(18, 2)), NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p><p> Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>', 1, N'<p>Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nullaluctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuerecubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt.</p><p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p><p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>', 0, 0, 0, NULL, N'Viên', 1, CAST(N'2020-08-08T23:31:11.2036273' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Gạch INAX-155F', N'gach-inax-155f', N'Gạch INAX-155F', N'Gạch INAX-155F')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (1, N'30cm x 60cm')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (2, N'6cm × 22,5cm')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (3, N'15cm x 30cm x 100cm')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (4, N'25kg')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (5, N'40cm x 40cm')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (6, N'60cm x 60cm')
SET IDENTITY_INSERT [dbo].[Sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[Slides] ON 

INSERT [dbo].[Slides] ([Id], [Name], [Image], [Url], [DisplayOrder], [Status], [GroupAlias]) VALUES (1, N'Slide 3', N'/img_ds/slide-3.jpg', N'#', 3, 1, N'top')
INSERT [dbo].[Slides] ([Id], [Name], [Image], [Url], [DisplayOrder], [Status], [GroupAlias]) VALUES (2, N'Slide 2', N'/img_ds/slide-2.jpg', N'#', 2, 1, N'top')
INSERT [dbo].[Slides] ([Id], [Name], [Image], [Url], [DisplayOrder], [Status], [GroupAlias]) VALUES (3, N'Slide 1', N'/img_ds/slide-1.jpg', N'#', 1, 1, N'top')
SET IDENTITY_INSERT [dbo].[Slides] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([Id], [FullName], [Address], [PhoneNumber], [DateCreated], [DateModified], [Status]) VALUES (1, N'NCC A', N'140 Lê Trọng Tấn, Tây Thạnh, Tân Phú', N'0111222333', CAST(N'2020-08-08T23:31:11.0087908' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Suppliers] ([Id], [FullName], [Address], [PhoneNumber], [DateCreated], [DateModified], [Status]) VALUES (2, N'NCC B', N'140 Lê Trọng Tấn, Tây Thạnh, Tân Phú', N'0111222333', CAST(N'2020-08-08T23:31:11.0088553' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Suppliers] ([Id], [FullName], [Address], [PhoneNumber], [DateCreated], [DateModified], [Status]) VALUES (3, N'NCC C', N'140 Lê Trọng Tấn, Tây Thạnh, Tân Phú', N'0111222333', CAST(N'2020-08-08T23:31:11.0088560' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
/****** Object:  Index [IX_Announcements_UserId]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_Announcements_UserId] ON [dbo].[Announcements]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AnnouncementUsers_AnnouncementId]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_AnnouncementUsers_AnnouncementId] ON [dbo].[AnnouncementUsers]
(
	[AnnouncementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BillDetails_BillId]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_BillDetails_BillId] ON [dbo].[BillDetails]
(
	[BillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BillDetails_ProductId]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_BillDetails_ProductId] ON [dbo].[BillDetails]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BillDetails_SizeId]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_BillDetails_SizeId] ON [dbo].[BillDetails]
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bills_CustomerId]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bills_CustomerId] ON [dbo].[Bills]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Permissions_FunctionId]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_Permissions_FunctionId] ON [dbo].[Permissions]
(
	[FunctionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Permissions_RoleId]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_Permissions_RoleId] ON [dbo].[Permissions]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductImages_ProductId]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductImages_ProductId] ON [dbo].[ProductImages]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductReceiptDetails_ProductId]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductReceiptDetails_ProductId] ON [dbo].[ProductReceiptDetails]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductReceiptDetails_ProductReceiptId]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductReceiptDetails_ProductReceiptId] ON [dbo].[ProductReceiptDetails]
(
	[ProductReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductReceiptDetails_SizeId]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductReceiptDetails_SizeId] ON [dbo].[ProductReceiptDetails]
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductReceipts_SupplierId]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductReceipts_SupplierId] ON [dbo].[ProductReceipts]
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductReceipts_UserrId]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductReceipts_UserrId] ON [dbo].[ProductReceipts]
(
	[UserrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_BrandId]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_BrandId] ON [dbo].[Products]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductTags_ProductId]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductTags_ProductId] ON [dbo].[ProductTags]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ProductTags_TagId]    Script Date: 8/8/2020 11:41:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductTags_TagId] ON [dbo].[ProductTags]
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Announcements]  WITH CHECK ADD  CONSTRAINT [FK_Announcements_AppUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Announcements] CHECK CONSTRAINT [FK_Announcements_AppUsers_UserId]
GO
ALTER TABLE [dbo].[AnnouncementUsers]  WITH CHECK ADD  CONSTRAINT [FK_AnnouncementUsers_Announcements_AnnouncementId] FOREIGN KEY([AnnouncementId])
REFERENCES [dbo].[Announcements] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AnnouncementUsers] CHECK CONSTRAINT [FK_AnnouncementUsers_Announcements_AnnouncementId]
GO
ALTER TABLE [dbo].[BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillDetails_Bills_BillId] FOREIGN KEY([BillId])
REFERENCES [dbo].[Bills] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BillDetails] CHECK CONSTRAINT [FK_BillDetails_Bills_BillId]
GO
ALTER TABLE [dbo].[BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BillDetails] CHECK CONSTRAINT [FK_BillDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillDetails_Sizes_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Sizes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BillDetails] CHECK CONSTRAINT [FK_BillDetails_Sizes_SizeId]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_AppUsers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[AppUsers] ([Id])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_AppUsers_CustomerId]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_AppRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AppRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_AppRoles_RoleId]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Functions_FunctionId] FOREIGN KEY([FunctionId])
REFERENCES [dbo].[Functions] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Functions_FunctionId]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductReceiptDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductReceiptDetails_ProductReceipts_ProductReceiptId] FOREIGN KEY([ProductReceiptId])
REFERENCES [dbo].[ProductReceipts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductReceiptDetails] CHECK CONSTRAINT [FK_ProductReceiptDetails_ProductReceipts_ProductReceiptId]
GO
ALTER TABLE [dbo].[ProductReceiptDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductReceiptDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductReceiptDetails] CHECK CONSTRAINT [FK_ProductReceiptDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductReceiptDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductReceiptDetails_Sizes_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Sizes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductReceiptDetails] CHECK CONSTRAINT [FK_ProductReceiptDetails_Sizes_SizeId]
GO
ALTER TABLE [dbo].[ProductReceipts]  WITH CHECK ADD  CONSTRAINT [FK_ProductReceipts_AppUsers_UserrId] FOREIGN KEY([UserrId])
REFERENCES [dbo].[AppUsers] ([Id])
GO
ALTER TABLE [dbo].[ProductReceipts] CHECK CONSTRAINT [FK_ProductReceipts_AppUsers_UserrId]
GO
ALTER TABLE [dbo].[ProductReceipts]  WITH CHECK ADD  CONSTRAINT [FK_ProductReceipts_Suppliers_SupplierId] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductReceipts] CHECK CONSTRAINT [FK_ProductReceipts_Suppliers_SupplierId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands_BrandId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[ProductCategories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories_CategoryId]
GO
ALTER TABLE [dbo].[ProductTags]  WITH CHECK ADD  CONSTRAINT [FK_ProductTags_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductTags] CHECK CONSTRAINT [FK_ProductTags_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductTags]  WITH CHECK ADD  CONSTRAINT [FK_ProductTags_Tags_TagId] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductTags] CHECK CONSTRAINT [FK_ProductTags_Tags_TagId]
GO
/****** Object:  StoredProcedure [dbo].[GetRevenueDaily]    Script Date: 8/8/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[GetRevenueDaily]
	@fromDate VARCHAR(10),
	@toDate VARCHAR(10)
AS
BEGIN
		  select
				CAST(b.DateCreated AS DATE) as Date,
				sum(bd.Quantity*bd.Price) as Revenue,
				sum((bd.Quantity*bd.Price)-(bd.Quantity * r.OriginalPrice)) as Profit
				from Bills b
				inner join dbo.BillDetails bd
				on b.Id = bd.BillId
				inner join Products p
				on bd.ProductId  = p.Id
				inner join ProductReceiptDetails r
				on r.ProductId  = p.Id
				where b.DateCreated <= cast(@toDate as date) 
				AND b.DateCreated >= cast(@fromDate as date)
				group by b.DateCreated
END
GO
USE [master]
GO
ALTER DATABASE [QL_Vat_Lieu_Xay_Dung] SET  READ_WRITE 
GO
