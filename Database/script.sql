USE [master]
GO
/****** Object:  Database [EstacionamientoDB]    Script Date: 4/28/2024 1:06:38 PM ******/
CREATE DATABASE [EstacionamientoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EstacionamientoDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EstacionamientoDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EstacionamientoDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EstacionamientoDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EstacionamientoDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EstacionamientoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EstacionamientoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EstacionamientoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EstacionamientoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EstacionamientoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EstacionamientoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EstacionamientoDB] SET  MULTI_USER 
GO
ALTER DATABASE [EstacionamientoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EstacionamientoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EstacionamientoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EstacionamientoDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EstacionamientoDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EstacionamientoDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EstacionamientoDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [EstacionamientoDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EstacionamientoDB]
GO
/****** Object:  User [guess_user]    Script Date: 4/28/2024 1:06:39 PM ******/
CREATE USER [guess_user] FOR LOGIN [guess_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [guess_user]
GO
ALTER ROLE [db_datareader] ADD MEMBER [guess_user]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [guess_user]
GO
/****** Object:  Table [dbo].[VEHICULOS]    Script Date: 4/28/2024 1:06:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VEHICULOS](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[placa] [varchar](20) NULL,
	[oficial] [bit] NOT NULL,
	[fecha_entrada] [datetime2](7) NOT NULL,
	[fecha_salida] [datetime2](7) NULL,
	[tarifa] [float] NOT NULL,
 CONSTRAINT [PK_VEHICULOS] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[VEHICULOS] ON 

INSERT [dbo].[VEHICULOS] ([rowid], [placa], [oficial], [fecha_entrada], [fecha_salida], [tarifa]) VALUES (1, N'P-975FWP', 1, CAST(N'2024-04-27T20:29:29.7559586' AS DateTime2), CAST(N'2024-04-27T22:00:08.4277703' AS DateTime2), 0)
INSERT [dbo].[VEHICULOS] ([rowid], [placa], [oficial], [fecha_entrada], [fecha_salida], [tarifa]) VALUES (2, N'M-986CSY', 0, CAST(N'2024-04-27T20:30:40.5891516' AS DateTime2), CAST(N'2024-04-28T11:23:13.0660107' AS DateTime2), 1338.65)
INSERT [dbo].[VEHICULOS] ([rowid], [placa], [oficial], [fecha_entrada], [fecha_salida], [tarifa]) VALUES (3, N'P-315OJA', 0, CAST(N'2024-04-27T21:58:07.9226212' AS DateTime2), CAST(N'2024-04-27T21:59:51.9896587' AS DateTime2), 2.52)
INSERT [dbo].[VEHICULOS] ([rowid], [placa], [oficial], [fecha_entrada], [fecha_salida], [tarifa]) VALUES (4, N'M-986CSY', 0, CAST(N'2024-04-28T11:29:04.6828616' AS DateTime2), CAST(N'2024-04-28T11:33:50.4255411' AS DateTime2), 7.1)
INSERT [dbo].[VEHICULOS] ([rowid], [placa], [oficial], [fecha_entrada], [fecha_salida], [tarifa]) VALUES (5, N'M-986CSY', 0, CAST(N'2024-04-28T11:34:09.2356074' AS DateTime2), CAST(N'2024-04-28T12:25:03.2234510' AS DateTime2), 76.29)
INSERT [dbo].[VEHICULOS] ([rowid], [placa], [oficial], [fecha_entrada], [fecha_salida], [tarifa]) VALUES (6, N'P-1212332', 0, CAST(N'2024-04-28T12:02:00.5318705' AS DateTime2), NULL, 0)
INSERT [dbo].[VEHICULOS] ([rowid], [placa], [oficial], [fecha_entrada], [fecha_salida], [tarifa]) VALUES (7, N'M-986CSY', 0, CAST(N'2024-04-28T12:25:12.8040331' AS DateTime2), NULL, 0)
INSERT [dbo].[VEHICULOS] ([rowid], [placa], [oficial], [fecha_entrada], [fecha_salida], [tarifa]) VALUES (9, N'P-975FW5', 0, CAST(N'2024-04-28T12:41:06.4098343' AS DateTime2), CAST(N'2024-04-28T12:49:17.5502637' AS DateTime2), 12.24)
INSERT [dbo].[VEHICULOS] ([rowid], [placa], [oficial], [fecha_entrada], [fecha_salida], [tarifa]) VALUES (10, N'M-986CSK', 0, CAST(N'2024-04-28T12:54:39.0196937' AS DateTime2), NULL, 0)
INSERT [dbo].[VEHICULOS] ([rowid], [placa], [oficial], [fecha_entrada], [fecha_salida], [tarifa]) VALUES (11, N'M-986CSP', 1, CAST(N'2024-04-28T12:57:24.9166598' AS DateTime2), NULL, 0)
INSERT [dbo].[VEHICULOS] ([rowid], [placa], [oficial], [fecha_entrada], [fecha_salida], [tarifa]) VALUES (12, N'M-986CSF', 0, CAST(N'2024-04-28T12:57:59.9955859' AS DateTime2), NULL, 0)
SET IDENTITY_INSERT [dbo].[VEHICULOS] OFF
GO
USE [master]
GO
ALTER DATABASE [EstacionamientoDB] SET  READ_WRITE 
GO
