SELECT
e.EmployeeID,
e.FirstName,
e.ManagerID,
e1.FirstName AS ManagerName
FROM Employees AS e
JOIN Employees AS e1 ON e.ManagerID = e1.EmployeeID
WHERE e.ManagerID = 3 OR e.ManagerID = 7
ORDER BY e.EmployeeID ASC
