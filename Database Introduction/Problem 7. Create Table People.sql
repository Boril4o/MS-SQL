CREATE TABLE [People] (
	[Id] INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(200) NOT NULL,
	[Picture] VARBINARY(MAX),
	CHECK (DATALENGTH([Picture]) <= 2000000),
	[Height] DECIMAL(3,2),
	[Weight] DECIMAL(5,2),
	[Gender] CHAR(1) NOT NULL,
	CHECK ([Gender] = 'm' OR [Gender] = 'f'),
	[Birthdate] DATE NOT NULL,
	[Biography] NVARCHAR(MAX),
	)

	INSERT INTO [People] ([Name], [Height], [Weight], [Gender], [Birthdate], [Biography])
		VALUES
		('Boris', 1.86, 66.6, 'm', '2006.01.24', 'Junior Programmer'),
		('Ivan', 1.90, 66.6, 'm', '2006.03.10', NULL),
		('Yavor', 1.76, 66.6, 'm', '2007.05.15', NULL),
		('Kaloyan', 1.50, 50, 'm', '2008.06.15', NULL),
		('Delcho', 1.67, 80, 'm', '2006.12.04', 'BodyBuilder')

		SELECT * FROM [People]
		