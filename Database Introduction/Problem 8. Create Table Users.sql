CREATE TABLE [Users] (
	[Id] BIGINT PRIMARY KEY IDENTITY,
	[Username] VARCHAR(30) NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	[ProfilePicture] VARBINARY(max),
	CHECK (DATALENGTH([ProfilePicture]) <= 900000),
	[LastLoginTime] DATE NOT NULL,
	[IsDeleted] bit NOT NULL,
	)

	
	INSERT INTO [Users] ([Username], [Password], [ProfilePicture], [LastLoginTime], [IsDeleted])
		VALUES
		('B0R1S', 'Boris123456', NULL, '2022.05.20', 0),
		('1van4oo', '12344321', NULL, '2022.05.20', 0),
		('Proto', 'pro123pro', NUll, '2014.03.05', 1),
		('Plamen', 'Plamen123', NUll, '2022.05.20', 0),
		('Kaloyan', '123456789', NULL, '2020.01.24', 1)

		
