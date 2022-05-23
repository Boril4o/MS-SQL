CREATE DATABASE [Hotel]

CREATE TABLE [Employees] (
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[FirstName] NVARCHAR(40) NOT NULL,
	[LastName] NVARCHAR(40) NOT NULL,
	[Title] NVARCHAR(20) NOT NULL,
	[Notes] NVARCHAR(1000) NOT NULL 
)

INSERT INTO [Employees] VALUES
	('FN1', 'LN1', 'T1', 'N1'),
	('FN2', 'LN2', 'T2', 'N2'),
	('FN3', 'LN3', 'T3', 'N3')

	CREATE TABLE [Customers] (
		[AccountNumber] INT PRIMARY KEY IDENTITY NOT NULL,
		[FirstName] NVARCHAR(40) NOT NULL,
		[LastName] NVARCHAR(40) NOT NULL,
		[PhoneNumber] NVARCHAR(20) NOT NULL,
		[EmergencyName] NVARCHAR(30) NOT NULL,
		[EmergencyNumber] INT NOT NULL,
		[Notes] NVARCHAR(1000) NOT NULL
	)

	INSERT INTO [Customers] VALUES
		('Name1', 'lastname1', '000000000', 'EmergencyName1', 123, 'Note1'),
		('Name2', 'lastname2', '000000000', 'EmergencyName2', 123, 'Note2'),
		('Name3', 'lastname3', '000000000', 'EmergencyName3', 123, 'Note3')


CREATE TABLE [RoomStatus] (
	 [RoomStatus] VARCHAR(50) PRIMARY KEY NOT NULL,
	  [Notes] NVARCHAR(50)
)

INSERT INTO [RoomStatus] VALUES
	('Free', NULL),
	('not free', NULL),
	('Freex3', NULL)

CREATE TABLE [RoomTypes] (
	[RoomType] NVARCHAR(20) PRIMARY KEY NOT NULL,
	[Notes] NVARCHAR(50)
	)

INSERT INTO [RoomTypes] VALUES
    ('FREE', NULL),
    ('NOT FREE', NULL),
    ('FREEX3', NULL)

CREATE TABLE [BedTypes] (
		[BedType] INT PRIMARY KEY NOT NULL,
		[Notes] NVARCHAR(50)
	)

INSERT INTO [BedTypes] VALUES 
		('1', NULL),
		('2', NULL),
		('3', NULL)

CREATE TABLE [Rooms] (
	[RoomNumber] INT PRIMARY KEY NOT NULL,
	[RoomType] NVARCHAR(30) NOT NULL,
	[BedType] NVARCHAR(30) NOT NULL,
	[Rate] DECIMAL NOT NULL,
	[RoomStatus] NVARCHAR(30) NOT NULL,
	[Notes] NVARCHAR(30)
)

INSERT INTO [Rooms] VALUES
	(01, 'Type1', 'BedType1', 9.8, 'Very Good', NULL),
	(02, 'Type2', 'BedType2', 7.9, 'Good', NULL),
	(03, 'Type3', 'BedType3', 4.5, 'Bad', NULL)

CREATE TABLE [Payments] (
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[EmployeeId] INT UNIQUE NOT NULL,
	[PaymentDate] DATE NOT NULL,
	[AccountNumber] INT UNIQUE NOT NULL,
	[FirstDateOccupied] DATE NOT NULL,
	[LastDateOccupied] DATE NOT NULL,
	[TotalDays] TINYINT NOT NULL,
	[AmountCharged] DECIMAL NOT NULL,
	[TaxRate] DECIMAL NOT NULL,
	[TaxAmount] DECIMAL NOT NULL,
	[PaymentTotal] DECIMAL NOT NULL,
	[Notes] NVARCHAR(50)
)

INSERT INTO [Payments] VALUES
    (123213, '2002-02-21', 1212, '2002-02-20', '2021-03-12', 10, 3.19, 3.18, 3.18, 44.50, NULL),
    (1223213, '2002-02-21', 1232, '2002-02-20', '2021-03-12', 10, 3.19, 3.18, 3.18, 44.50, NULL),
    (23213, '2002-02-21', 1231, '2002-02-20', '2021-03-12', 10, 3.19, 3.18, 3.18, 44.50, NULL)

CREATE TABLE [Occupancies] (
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[EmployeeId] INT UNIQUE NOT NULL,
	[DateOccupied] DATE NOT NULL,
	[AccountNumber] INT UNIQUE NOT NULL,
	[RoomNumber] INT UNIQUE NOT NULL,
	[RateApplied] DECIMAL NOT NULL,
	[PhoneCharge] DECIMAL NOT NULL,
	[Notes] NVARCHAR(1000)
)

INSERT INTO [Occupancies] VALUES
    (123123, '2000-02-21', 222-333-222, 1, 3.18, 22.22, NULL),
    (12313, '2000-02-21', 222-323-22, 2, 3.18, 22.22, NULL),
    (13123, '2000-02-21', 222-3133-2222, 3, 3.18, 22.22, NULL)



