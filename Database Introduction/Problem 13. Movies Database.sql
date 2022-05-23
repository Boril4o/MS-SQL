CREATE DATABASE [Movies]

CREATE TABLE [Directors](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[DirectorName] VARCHAR(20) NOT NULL,
	[Notes] VARCHAR(1000)
)

INSERT INTO [Directors] ([DirectorName], [Notes])
	VALUES
    ('dname1', 'asdfadsfdasfdasfdas'),
    ('dname2', 'asdfadsfdasfdasfdas'),
    ('dname3', 'asdfadsfdasfdasfdas'),
    ('dname4', 'asdfadsfdasfdasfdas'),
    ('dname5', 'asdfadsfdasfdasfdas')

CREATE TABLE [Genres](
	[Id] INT PRIMARY KEY IDENTITY,
	[GenreName] VARCHAR(20) NOT NULL,
	[Notes] VARCHAR(1000)
)

INSERT INTO [Genres] ([GenreName], [Notes])
VALUES
    ('genre1', 'asdfadsfdasfdasfdas'),
    ('genre2', 'asdfadsfdasfdasfdas'),
    ('genre3', 'asdfadsfdasfdasfdas'),
    ('genre4', 'asdfadsfdasfdasfdas'),
    ('genre5', 'asdfadsfdasfdasfdas')

CREATE TABLE [Categories](
	[Id] INT PRIMARY KEY IDENTITY,
	[CategoryName] VARCHAR(20) NOT NULL,
	[Notes] VARCHAR(1000)
)

INSERT INTO [Categories] ([CategoryName], [Notes])
VALUES
    ('category1', 'asdfadsfdasfdasfdas'),
    ('category2', 'asdfadsfdasfdasfdas'),
    ('category3', 'asdfadsfdasfdasfdas'),
    ('category4', 'asdfadsfdasfdasfdas'),
    ('category5', 'asdfadsfdasfdasfdas')

	CREATE TABLE [Movies] (
		[Id] INT PRIMARY KEY IDENTITY NOT NULL,
		[Title] VARCHAR(1000) NOT NULL,
		[DirectorId] INT UNIQUE NOT NULL,
		[CopyrightYear] DATE NOT NULL,
		[Length] TIME NOT NULL,
		[GenreId] INT UNIQUE NOT NULL,
		[CategoryId] INT UNIQUE NOT NULL,
		[Rating] TINYINT NOT NULL CHECK ([Rating] BETWEEN 0 AND 10),
		[Note] NVARCHAR(1000)
	)

	INSERT INTO [Movies] ([Title], [DirectorId], [CopyrightYear], [Length], [GenreId], [CategoryId], [Rating], [Note])
		VALUES
		('Mname1', 12132, '1994-01-01', '02:22:21', 14314, 13412, 5, 'dsssw'),
		('Mname2',12232, '1995-01-01', '02:22:21', 43214, 23412, 5, 'dsssw'),
		('Mname3',12332, '1996-01-01', '02:22:21', 13214, 21412, 5, 'dsssw'),
		('Mname4',12432, '1997-01-01', '02:22:21', 14321, 21312, 5, 'dsssw'),
		('Mname5',12532, '1993-01-01', '02:22:21', 1434, 21342, 5, 'dsssw')

		
