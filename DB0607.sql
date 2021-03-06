USE [master]
GO
/****** Object:  Database [dbTomoca]    Script Date: 7/6/2021 10:52:24 PM ******/
CREATE DATABASE [dbTomoca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbTomoca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbTomoca.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbTomoca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbTomoca_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbTomoca] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbTomoca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbTomoca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbTomoca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbTomoca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbTomoca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbTomoca] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbTomoca] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbTomoca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbTomoca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbTomoca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbTomoca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbTomoca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbTomoca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbTomoca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbTomoca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbTomoca] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbTomoca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbTomoca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbTomoca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbTomoca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbTomoca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbTomoca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbTomoca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbTomoca] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbTomoca] SET  MULTI_USER 
GO
ALTER DATABASE [dbTomoca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbTomoca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbTomoca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbTomoca] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbTomoca] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbTomoca] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbTomoca] SET QUERY_STORE = OFF
GO
USE [dbTomoca]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[ActorID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Nationality] [nvarchar](100) NOT NULL,
	[Birth] [date] NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[ActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Subject] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Directors]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directors](
	[DirectorID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Nationality] [nvarchar](100) NOT NULL,
	[Birth] [date] NULL,
 CONSTRAINT [PK_Directors] PRIMARY KEY CLUSTERED 
(
	[DirectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[GenreName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocateMovie]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocateMovie](
	[TicketID] [int] NOT NULL,
	[Locate] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LocateMovie] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieActor]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieActor](
	[MovieID] [int] NOT NULL,
	[ActorID] [int] NOT NULL,
 CONSTRAINT [PK_MovieActor] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC,
	[ActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieDirector]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieDirector](
	[MovieID] [int] NOT NULL,
	[DirectorID] [int] NOT NULL,
 CONSTRAINT [PK_MovieDirector] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC,
	[DirectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](max) NULL,
	[Plot] [varchar](max) NULL,
	[ReleaseYear] [int] NULL,
	[IMDb] [float] NULL,
	[Tomatometer] [varchar](10) NULL,
	[AudienceScore] [varchar](10) NULL,
	[Image] [varchar](max) NULL,
	[Trailer] [varchar](max) NULL,
	[Upvote] [int] NULL,
	[Downvote] [int] NULL,
	[TimeOfFilm] [time](7) NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MoviesGenres]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoviesGenres](
	[MovieID] [int] NOT NULL,
	[GenreID] [int] NOT NULL,
 CONSTRAINT [PK_MoviesGenres] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC,
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MoviesVote]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoviesVote](
	[UserID] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
	[Action] [bit] NOT NULL,
 CONSTRAINT [PK_MoviesVote] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieTheater]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieTheater](
	[TheaterID] [int] IDENTITY(1,1) NOT NULL,
	[TheaterName] [nvarchar](max) NOT NULL,
	[CityID] [int] NOT NULL,
	[Type] [int] NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_MovieTheater] PRIMARY KEY CLUSTERED 
(
	[TheaterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[Uptove] [int] NOT NULL,
	[Downvote] [int] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsAndImage]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsAndImage](
	[NewsID] [int] NOT NULL,
	[NewsImageID] [int] NOT NULL,
 CONSTRAINT [PK_NewsAndImage] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC,
	[NewsImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsImage]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsImage](
	[NewsImageID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_NewsImage] PRIMARY KEY CLUSTERED 
(
	[NewsImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsVote]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsVote](
	[UserID] [int] NOT NULL,
	[NewsID] [int] NOT NULL,
	[Action] [bit] NOT NULL,
 CONSTRAINT [PK_NewsVote] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewOfMovie]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewOfMovie](
	[MovieID] [int] NOT NULL,
	[YoutubeID] [int] NOT NULL,
 CONSTRAINT [PK_ReviewOfMovie] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC,
	[YoutubeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SetShowTime]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetShowTime](
	[ID] [int] NOT NULL,
	[TimeID] [int] NOT NULL,
 CONSTRAINT [PK_SetShowTime] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[TimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShowTime]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShowTime](
	[TimeID] [int] IDENTITY(1,1) NOT NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_ShowTime] PRIMARY KEY CLUSTERED 
(
	[TimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShowTimeMovie]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShowTimeMovie](
	[ID] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
	[TheaterID] [int] NOT NULL,
 CONSTRAINT [PK_ShowTimeMovie] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Theater]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Theater](
	[TheaterID] [int] IDENTITY(1,1) NOT NULL,
	[Theater] [varchar](50) NOT NULL,
	[Logo] [nvarchar](max) NULL,
 CONSTRAINT [PK_Theater] PRIMARY KEY CLUSTERED 
(
	[TheaterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[TicketNumber] [int] NOT NULL,
	[TicketAvailable] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
	[TheaterID] [int] NOT NULL,
	[Money] [int] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketType]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketType](
	[TicketID] [int] NOT NULL,
	[VIP] [int] NOT NULL,
	[Adult] [int] NOT NULL,
	[Student] [int] NOT NULL,
	[Child] [int] NOT NULL,
	[Total] [int] NOT NULL,
 CONSTRAINT [PK_TicketType] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBook]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBook](
	[UserID] [int] NOT NULL,
	[TicketID] [int] NOT NULL,
 CONSTRAINT [PK_UserBook] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Permission] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YoutubeReviews]    Script Date: 7/6/2021 10:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YoutubeReviews](
	[YoutubeID] [int] IDENTITY(1,1) NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Video] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_YoutubeReviews] PRIMARY KEY CLUSTERED 
(
	[YoutubeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Movies]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[MovieActor]  WITH CHECK ADD  CONSTRAINT [FK_MovieActor_Actors] FOREIGN KEY([ActorID])
REFERENCES [dbo].[Actors] ([ActorID])
GO
ALTER TABLE [dbo].[MovieActor] CHECK CONSTRAINT [FK_MovieActor_Actors]
GO
ALTER TABLE [dbo].[MovieActor]  WITH CHECK ADD  CONSTRAINT [FK_MovieActor_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[MovieActor] CHECK CONSTRAINT [FK_MovieActor_Movies]
GO
ALTER TABLE [dbo].[MovieDirector]  WITH CHECK ADD  CONSTRAINT [FK_MovieDirector_Directors] FOREIGN KEY([DirectorID])
REFERENCES [dbo].[Directors] ([DirectorID])
GO
ALTER TABLE [dbo].[MovieDirector] CHECK CONSTRAINT [FK_MovieDirector_Directors]
GO
ALTER TABLE [dbo].[MovieDirector]  WITH CHECK ADD  CONSTRAINT [FK_MovieDirector_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[MovieDirector] CHECK CONSTRAINT [FK_MovieDirector_Movies]
GO
ALTER TABLE [dbo].[MoviesGenres]  WITH CHECK ADD  CONSTRAINT [FK_MoviesGenres_Genres] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genres] ([GenreID])
GO
ALTER TABLE [dbo].[MoviesGenres] CHECK CONSTRAINT [FK_MoviesGenres_Genres]
GO
ALTER TABLE [dbo].[MoviesGenres]  WITH CHECK ADD  CONSTRAINT [FK_MoviesGenres_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[MoviesGenres] CHECK CONSTRAINT [FK_MoviesGenres_Movies]
GO
ALTER TABLE [dbo].[MoviesVote]  WITH CHECK ADD  CONSTRAINT [FK_MoviesVote_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[MoviesVote] CHECK CONSTRAINT [FK_MoviesVote_Movies]
GO
ALTER TABLE [dbo].[MoviesVote]  WITH CHECK ADD  CONSTRAINT [FK_MoviesVote_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[MoviesVote] CHECK CONSTRAINT [FK_MoviesVote_Users]
GO
ALTER TABLE [dbo].[MovieTheater]  WITH CHECK ADD  CONSTRAINT [FK_MovieTheater_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[MovieTheater] CHECK CONSTRAINT [FK_MovieTheater_City]
GO
ALTER TABLE [dbo].[MovieTheater]  WITH CHECK ADD  CONSTRAINT [FK_MovieTheater_Theater] FOREIGN KEY([Type])
REFERENCES [dbo].[Theater] ([TheaterID])
GO
ALTER TABLE [dbo].[MovieTheater] CHECK CONSTRAINT [FK_MovieTheater_Theater]
GO
ALTER TABLE [dbo].[NewsAndImage]  WITH CHECK ADD  CONSTRAINT [FK_NewsAndImage_News] FOREIGN KEY([NewsID])
REFERENCES [dbo].[News] ([NewsID])
GO
ALTER TABLE [dbo].[NewsAndImage] CHECK CONSTRAINT [FK_NewsAndImage_News]
GO
ALTER TABLE [dbo].[NewsAndImage]  WITH CHECK ADD  CONSTRAINT [FK_NewsAndImage_NewsImage] FOREIGN KEY([NewsImageID])
REFERENCES [dbo].[NewsImage] ([NewsImageID])
GO
ALTER TABLE [dbo].[NewsAndImage] CHECK CONSTRAINT [FK_NewsAndImage_NewsImage]
GO
ALTER TABLE [dbo].[NewsVote]  WITH CHECK ADD  CONSTRAINT [FK_NewsVote_News] FOREIGN KEY([NewsID])
REFERENCES [dbo].[News] ([NewsID])
GO
ALTER TABLE [dbo].[NewsVote] CHECK CONSTRAINT [FK_NewsVote_News]
GO
ALTER TABLE [dbo].[NewsVote]  WITH CHECK ADD  CONSTRAINT [FK_NewsVote_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[NewsVote] CHECK CONSTRAINT [FK_NewsVote_Users]
GO
ALTER TABLE [dbo].[ReviewOfMovie]  WITH CHECK ADD  CONSTRAINT [FK_ReviewOfMovie_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[ReviewOfMovie] CHECK CONSTRAINT [FK_ReviewOfMovie_Movies]
GO
ALTER TABLE [dbo].[ReviewOfMovie]  WITH CHECK ADD  CONSTRAINT [FK_ReviewOfMovie_YoutubeReviews] FOREIGN KEY([YoutubeID])
REFERENCES [dbo].[YoutubeReviews] ([YoutubeID])
GO
ALTER TABLE [dbo].[ReviewOfMovie] CHECK CONSTRAINT [FK_ReviewOfMovie_YoutubeReviews]
GO
ALTER TABLE [dbo].[SetShowTime]  WITH CHECK ADD  CONSTRAINT [FK_SetShowTime_ShowTime] FOREIGN KEY([TimeID])
REFERENCES [dbo].[ShowTime] ([TimeID])
GO
ALTER TABLE [dbo].[SetShowTime] CHECK CONSTRAINT [FK_SetShowTime_ShowTime]
GO
ALTER TABLE [dbo].[SetShowTime]  WITH CHECK ADD  CONSTRAINT [FK_SetShowTime_ShowTimeMovie] FOREIGN KEY([ID])
REFERENCES [dbo].[ShowTimeMovie] ([ID])
GO
ALTER TABLE [dbo].[SetShowTime] CHECK CONSTRAINT [FK_SetShowTime_ShowTimeMovie]
GO
ALTER TABLE [dbo].[ShowTimeMovie]  WITH CHECK ADD  CONSTRAINT [FK_ShowTimeMovie_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[ShowTimeMovie] CHECK CONSTRAINT [FK_ShowTimeMovie_Movies]
GO
ALTER TABLE [dbo].[ShowTimeMovie]  WITH CHECK ADD  CONSTRAINT [FK_ShowTimeMovie_MovieTheater] FOREIGN KEY([TheaterID])
REFERENCES [dbo].[MovieTheater] ([TheaterID])
GO
ALTER TABLE [dbo].[ShowTimeMovie] CHECK CONSTRAINT [FK_ShowTimeMovie_MovieTheater]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_LocateMovie] FOREIGN KEY([TicketID])
REFERENCES [dbo].[LocateMovie] ([TicketID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_LocateMovie]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Movies]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_MovieTheater] FOREIGN KEY([TheaterID])
REFERENCES [dbo].[MovieTheater] ([TheaterID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_MovieTheater]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_TicketType] FOREIGN KEY([TicketID])
REFERENCES [dbo].[TicketType] ([TicketID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_TicketType]
GO
ALTER TABLE [dbo].[UserBook]  WITH CHECK ADD  CONSTRAINT [FK_UserBook_Ticket] FOREIGN KEY([TicketID])
REFERENCES [dbo].[Ticket] ([TicketID])
GO
ALTER TABLE [dbo].[UserBook] CHECK CONSTRAINT [FK_UserBook_Ticket]
GO
ALTER TABLE [dbo].[UserBook]  WITH CHECK ADD  CONSTRAINT [FK_UserBook_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserBook] CHECK CONSTRAINT [FK_UserBook_Users]
GO
USE [master]
GO
ALTER DATABASE [dbTomoca] SET  READ_WRITE 
GO
