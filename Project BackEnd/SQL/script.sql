USE [master]
GO
/****** Object:  Database [TechnicalTes]    Script Date: 12/09/2024 22:22:12 ******/
CREATE DATABASE [TechnicalTes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TechnicalTes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TechnicalTes.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TechnicalTes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TechnicalTes_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TechnicalTes] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TechnicalTes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TechnicalTes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TechnicalTes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TechnicalTes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TechnicalTes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TechnicalTes] SET ARITHABORT OFF 
GO
ALTER DATABASE [TechnicalTes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TechnicalTes] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TechnicalTes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TechnicalTes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TechnicalTes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TechnicalTes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TechnicalTes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TechnicalTes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TechnicalTes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TechnicalTes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TechnicalTes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TechnicalTes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TechnicalTes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TechnicalTes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TechnicalTes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TechnicalTes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TechnicalTes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TechnicalTes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TechnicalTes] SET RECOVERY FULL 
GO
ALTER DATABASE [TechnicalTes] SET  MULTI_USER 
GO
ALTER DATABASE [TechnicalTes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TechnicalTes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TechnicalTes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TechnicalTes] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [TechnicalTes]
GO
/****** Object:  Table [dbo].[ms_storage_location]    Script Date: 12/09/2024 22:22:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ms_storage_location](
	[location_id] [nvarchar](10) NOT NULL,
	[location_name] [nvarchar](100) NULL,
 CONSTRAINT [PK_ms_storage_location] PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ms_user]    Script Date: 12/09/2024 22:22:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ms_user](
	[user_id] [bigint] NOT NULL,
	[user_name] [nvarchar](20) NULL,
	[password] [nvarchar](50) NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_ms_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tr_bpkb]    Script Date: 12/09/2024 22:22:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tr_bpkb](
	[agreement_number] [nvarchar](100) NOT NULL,
	[bpkb_no] [nvarchar](100) NULL,
	[branch_id] [nvarchar](10) NULL,
	[bpkb_date] [datetime] NULL,
	[faktur_no] [nvarchar](100) NULL,
	[faktur_date] [datetime] NULL,
	[location_id] [nvarchar](10) NULL,
	[police_no] [nvarchar](20) NULL,
	[bpkb_date_in] [datetime] NULL,
	[created_by] [nvarchar](20) NULL,
	[created_on] [datetime] NULL,
	[last_update_by] [nvarchar](20) NULL,
	[last_update_on] [datetime] NULL,
 CONSTRAINT [PK_tr_bpkb] PRIMARY KEY CLUSTERED 
(
	[agreement_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tr_bpkb]  WITH CHECK ADD FOREIGN KEY([location_id])
REFERENCES [dbo].[ms_storage_location] ([location_id])
GO
USE [master]
GO
ALTER DATABASE [TechnicalTes] SET  READ_WRITE 
GO
