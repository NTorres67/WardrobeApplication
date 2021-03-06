USE [master]
GO
/****** Object:  Database [WardrobeDB]    Script Date: 3/18/2018 8:46:57 PM ******/
CREATE DATABASE [WardrobeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WardrobeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WardrobeDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WardrobeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WardrobeDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WardrobeDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WardrobeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WardrobeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WardrobeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WardrobeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WardrobeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WardrobeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WardrobeDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WardrobeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WardrobeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WardrobeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WardrobeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WardrobeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WardrobeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WardrobeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WardrobeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WardrobeDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WardrobeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WardrobeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WardrobeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WardrobeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WardrobeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WardrobeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WardrobeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WardrobeDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WardrobeDB] SET  MULTI_USER 
GO
ALTER DATABASE [WardrobeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WardrobeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WardrobeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WardrobeDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WardrobeDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WardrobeDB]
GO
/****** Object:  Table [dbo].[Accessory]    Script Date: 3/18/2018 8:46:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessory](
	[AccessoryID] [int] IDENTITY(1,1) NOT NULL,
	[AccessoryName] [nvarchar](100) NOT NULL,
	[AccessoryPhoto] [nvarchar](200) NOT NULL,
	[AccessoryColor] [nvarchar](50) NULL,
	[SeasonID] [int] NOT NULL,
	[OccasionID] [int] NOT NULL,
 CONSTRAINT [PK_Accessory] PRIMARY KEY CLUSTERED 
(
	[AccessoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bottom]    Script Date: 3/18/2018 8:46:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bottom](
	[BottomID] [int] IDENTITY(1,1) NOT NULL,
	[BottomName] [nvarchar](100) NOT NULL,
	[BottomPhoto] [nvarchar](200) NOT NULL,
	[BottomColor] [nvarchar](50) NOT NULL,
	[BottomType] [nvarchar](100) NULL,
	[SeasonID] [int] NOT NULL,
	[OccasionID] [int] NOT NULL,
 CONSTRAINT [PK_Bottom] PRIMARY KEY CLUSTERED 
(
	[BottomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Occasion]    Script Date: 3/18/2018 8:46:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occasion](
	[OccasionID] [int] IDENTITY(1,1) NOT NULL,
	[OccasionName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Occasion] PRIMARY KEY CLUSTERED 
(
	[OccasionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Outfit]    Script Date: 3/18/2018 8:46:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outfit](
	[OutfitID] [int] IDENTITY(1,1) NOT NULL,
	[TopID] [int] NOT NULL,
	[BottomID] [int] NOT NULL,
	[ShoeID] [int] NOT NULL,
	[AccessoryID] [int] NOT NULL,
	[SeasonID] [int] NOT NULL,
	[OccasionID] [int] NOT NULL,
 CONSTRAINT [PK_Outfit] PRIMARY KEY CLUSTERED 
(
	[OutfitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Season]    Script Date: 3/18/2018 8:46:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Season](
	[SeasonID] [int] IDENTITY(1,1) NOT NULL,
	[SeasonName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Season] PRIMARY KEY CLUSTERED 
(
	[SeasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shoe]    Script Date: 3/18/2018 8:46:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shoe](
	[ShoeID] [int] IDENTITY(1,1) NOT NULL,
	[ShoeName] [nvarchar](100) NOT NULL,
	[ShoePhoto] [nvarchar](200) NOT NULL,
	[ShoeColor] [nvarchar](50) NOT NULL,
	[SeasonID] [int] NOT NULL,
	[OccasionID] [int] NOT NULL,
 CONSTRAINT [PK_Shoe] PRIMARY KEY CLUSTERED 
(
	[ShoeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Top]    Script Date: 3/18/2018 8:46:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Top](
	[TopID] [int] IDENTITY(1,1) NOT NULL,
	[TopName] [nvarchar](100) NOT NULL,
	[TopPhoto] [nvarchar](200) NOT NULL,
	[TopColor] [nvarchar](50) NOT NULL,
	[TopType] [nvarchar](100) NULL,
	[SeasonID] [int] NOT NULL,
	[OccasionID] [int] NOT NULL,
 CONSTRAINT [PK_Top] PRIMARY KEY CLUSTERED 
(
	[TopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Accessory] ON 

INSERT [dbo].[Accessory] ([AccessoryID], [AccessoryName], [AccessoryPhoto], [AccessoryColor], [SeasonID], [OccasionID]) VALUES (1, N'Gold Ring', N'/Content/images/accessories/GoldRing.jpg', N'Gold', 1, 1)
INSERT [dbo].[Accessory] ([AccessoryID], [AccessoryName], [AccessoryPhoto], [AccessoryColor], [SeasonID], [OccasionID]) VALUES (2, N'Silver & Rose Gold Ring', N'/Content/images/accessories/SilverRoseGoldRing.jpg', N'Silver & Rose Gold', 1, 1)
INSERT [dbo].[Accessory] ([AccessoryID], [AccessoryName], [AccessoryPhoto], [AccessoryColor], [SeasonID], [OccasionID]) VALUES (3, N'Titanium & Koa Ring', N'/Content/images/accessories/TitaniumKoaRing.jpg', N'Titanium & Koa Wood', 1, 1)
INSERT [dbo].[Accessory] ([AccessoryID], [AccessoryName], [AccessoryPhoto], [AccessoryColor], [SeasonID], [OccasionID]) VALUES (4, N'Steel & Koa Wood Watch', N'/Content/images/accessories/SteelKoaWatch.jpg', N'Silver, Wood', 1, 1)
INSERT [dbo].[Accessory] ([AccessoryID], [AccessoryName], [AccessoryPhoto], [AccessoryColor], [SeasonID], [OccasionID]) VALUES (6, N'Turtle Necklace', N'/Content/images/accessories/TurtleNecklace.jpg', N'Blue, Gold & Black', 1, 2)
SET IDENTITY_INSERT [dbo].[Accessory] OFF
SET IDENTITY_INSERT [dbo].[Bottom] ON 

INSERT [dbo].[Bottom] ([BottomID], [BottomName], [BottomPhoto], [BottomColor], [BottomType], [SeasonID], [OccasionID]) VALUES (1, N'Black Jeans', N'/Content/images/bottoms/BlackJeans.jpeg', N'Black', N'Jeans', 1, 3)
INSERT [dbo].[Bottom] ([BottomID], [BottomName], [BottomPhoto], [BottomColor], [BottomType], [SeasonID], [OccasionID]) VALUES (2, N'Black Shorts', N'/Content/images/bottoms/BlackShorts_.jpg', N'Black', N'Shorts', 4, 3)
INSERT [dbo].[Bottom] ([BottomID], [BottomName], [BottomPhoto], [BottomColor], [BottomType], [SeasonID], [OccasionID]) VALUES (3, N'Black Slacks', N'/Content/images/bottoms/BlackSlacks.jpg', N'Black', N'Slacks', 1, 2)
INSERT [dbo].[Bottom] ([BottomID], [BottomName], [BottomPhoto], [BottomColor], [BottomType], [SeasonID], [OccasionID]) VALUES (4, N'Blue Jeans', N'/Content/images/bottoms/BlueJeans.jpg', N'Blue', N'Jeans', 1, 3)
INSERT [dbo].[Bottom] ([BottomID], [BottomName], [BottomPhoto], [BottomColor], [BottomType], [SeasonID], [OccasionID]) VALUES (5, N'Red with White Hibiscus Shorts', N'/Content/images/bottoms/RedHibiscusShorts.jpg', N'Red & White', N'Shorts', 4, 3)
INSERT [dbo].[Bottom] ([BottomID], [BottomName], [BottomPhoto], [BottomColor], [BottomType], [SeasonID], [OccasionID]) VALUES (6, N'Blue & White Floral Shorts', N'/Content/images/bottoms/BlueWhiteShorts.jpg', N'Blue & White', N'Shorts', 4, 3)
SET IDENTITY_INSERT [dbo].[Bottom] OFF
SET IDENTITY_INSERT [dbo].[Occasion] ON 

INSERT [dbo].[Occasion] ([OccasionID], [OccasionName]) VALUES (1, N'All')
INSERT [dbo].[Occasion] ([OccasionID], [OccasionName]) VALUES (2, N'Business')
INSERT [dbo].[Occasion] ([OccasionID], [OccasionName]) VALUES (3, N'Casual')
SET IDENTITY_INSERT [dbo].[Occasion] OFF
SET IDENTITY_INSERT [dbo].[Outfit] ON 

INSERT [dbo].[Outfit] ([OutfitID], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccasionID]) VALUES (4, 3, 2, 2, 3, 4, 3)
INSERT [dbo].[Outfit] ([OutfitID], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccasionID]) VALUES (5, 1, 1, 1, 1, 1, 3)
INSERT [dbo].[Outfit] ([OutfitID], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccasionID]) VALUES (6, 2, 3, 1, 4, 1, 2)
INSERT [dbo].[Outfit] ([OutfitID], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccasionID]) VALUES (7, 4, 6, 3, 6, 4, 3)
INSERT [dbo].[Outfit] ([OutfitID], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccasionID]) VALUES (8, 3, 5, 2, 6, 1, 3)
SET IDENTITY_INSERT [dbo].[Outfit] OFF
SET IDENTITY_INSERT [dbo].[Season] ON 

INSERT [dbo].[Season] ([SeasonID], [SeasonName]) VALUES (1, N'All')
INSERT [dbo].[Season] ([SeasonID], [SeasonName]) VALUES (2, N'Fall')
INSERT [dbo].[Season] ([SeasonID], [SeasonName]) VALUES (3, N'Spring')
INSERT [dbo].[Season] ([SeasonID], [SeasonName]) VALUES (4, N'Summer')
INSERT [dbo].[Season] ([SeasonID], [SeasonName]) VALUES (5, N'Winter')
SET IDENTITY_INSERT [dbo].[Season] OFF
SET IDENTITY_INSERT [dbo].[Shoe] ON 

INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [ShoePhoto], [ShoeColor], [SeasonID], [OccasionID]) VALUES (1, N'Brown Boots', N'/Content/images/shoes/BrownBoots.jpg', N'Brown', 1, 2)
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [ShoePhoto], [ShoeColor], [SeasonID], [OccasionID]) VALUES (2, N'"Locals" Slippers', N'/Content/images/shoes/Slippahs.jpg', N'Black', 4, 3)
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [ShoePhoto], [ShoeColor], [SeasonID], [OccasionID]) VALUES (3, N'White Tennis Shoes', N'/Content/images/shoes/WhiteNike_.jpg', N'White', 1, 3)
SET IDENTITY_INSERT [dbo].[Shoe] OFF
SET IDENTITY_INSERT [dbo].[Top] ON 

INSERT [dbo].[Top] ([TopID], [TopName], [TopPhoto], [TopColor], [TopType], [SeasonID], [OccasionID]) VALUES (1, N'Black with Fronds', N'/Content/images/tops/BlackGreenFronds.jpg', N'Black, Green, Pink', N'Women''s Blouse', 1, 2)
INSERT [dbo].[Top] ([TopID], [TopName], [TopPhoto], [TopColor], [TopType], [SeasonID], [OccasionID]) VALUES (2, N'Navy Blue with Orchids', N'/Content/images/tops/BlueGreenOrchid.jpg', N'Blue, Green, White', N'Women''s Blouse', 1, 3)
INSERT [dbo].[Top] ([TopID], [TopName], [TopPhoto], [TopColor], [TopType], [SeasonID], [OccasionID]) VALUES (3, N'Blue Tank Top with Hook', N'/Content/images/tops/BlueTankTop.jpg', N'Blue, Black, White', N'Tank Top', 4, 3)
INSERT [dbo].[Top] ([TopID], [TopName], [TopPhoto], [TopColor], [TopType], [SeasonID], [OccasionID]) VALUES (4, N'Black Tank Top', N'/Content/images/tops/BlackTankTop.jpg', N'Black', N'Tank Top', 4, 3)
SET IDENTITY_INSERT [dbo].[Top] OFF
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_Occasion] FOREIGN KEY([OccasionID])
REFERENCES [dbo].[Occasion] ([OccasionID])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_Occasion]
GO
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_Season] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Season] ([SeasonID])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_Season]
GO
ALTER TABLE [dbo].[Bottom]  WITH CHECK ADD  CONSTRAINT [FK_Bottom_Occasion] FOREIGN KEY([OccasionID])
REFERENCES [dbo].[Occasion] ([OccasionID])
GO
ALTER TABLE [dbo].[Bottom] CHECK CONSTRAINT [FK_Bottom_Occasion]
GO
ALTER TABLE [dbo].[Bottom]  WITH CHECK ADD  CONSTRAINT [FK_Bottom_Season] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Season] ([SeasonID])
GO
ALTER TABLE [dbo].[Bottom] CHECK CONSTRAINT [FK_Bottom_Season]
GO
ALTER TABLE [dbo].[Outfit]  WITH CHECK ADD  CONSTRAINT [FK_Outfit_Accessory] FOREIGN KEY([AccessoryID])
REFERENCES [dbo].[Accessory] ([AccessoryID])
GO
ALTER TABLE [dbo].[Outfit] CHECK CONSTRAINT [FK_Outfit_Accessory]
GO
ALTER TABLE [dbo].[Outfit]  WITH CHECK ADD  CONSTRAINT [FK_Outfit_Bottom] FOREIGN KEY([BottomID])
REFERENCES [dbo].[Bottom] ([BottomID])
GO
ALTER TABLE [dbo].[Outfit] CHECK CONSTRAINT [FK_Outfit_Bottom]
GO
ALTER TABLE [dbo].[Outfit]  WITH CHECK ADD  CONSTRAINT [FK_Outfit_Occasion] FOREIGN KEY([OccasionID])
REFERENCES [dbo].[Occasion] ([OccasionID])
GO
ALTER TABLE [dbo].[Outfit] CHECK CONSTRAINT [FK_Outfit_Occasion]
GO
ALTER TABLE [dbo].[Outfit]  WITH CHECK ADD  CONSTRAINT [FK_Outfit_Season] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Season] ([SeasonID])
GO
ALTER TABLE [dbo].[Outfit] CHECK CONSTRAINT [FK_Outfit_Season]
GO
ALTER TABLE [dbo].[Outfit]  WITH CHECK ADD  CONSTRAINT [FK_Outfit_Shoe] FOREIGN KEY([ShoeID])
REFERENCES [dbo].[Shoe] ([ShoeID])
GO
ALTER TABLE [dbo].[Outfit] CHECK CONSTRAINT [FK_Outfit_Shoe]
GO
ALTER TABLE [dbo].[Outfit]  WITH CHECK ADD  CONSTRAINT [FK_Outfit_Top] FOREIGN KEY([TopID])
REFERENCES [dbo].[Top] ([TopID])
GO
ALTER TABLE [dbo].[Outfit] CHECK CONSTRAINT [FK_Outfit_Top]
GO
ALTER TABLE [dbo].[Shoe]  WITH CHECK ADD  CONSTRAINT [FK_Shoe_Occasion] FOREIGN KEY([OccasionID])
REFERENCES [dbo].[Occasion] ([OccasionID])
GO
ALTER TABLE [dbo].[Shoe] CHECK CONSTRAINT [FK_Shoe_Occasion]
GO
ALTER TABLE [dbo].[Shoe]  WITH CHECK ADD  CONSTRAINT [FK_Shoe_Season] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Season] ([SeasonID])
GO
ALTER TABLE [dbo].[Shoe] CHECK CONSTRAINT [FK_Shoe_Season]
GO
ALTER TABLE [dbo].[Top]  WITH CHECK ADD  CONSTRAINT [FK_Top_Occasion] FOREIGN KEY([OccasionID])
REFERENCES [dbo].[Occasion] ([OccasionID])
GO
ALTER TABLE [dbo].[Top] CHECK CONSTRAINT [FK_Top_Occasion]
GO
ALTER TABLE [dbo].[Top]  WITH CHECK ADD  CONSTRAINT [FK_Top_Season] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Season] ([SeasonID])
GO
ALTER TABLE [dbo].[Top] CHECK CONSTRAINT [FK_Top_Season]
GO
USE [master]
GO
ALTER DATABASE [WardrobeDB] SET  READ_WRITE 
GO
