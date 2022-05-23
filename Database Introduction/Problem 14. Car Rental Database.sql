CREATE DATABASE [CarRental]

CREATE TABLE [Categories] (
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[CategoryName] NVARCHAR(30) NOT NULL,
	[DailyRate] DECIMAL NOT NULL,
	[WeeklyRate] DECIMAL NOT NULL,
	[MonthlyRate] DECIMAL NOT NULL,
	[WeekendRate] DECIMAL NOT NULL,
)

INSERT INTO [Categories] ([CategoryName], [DailyRate], [WeeklyRate], [MonthlyRate], [WeekendRate])
	VALUES
	('Cname1', 0, 0, 0, 0),
	('Cname2', 0, 0, 0, 0),
	('Cname3', 0, 0, 0, 0)

CREATE TABLE [Cars] (
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[PlateNumber] VARCHAR(15) NOT NULL,
	[Manufacturer] VARCHAR(30) NOT NULL,
	[Model] VARCHAR(15) NOT NULL,
	[CarYear] DATE NOT NULL,
	[CategoryId] INT UNIQUE NOT NULL,
	[Doors] TINYINT NOT NULL,
	[Picture] VARBINARY(MAX) CHECK (DATALENGTH([Picture]) <= 10000000),
	[Condition] NVARCHAR(20) NOT NULL,
	[Available] BIT NOT NULL
)

INSERT INTO [Cars] VALUES
    ('category1','bg 0011 X', 'mustang', '1994-01-01', 124, 2, 12342, 'new', 1),
    ('category2','bg 011 X', 'mustang', '1994-01-01', 234, 3, 1242, 'old', 0),
    ('category3','bg 001 X', 'mustang', '1994-01-01', 134, 4, 1242, 'used', 0)

CREATE TABLE [Employees] (
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[FirstName] NVARCHAR(20) NOT NULL,
	[LastName] NVARCHAR(20) NOT NULL,
	[Title] NVARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(1000) NOT NULL
)

INSERT INTO [Employees] VALUES
    ('kris', 'mustang', 'storage worker', 'afaf'),
    ('ivan', 'porsche', 'production', 'afaf'),
    ('mitko', 'shelby', 'cashier', 'fafaf')

CREATE TABLE [Customers] (
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[DriverLicenceNumber] NVARCHAR(15) UNIQUE NOT NULL,
	[FullName] NVARCHAR(80) NOT NULL,
	[Address] NVARCHAR(50) NOT NULL,
	[City] NVARCHAR(60) NOT NULL,
	[ZIPCode] INT NOT NULL,
	[Notes] NVARCHAR(1000) NOT NULL
)

INSERT INTO [Customers] VALUES
    ('bg 0011 X', 'kris', 'address1', 'Rousse', 4, 'asdfas'),
    ('bg 011 X', 'ivan', 'address2', 'VARNA', 2, 'sfasda'),
    ('bg 001 X', 'mitko', 'address3', 'SODIEA', 3, 'dsgfd')

CREATE TABLE [RentalOrders](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[EmployeeId] INT UNIQUE NOT NULL,
	[CustomerId] INT UNIQUE NOT NULL,
	[CarId] INT UNIQUE NOT NULL,
	[TankLevel] DECIMAL NOT NULL,
	[KilometrageStart] DECIMAL NOT NULL,
	[KilometrageEnd] DECIMAL NOT NULL,
	[TotalKilometrage] DECIMAL NOT NULL,
	[StartDate] DATETIME2 NOT NULL,
	[EndDate] DATETIME2 NOT NULL,
	[TotalDays] INT NOT NULL,
	[RateApplied] DECIMAL NOT NULL,
	[TaxRate] DECIMAL NOT NULL,
	[OrderStatus] BIT NOT NULL,
	[Notes] NVARCHAR(1000) NOT NULL	
)

INSERT INTO [RentalOrders] VALUES
    (1234, 2342, 4564,3.80, 3.80,3.80,3.80, '1994-01-01', '1994-01-01', 12, 1.20, 23.4, 1, 'adada'),
    (234, 23, 16454,3.80, 3.80,3.80,3.80, '1994-01-01', '1994-01-01', 13, 2.10, 34.2, 0, 'dadada'),
    (456, 2332, 64353, 3.80,3.80,3.80,3.80,'1994-01-01', '1994-01-01', 14, 4.20, 12.3, 1, 'adadad')

	SELECT * FROM [Cars]
	SELECT * FROM [Categories]
	SELECT * FROM [Customers]
	SELECT * FROM [Employees]
	SELECT * FROM [RentalOrders]