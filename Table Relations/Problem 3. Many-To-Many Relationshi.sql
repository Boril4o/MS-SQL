CREATE TABLE [Students] (
[StudentID] INT PRIMARY KEY IDENTITY NOT NULL,
[Name] NVARCHAR(40) NOT NULL,
)

CREATE TABLE [Exams] (
[ExamID] INT PRIMARY KEY IDENTITY(101, 1) NOT NULL,
[Name] NVARCHAR(20) NOT NULL,
)

CREATE TABLE [StudentsExams] (
[StudentID] INT
CONSTRAINT FK_StudentID FOREIGN KEY ([StudentID])
REFERENCES [Students]([StudentID]) NOT NULL,
[ExamID] INT
CONSTRAINT FK_ExamID FOREIGN KEY ([ExamID])
REFERENCES [Exams]([ExamID]) NOT NULL,
PRIMARY KEY([StudentID], [ExamID])
)

INSERT INTO [Students] VALUES 
('Mila'),
('Toni'),
('Ron')

INSERT INTO [Exams] VALUES 
('SpringMVC'),
('Neo4j'),
('Oracle 11g')

INSERT INTO [StudentsExams] VALUES
(1, 101),
(1, 102),
(2, 101),
(3, 103),
(2, 102),
(2, 103)