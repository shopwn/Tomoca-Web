/****** Object:  Database [Tomoca_db]    Script Date: 6/23/2021 10:22:25 PM ******/
CREATE DATABASE [Tomoca_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tomoca_db', FILENAME = N'C:\Users\bisicetea\Desktop\MVC\Project\Tomoca-movie-website\Tomoca_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tomoca_db_log', FILENAME = N'C:\Users\bisicetea\Desktop\MVC\Project\Tomoca-movie-website\Tomoca_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Tomoca_db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tomoca_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tomoca_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tomoca_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tomoca_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tomoca_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tomoca_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tomoca_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tomoca_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tomoca_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tomoca_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tomoca_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tomoca_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tomoca_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tomoca_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tomoca_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tomoca_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tomoca_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tomoca_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tomoca_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tomoca_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tomoca_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tomoca_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tomoca_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tomoca_db] SET RECOVERY FULL 
GO
ALTER DATABASE [Tomoca_db] SET  MULTI_USER 
GO
ALTER DATABASE [Tomoca_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tomoca_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tomoca_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tomoca_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tomoca_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tomoca_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Tomoca_db', N'ON'
GO
ALTER DATABASE [Tomoca_db] SET QUERY_STORE = OFF
GO
USE [Tomoca_db]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 6/23/2021 10:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[ActorID] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Nationality] [nvarchar](100) NULL,
	[Birth] [date] NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[ActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Directors]    Script Date: 6/23/2021 10:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directors](
	[DirectorID] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Nationality] [nchar](100) NULL,
	[Birth] [date] NULL,
 CONSTRAINT [PK_Directors] PRIMARY KEY CLUSTERED 
(
	[DirectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 6/23/2021 10:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreID] [int] NOT NULL,
	[GenreName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieActor]    Script Date: 6/23/2021 10:22:25 PM ******/
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
/****** Object:  Table [dbo].[Movies]    Script Date: 6/23/2021 10:22:25 PM ******/
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
/****** Object:  Table [dbo].[Movies]    Script Date: 6/23/2021 10:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Movies](
	[MovieID] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[ReleaseYear] [date] NULL,
	[Rating] [float] NULL,
	[Plot] [nvarchar](max) NULL,
	[MovieLength] [time](7) NULL,
	[Image] [image]
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MoviesGenres]    Script Date: 6/23/2021 10:22:25 PM ******/
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

ALTER TABLE [dbo].[MovieDirector]  WITH CHECK ADD  CONSTRAINT [FK_MovieDirector_Director] FOREIGN KEY([DirectorID])
REFERENCES [dbo].[Directors] ([DirectorID])
GO
ALTER TABLE [dbo].[MovieDirector] CHECK CONSTRAINT [FK_MovieDirector_Director]
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
USE [Tomoca_db]
GO
ALTER DATABASE [Tomoca_db] SET  READ_WRITE 
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[User](
	[FirstName] [nvarchar](25) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Country] [varchar](20) NULL,
	[City] [varchar](20) NULL,
	[Address] [varchar](20) NULL,
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

--------------------- ADD DATA -------------------------------
-------------- GENRES --------------
INSERT INTO Genres VALUES (1, 'Action');
INSERT INTO Genres VALUES (2, 'Adventure');
INSERT INTO Genres VALUES (3, 'Comedy');
INSERT INTO Genres VALUES (4, 'Crime and mystery');
INSERT INTO Genres VALUES (5, 'Fantasy');
INSERT INTO Genres VALUES (6, 'Historical');
INSERT INTO Genres VALUES (7, 'Horror');
INSERT INTO Genres VALUES (8, 'Romance');
INSERT INTO Genres VALUES (9, 'Satire');
INSERT INTO Genres VALUES (10, 'Science fiction');
INSERT INTO Genres VALUES (11, 'Speculative');
INSERT INTO Genres VALUES (12, 'Thriller');
INSERT INTO Genres VALUES (13, 'Western');
INSERT INTO Genres VALUES (14, 'Drama');
INSERT INTO Genres VALUES (15, 'War');
-------------- GENRES --------------

-------------- ACTORS --------------
INSERT INTO Actors VALUES (1, 'Robert Redford', 'American', '1936-08-18');
INSERT INTO Actors VALUES (2, 'J. C. Chandor', 'American', '1973-11-24');		-- ALL IS LOST
INSERT INTO Actors VALUES (3, 'Neal Dodson', 'United States', '1978-05-17');
--
INSERT INTO Actors VALUES (4, 'Tom Cruise', 'American', '1962-07-03');
INSERT INTO Actors VALUES (5, 'Emily Blunt', 'British', '1983-02-23');
INSERT INTO Actors VALUES (6, 'Bill Paxton', 'American', '1955-05-17');
--
INSERT INTO Actors VALUES (7, 'Will Smith', 'American', '1968-09-25');
INSERT INTO Actors VALUES (8, 'Martin Lawrence', 'American', '1965-04-16');
INSERT INTO Actors VALUES (9, 'Vanessa Hudgens', 'American', '1988-12-14');
--
INSERT INTO Actors VALUES (10, 'River Phoenix', 'American', '1970-08-23');
INSERT INTO Actors VALUES (11, 'Wil Wheaton', 'American', '1972-07-29');
INSERT INTO Actors VALUES (12, 'Corey Feldman', 'American', '1971-07-16');
--
INSERT INTO Actors VALUES (13, 'Shia LaBeouf', 'American', '1986-06-11');
INSERT INTO Actors VALUES (14, 'Zack Gottsagen', 'American', '1985-04-22');
INSERT INTO Actors VALUES (15, 'Dakota Johnson', 'American', '1989-10-04');
--
INSERT INTO Actors VALUES (16, 'Chris Hemsworth', 'American', '1983-08-11');
INSERT INTO Actors VALUES (17, 'Cynthia Erivo', 'United Kingdom', '1987-01-08');
--
INSERT INTO Actors VALUES (18, 'Rooney Mara', 'American', '1985-04-17');
INSERT INTO Actors VALUES (19, 'Daniel Craig', 'United Kingdom', '1968-03-02');
INSERT INTO Actors VALUES (20, 'Noomi Rapace', 'Sweden', '1979-12-28');

INSERT INTO Actors VALUES (21, 'Casey Affleck', 'United States', '1975-08-12');
INSERT INTO Actors VALUES (22, 'Liz Cardenas', 'United States', '1945-11-11');

INSERT INTO Actors VALUES (23, 'Ivana Baquero', 'Spain', '1994-06-11');
INSERT INTO Actors VALUES (24, 'Doug Jones', 'United States', '1960-05-24');
INSERT INTO Actors VALUES (25, 'Maribel Verd�', 'Spain', '1970-10-02');

INSERT INTO Actors VALUES (26, 'Natalie Portman', 'Jerusalem', '1981-06-09');
INSERT INTO Actors VALUES (27, 'Tom Hiddleston', 'United Kingdom', '1981-02-09');

INSERT INTO Actors VALUES (28, 'Taraji P. Henson', 'United States', '1970-09-11');
INSERT INTO Actors VALUES (29, 'Octavia Spencer', 'United States', '1970-05-25');
INSERT INTO Actors VALUES (30, 'Janelle Mon�e', 'United States', '1985-12-01');

INSERT INTO Actors VALUES (31, 'Carey Mulligan', 'United Kingdom', '1985-05-28');
INSERT INTO Actors VALUES (32, 'Meryl Streep', 'United States', '1949-06-22');
INSERT INTO Actors VALUES (33, 'Helena Bonham Carter', 'United Kingdom', '1966-05-26');

INSERT INTO Actors VALUES (34, 'Christian Bale', 'United Kingdom', '1974-01-30');
INSERT INTO Actors VALUES (35, 'Bret Easton Ellis', 'United States', '1964-03-07');
INSERT INTO Actors VALUES (36, 'Jared Leto', 'United States', '1971-12-26');

INSERT INTO Actors VALUES (37, 'Jordan Peele', 'United States', '1979-02-21');
INSERT INTO Actors VALUES (38, 'Lupita Nyong''o', 'Mexico', '1983-03-01');
INSERT INTO Actors VALUES (39, 'Winston Duke', 'Tobago', '1986-11-15');

INSERT INTO Actors VALUES (40, 'Ad�le Haenel', 'France', '1989-02-11');
INSERT INTO Actors VALUES (41, 'No�mie Merlant', 'France', '1988-11-27');
INSERT INTO Actors VALUES (42, 'Lu�na Bajrami', 'Kosovo', '2001-03-14');

INSERT INTO Actors VALUES (43, 'John Boyega', 'United Kingdom', '1992-03-17');
INSERT INTO Actors VALUES (44, 'Jodie Whittaker', 'United Kingdom', '1982-05-17');
INSERT INTO Actors VALUES (45, 'Alex Esmail', 'United Kingdom', '1993-07-18');

INSERT INTO Actors VALUES (46, 'Daniel Kaluuya', 'United Kingdom', '1989-02-24');
INSERT INTO Actors VALUES (47, 'Allison Williams', 'United States', '1988-04-13');
INSERT INTO Actors VALUES (48, 'Bradley Whitford', 'United States', '1959-10-10');

INSERT INTO Actors VALUES (49, 'Hailee Steinfeld', 'United States', '1996-12-11');
INSERT INTO Actors VALUES (50, 'Shameik Moore', 'United States', '1995-05-04');
INSERT INTO Actors VALUES (51, 'Jake Johnson', 'United States', '1978-05-28');
-------------- ACTORS --------------

-------------- DIRECTOR --------------
INSERT INTO Directors VALUES (1, 'J. C. Chandor', 'American', '1973-11-24');	-- ALL IS LOST
--
INSERT INTO Directors VALUES (2, 'Doug Liman', 'American', '1965-06-24');
--
INSERT INTO Directors VALUES (3, 'Bilall Fallah', 'Moroccan', '1986-01-04');
INSERT INTO Directors VALUES (4, 'Adil El Arbi', 'Belgian', '1988-06-30');
--
INSERT INTO Directors VALUES (5, 'Rob Reiner', 'United States', '1947-03-06');
--
INSERT INTO Directors VALUES (6, 'Tyler Nilson', 'United States', '1945-11-11');
INSERT INTO Directors VALUES (7, 'Michael Schwartz', 'American', '1942-05-09');

INSERT INTO Directors VALUES (8, 'Drew Goddard', 'United States', '1975-02-26');

INSERT INTO Directors VALUES (9, 'David Fincher', 'United States', '1962-08-28');

INSERT INTO Directors VALUES (10, 'David Lowery', 'United States', '1980-12-26');

INSERT INTO Directors VALUES (11, 'Guillermo del Toro', 'Mexico', '1964-10-09');

INSERT INTO Directors VALUES (12, 'Kenneth Branagh', 'United Kingdom', '1960-12-10');

INSERT INTO Directors VALUES (13, 'Theodore Melfi', 'United States', '1970-10-27');

INSERT INTO Directors VALUES (14, 'Sarah Gavron', 'United Kingdom', '1970-04-20');

INSERT INTO Directors VALUES (15, 'Mary Harron', 'Canada', '1953-01-12');

INSERT INTO Directors VALUES (16, 'Jordan Peele', 'United States', '1979-02-21');

INSERT INTO Directors VALUES (17, 'C�line Sciamma', 'France', '1978-11-12');

INSERT INTO Directors VALUES (18, 'Joe Cornish', 'United Kingdom', '1968-12-20');

INSERT INTO Directors VALUES (19, 'Peter Ramsey', 'United States', '1962-12-23');
INSERT INTO Directors VALUES (20, 'Rodney Rothman', 'United States', '1945-11-11');
INSERT INTO Directors VALUES (21, 'Bob Persichetti', 'American', '1973-01-17');
-------------- DIRECTOR --------------

-------------- MOVIES --------------
INSERT INTO Movies VALUES (1, 'All Is Lost' ,'2013-10-18', 6.9, 'The yacht of a man, who is on a solo voyage, collides with a shipping container. With his scanty supplies depleting, the sailor braves extreme conditions to survive.', '01:43:02');
INSERT INTO Movies VALUES (2, 'Edge of Tomorrow', '2014-05-28', 7.9, 'With the help of warrior Rita Vrataski, Major William Cage has to save Earth and the human race from an alien species, after being caught in a time loop.', '01:53:05');
INSERT INTO Movies VALUES (3, 'Bad Boys For Life', '2020-01-17', 6.6, 'Detectives Mike Lowrey and Marcus Burnett join the Miami Police Department''s special team AMMO to bring down the ruthless Armando, who is on a mission to kill Mike at his mother Isabel''s orders.', '02:04:00');
INSERT INTO Movies VALUES (4, 'Stand By Me', '1986-08-22', 8.1, 'Gordie, Chris, Teddy and Vern are four friends who decide to hike to find the corpse of Ray Brower, a local teenager, who was hit by a train while plucking blueberries in the wild.', '01:29:00');
INSERT INTO Movies VALUES (5, 'The Peanut Butter Falcon', '2019-08-08', 7.6, 'A man with down syndrome runs away from a residential nursing home to pursue his dream of becoming a wrestler. Later, he meets with an outlaw who becomes his friend and coach.', '01:37:00');
INSERT INTO Movies VALUES (6, 'Bad Times At The El Royale', '2018-10-11', 7.1, 'In 1969, seven shady strangers meet in a deserted hotel with a dark past. As time goes by, their secrets come out and they soon find themselves in a fix.', '02:20:00');
INSERT INTO Movies VALUES (7, 'The Girl with the Dragon Tattoo', '2011-12-12', 7.8, 'Mikael Blomkvist, a journalist, hires Lisbeth Salander, a computer hacker, to solve the mystery of a woman who has been missing for forty years. The two discover more than they bargained for.', '02:40:00');
INSERT INTO Movies VALUES (8, 'A Ghost Story', '2017-06-21', 6.9, 'A recently deceased man returns as a ghost to his suburban home to console his bereft wife, only to find that in his spectral state, he has become stuck in time, forced to watch passively as the life he knew and the woman he loves slowly slip away.', '01:32:00');
INSERT INTO Movies VALUES (9, 'Pan''s Labyrinth', '2006-10-11', 8.2, 'Ofelia moves with her mother to her stepfather''s house. At night, a fairy leads her to a faun who informs her that she is a princess and she needs to participate in three tasks to prove her royalty.', '01:59:00');
INSERT INTO Movies VALUES (10, 'Thor', '2011-04-29', 7.0, 'Thor is exiled by his father, Odin, the King of Asgard, to the Earth to live among mortals. When he lands on Earth, his trusted weapon Mjolnir is discovered and captured by S.H.I.E.L.D.', '01:55:00');
INSERT INTO Movies VALUES (11, 'Hidden Figures', '2017-01-06', 7.8, 'Three female African-American mathematicians play a pivotal role in astronaut John Glenn''s launch into orbit. Meanwhile, they also have to deal with racial and gender discrimination at work.', '02:07:00');
INSERT INTO Movies VALUES (12, 'Suffragette', '2015-10-12', 6.9, 'In early 20th-century Britain, the growing suffragette movement forever changes the life of working wife and mother Maud Watts (Carey Mulligan). Galvanized by political activist Emmeline Pankhurst (Meryl Streep), Watts joins a diverse group of women who fight for equality and the right to vote. Faced with increasing police action, Maud and her dedicated suffragettes must play a dangerous game of cat-and-mouse, risking their jobs, homes, family and lives for a just cause.', '01:46:00');
INSERT INTO Movies VALUES (13, 'American Psycho', '2000-04-14', 7.6, 'Patrick Bateman, a wealthy investment banker, hides his psychopathic ego from his friends. Later, his illogical fantasies escalate and he submits to an uncontrollable bloodlust.', '01:44:00');
INSERT INTO Movies VALUES (14, 'Us', '2019-03-20', 6.8, 'Adelaide Wilson and her family are attacked by mysterious figures dressed in red. Upon closer inspection, the Wilsons realise that the intruders are exact lookalikes of them.', '02:01:00');
INSERT INTO Movies VALUES (15, 'Portrait of a Lady on Fire', '2019-11-11', 8.1, 'France, 1770. Marianne, a painter, is commissioned to do the wedding portrait of H�lo�se, a young woman who has just left the convent. H�lo�se is a reluctant bride to be and Marianne must paint her without her knowing. She observes her by day, to paint her secretly.', '01:59:00');
INSERT INTO Movies VALUES (16, 'Attack the Block', '2011-05-13', 6.7, 'A group of valiant teenagers ventures out to battle a savage alien incursion. With the invasive species jeopardising their vicinity in Southern London, they fight to succeed in their mission.', '01:28:00');
INSERT INTO Movies VALUES (17, 'Get Out', '2017-02-24', 7.7, 'Chris, an African-American man, decides to visit his Caucasian girlfriend''s parents during a weekend getaway. Although they seem normal at first, he is not prepared to experience the horrors ahead.', '01:44:00');
INSERT INTO Movies VALUES (18, 'Spider-Man: Into the Spider-Verse', '2018-12-01', 8.4, 'After gaining superpowers from a spider bite, Miles Morales protects the city as Spider-Man. Soon, he meets alternate versions of himself and gets embroiled in an epic battle to save the multiverse.', '01:56:00');
-------------- MOVIES --------------

-------------- MOVIEACTOR --------------
INSERT INTO MovieActor VALUES (1, 1);
INSERT INTO MovieActor VALUES (1, 2);
INSERT INTO MovieActor VALUES (1, 3);

INSERT INTO MovieActor VALUES (2, 4);
INSERT INTO MovieActor VALUES (2, 5);
INSERT INTO MovieActor VALUES (2, 6);

INSERT INTO MovieActor VALUES (3, 7);
INSERT INTO MovieActor VALUES (3, 8);
INSERT INTO MovieActor VALUES (3, 9);

INSERT INTO MovieActor VALUES (4, 10);
INSERT INTO MovieActor VALUES (4, 11);
INSERT INTO MovieActor VALUES (4, 12);

INSERT INTO MovieActor VALUES (5, 13);
INSERT INTO MovieActor VALUES (5, 14);
INSERT INTO MovieActor VALUES (5, 15);

INSERT INTO MovieActor VALUES (6, 15);
INSERT INTO MovieActor VALUES (6, 16);
INSERT INTO MovieActor VALUES (6, 17);

INSERT INTO MovieActor VALUES (7, 18);
INSERT INTO MovieActor VALUES (7, 19);
INSERT INTO MovieActor VALUES (7, 20);

INSERT INTO MovieActor VALUES (8, 18);
INSERT INTO MovieActor VALUES (8, 21);
INSERT INTO MovieActor VALUES (8, 22);

INSERT INTO MovieActor VALUES (9, 23);
INSERT INTO MovieActor VALUES (9, 24);
INSERT INTO MovieActor VALUES (9, 25);

INSERT INTO MovieActor VALUES (10, 16);
INSERT INTO MovieActor VALUES (10, 26);
INSERT INTO MovieActor VALUES (10, 27);

INSERT INTO MovieActor VALUES (11, 28);
INSERT INTO MovieActor VALUES (11, 29);
INSERT INTO MovieActor VALUES (11, 30);

INSERT INTO MovieActor VALUES (12, 31);
INSERT INTO MovieActor VALUES (12, 32);
INSERT INTO MovieActor VALUES (12, 33);

INSERT INTO MovieActor VALUES (13, 34);
INSERT INTO MovieActor VALUES (13, 35);
INSERT INTO MovieActor VALUES (13, 36);

INSERT INTO MovieActor VALUES (14, 37);
INSERT INTO MovieActor VALUES (14, 38);
INSERT INTO MovieActor VALUES (14, 39);

INSERT INTO MovieActor VALUES (15, 40);
INSERT INTO MovieActor VALUES (15, 41);
INSERT INTO MovieActor VALUES (15, 42);

INSERT INTO MovieActor VALUES (16, 43);
INSERT INTO MovieActor VALUES (16, 44);
INSERT INTO MovieActor VALUES (16, 45);

INSERT INTO MovieActor VALUES (17, 46);
INSERT INTO MovieActor VALUES (17, 47);
INSERT INTO MovieActor VALUES (17, 48);

INSERT INTO MovieActor VALUES (18, 49);
INSERT INTO MovieActor VALUES (18, 50);
INSERT INTO MovieActor VALUES (18, 51);
-------------- MOVIEACTOR --------------

-------------- MOVIEDIRECTOR --------------
INSERT INTO MovieDirector VALUES (1, 1);

INSERT INTO MovieDirector VALUES (2, 2);

INSERT INTO MovieDirector VALUES (3, 3);
INSERT INTO MovieDirector VALUES (3, 4);

INSERT INTO MovieDirector VALUES (4, 5);

INSERT INTO MovieDirector VALUES (5, 6);
INSERT INTO MovieDirector VALUES (5, 7);

INSERT INTO MovieDirector VALUES (6, 8);

INSERT INTO MovieDirector VALUES (7, 9);

INSERT INTO MovieDirector VALUES (8, 10);

INSERT INTO MovieDirector VALUES (9, 11);
INSERT INTO MovieDirector VALUES (10, 12);

INSERT INTO MovieDirector VALUES (11, 13);

INSERT INTO MovieDirector VALUES (12, 14);

INSERT INTO MovieDirector VALUES (13, 15);

INSERT INTO MovieDirector VALUES (14, 16);

INSERT INTO MovieDirector VALUES (15, 17);

INSERT INTO MovieDirector VALUES (16, 18);

INSERT INTO MovieDirector VALUES (17, 16);

INSERT INTO MovieDirector VALUES (18, 19);
INSERT INTO MovieDirector VALUES (18, 20);
INSERT INTO MovieDirector VALUES (18, 21);
-------------- MOVIEDIRECTOR --------------

-------------- MOVIEGENRES --------------
INSERT INTO MoviesGenres VALUES (1, 1);

INSERT INTO MoviesGenres VALUES (2, 1);
INSERT INTO MoviesGenres VALUES (2, 10);

INSERT INTO MoviesGenres VALUES (3, 1);
INSERT INTO MoviesGenres VALUES (3, 3);

INSERT INTO MoviesGenres VALUES (4, 2);
INSERT INTO MoviesGenres VALUES (4, 14);

INSERT INTO MoviesGenres VALUES (5, 2);
INSERT INTO MoviesGenres VALUES (5, 3);

INSERT INTO MoviesGenres VALUES (6, 4);
INSERT INTO MoviesGenres VALUES (6, 12);

INSERT INTO MoviesGenres VALUES (7, 4);
INSERT INTO MoviesGenres VALUES (7, 12);

INSERT INTO MoviesGenres VALUES (8, 14);
INSERT INTO MoviesGenres VALUES (8, 8);

INSERT INTO MoviesGenres VALUES (9, 5);
INSERT INTO MoviesGenres VALUES (9, 15);

INSERT INTO MoviesGenres VALUES (10, 1);
INSERT INTO MoviesGenres VALUES (10, 5);

INSERT INTO MoviesGenres VALUES (11, 6);
INSERT INTO MoviesGenres VALUES (11, 14);

INSERT INTO MoviesGenres VALUES (12, 6);
INSERT INTO MoviesGenres VALUES (12, 14);

INSERT INTO MoviesGenres VALUES (13, 4);
INSERT INTO MoviesGenres VALUES (13, 7);

INSERT INTO MoviesGenres VALUES (14, 7);
INSERT INTO MoviesGenres VALUES (14, 12);

INSERT INTO MoviesGenres VALUES (15, 8);
INSERT INTO MoviesGenres VALUES (15, 14);

INSERT INTO MoviesGenres VALUES (16, 1);
INSERT INTO MoviesGenres VALUES (16, 9);
INSERT INTO MoviesGenres VALUES (16, 10);

INSERT INTO MoviesGenres VALUES (17,7);
INSERT INTO MoviesGenres VALUES (17,9);
INSERT INTO MoviesGenres VALUES (17,12);

INSERT INTO MoviesGenres VALUES (18, 1);
INSERT INTO MoviesGenres VALUES (18, 11);
-------------- MOVIEGENRES --------------
