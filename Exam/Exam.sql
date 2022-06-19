CREATE DATABASE Zoo

GO

 USE ZOO

 GO

 -- TASK 1
 CREATE TABLE Owners(
 Id INT PRIMARY KEY IDENTITY,
 [Name] VARCHAR(50) NOT NULL,
 PhoneNumber VARCHAR(15) NOT NULL,
 [Address] VARCHAR(50) 
 )

 GO

 CREATE TABLE AnimalTypes (
  Id INT PRIMARY KEY IDENTITY,
  AnimalType VARCHAR(30) NOT NULL
 )

 GO

 CREATE TABLE Cages (
 Id INT PRIMARY KEY IDENTITY,
 AnimalTypeId INT FOREIGN KEY REFERENCES AnimalTypes(Id) NOT NULL
 )

 GO

 CREATE TABLE Animals (
 Id INT PRIMARY KEY IDENTITY,
 [Name] VARCHAR(30) NOT NULL,
 BirthDate DATE NOT NULL,
 OwnerId INT FOREIGN KEY REFERENCES Owners(Id),
 AnimalTypeId INT FOREIGN KEY REFERENCES AnimalTypes(Id) NOT NULL
 )

 GO

 CREATE TABLE AnimalsCages (
 CageId INT FOREIGN KEY REFERENCES Cages(Id) NOT NULL,
 AnimalId INT FOREIGN KEY REFERENCES Animals(Id) NOT NULL,
 PRIMARY KEY(CageId, AnimalId)
 )

 GO

 CREATE TABLE VolunteersDepartments (
 Id INT PRIMARY KEY IDENTITY,
 DepartmentName VARCHAR(30) NOT NULL
 )

 GO

 CREATE TABLE Volunteers (
  Id INT PRIMARY KEY IDENTITY,
  [Name] VARCHAR(50) NOT NULL,
  PhoneNumber VARCHAR(15) NOT NULL,
  [Address] VARCHAR(50),
  AnimalId INT FOREIGN KEY REFERENCES Animals(Id),
  DepartmentId INT FOREIGN KEY REFERENCES VolunteersDepartments(Id) NOT NULL
 )

 GO

 -- TASK 2
 INSERT INTO Volunteers ([Name], PhoneNumber, [Address], AnimalId, DepartmentId)
 VALUES
 ('Anita Kostova', '0896365412', 'Sofia, 5 Rosa str.', 15, 1),
 ('Dimitur Stoev', '0877564223', NULL, 42, 4),
 ('Kalina Evtimova', '0896321112', 'Silistra, 21 Breza str.', 9, 7),
 ('Stoyan Tomov', '0898564100', 'Montana, 1 Bor str.', 18, 8),
 ('Boryana Mileva', '0888112233', NULL, 31,5)

 GO

 INSERT INTO Animals ([Name], BirthDate, OwnerId, AnimalTypeId)
 VALUES
 ('Giraffe', '2018-09-21', 21, 1),
 ('Harpy Eagle', '2015-04-17', 15, 3),
 ('Hamadryas Baboon', '2017-11-02', NULL, 1),
 ('Tuatara', '2021-06-30', 2, 4)

 GO

 -- TASK 3
 UPDATE Animals
 SET OwnerId = 4
 WHERE OwnerId IS NULL

-- TASK 4

DELETE FROM
Volunteers
WHERE DepartmentId = (
		SELECT 
		Id 
		FROM VolunteersDepartments AS vm
		WHERE vm.DepartmentName = 'Education program assistant')


DELETE FROM VolunteersDepartments
WHERE DepartmentName = 'Education program assistant'

--TASK 5
SELECT
[Name],
PhoneNumber,
[Address],
AnimalId,
DepartmentId
FROM Volunteers
ORDER BY [Name] ASC, AnimalId ASC, DepartmentId ASC

-- TASK 6
SELECT 
a.[Name],
[at].AnimalType,
FORMAT(a.BirthDate, 'dd.MM.yyyy') AS BirthDate
FROM Animals AS a
JOIN AnimalTypes AS [at] ON [at].Id = a.AnimalTypeId
ORDER BY a.[Name] ASC

--TASK 7
SELECT TOP (5)
o.[Name],
COUNT(a.Id) AS CountOfAnimals 
FROM Owners AS o
JOIN Animals AS a ON a.OwnerId = o.Id
GROUP BY o.[Name]
ORDER BY CountOfAnimals DESC, o.[Name]


-- TASK 8
SELECT
CONCAT(o.[Name], '-', a.[Name]) AS OwnersAnimals,
o.PhoneNumber,
ac.CageId
FROM Owners AS o
JOIN Animals AS a ON a.OwnerId = o.Id
JOIN AnimalsCages AS ac ON ac.AnimalId = a.Id
WHERE a.AnimalTypeId = 1
ORDER BY o.[Name] ASC, a.[Name] DESC

-- TASK 9
SELECT 
v.[Name],
v.PhoneNumber,
SUBSTRING(v.[Address], CHARINDEX(',', v.[Address]) + 2, LEN(v.[Address]) - 5) AS [Address]
FROM Volunteers AS v
JOIN VolunteersDepartments AS vd ON vd.Id = v.DepartmentId
WHERE vd.DepartmentName = 'Education program assistant' 
AND CHARINDEX('Sofia', v.[Address]) <> 0
ORDER BY v.[Name] ASC

-- TASK 10
SELECT 
A.[Name],
DATEPART(YEAR, A.BirthDate) AS BirthYear,
[at].AnimalType
FROM Animals AS a
JOIN AnimalTypes AS [at] ON [at].Id = A.AnimalTypeId
WHERE OwnerId IS NULL 
AND ABS(DATEDIFF(YEAR, '01/01/2022', a.BirthDate)) < 5
AND a.AnimalTypeId <> 3
ORDER BY a.[Name] ASC

-- TASK 11
CREATE FUNCTION udf_GetVolunteersCountFromADepartment 
(@department VARCHAR(30))
RETURNS INT
AS
BEGIN
	RETURN
	(SELECT 
	COUNT(*) 
	FROM VolunteersDepartments AS vd
	JOIN Volunteers AS v ON v.DepartmentId = vd.Id
	WHERE vd.DepartmentName = @department
	GROUP BY vd.DepartmentName)
END

-- TASK 12
CREATE PROC usp_AnimalsWithOwnersOrNot(@AnimalName VARCHAR(30))
AS
	SELECT
a.[Name],
CASE 
	WHEN o.[Name] IS NULL
	THEN 'For adoption'
	WHEN o.[Name] IS NOT NULL
	THEN o.[Name]
	END AS OwnersName
FROM Animals AS a
LEFT JOIN Owners AS o ON o.Id = a.OwnerId
WHERE a.[Name] = @AnimalName
