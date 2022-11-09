--------------------------ДОМАШКА----------------------------

----------------------ЗАДАНИЕ №1-----------------------------
--Вывести всю информацию из таблицы Sales.Customer 
-------------------------------------------------------------
SELECT * FROM Sales.Customer
GO

----------------------ЗАДАНИЕ №2-----------------------------
--Вывести всю информацию из таблицы Sales.Store отсортированную 
--по Name в алфавитном порядке
-------------------------------------------------------------
SELECT * FROM Sales.Store AS s ORDER BY s.Name
GO

----------------------ЗАДАНИЕ №3-----------------------------
--Вывести из таблицы HumanResources.Employee всю информацию
--о десяти сотрудниках, которые родились позже 1989-09-28
-------------------------------------------------------------
SELECT TOP 10 * FROM HumanResources.Employee AS e
WHERE e.BirthDate > '1989-09-28'
GO

----------------------ЗАДАНИЕ №4-----------------------------
--Вывести из таблицы HumanResources.Employee сотрудников
--у которых последний символ LoginID является 0.
--Вывести только NationalIDNumber, LoginID, JobTitle.
--Данные должны быть отсортированы по JobTitle по убиванию
-------------------------------------------------------------
SELECT e.NationalIDNumber, e.LoginID, e.JobTitle FROM HumanResources.Employee AS e
WHERE e.LoginID LIKE '%0'
ORDER BY e.JobTitle DESC
GO

----------------------ЗАДАНИЕ №5-----------------------------
--Вывести из таблицы Person.Person всю информацию о записях, которые были 
--обновлены в 2008 году (ModifiedDate) и MiddleName содержит
--значение и Title не содержит значение 
-------------------------------------------------------------
SELECT * FROM Person.Person AS p
WHERE DATENAME(YEAR, p.ModifiedDate) = '2008' AND p.MiddleName IS NOT NULL AND p.Title IS NULL
GO

----------------------ЗАДАНИЕ №6-----------------------------
--Вывести название отдела (HumanResources.Department.Name) БЕЗ повторений
--в которых есть сотрудники
--Использовать таблицы HumanResources.EmployeeDepartmentHistory и HumanResources.Department
-------------------------------------------------------------
SELECT DISTINCT d.Name FROM HumanResources.Department AS d
JOIN HumanResources.EmployeeDepartmentHistory AS edh ON d.DepartmentID = edh.DepartmentID
GO
----------------------ЗАДАНИЕ №7-----------------------------
--Сгрупировать данные из таблицы Sales.SalesPerson по TerritoryID
--и вывести сумму CommissionPct, если она больше 0
-------------------------------------------------------------
SELECT s.TerritoryID, SUM(s.CommissionPct) FROM Sales.SalesPerson AS s
WHERE s.CommissionPct > 0
GROUP BY s.TerritoryID
GO

----------------------ЗАДАНИЕ №8-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют самое большое кол-во 
--отпуска (HumanResources.Employee.VacationHours)
-------------------------------------------------------------
SELECT * FROM HumanResources.Employee AS e
WHERE e.VacationHours IN 
(SELECT MAX(e2.VacationHours) FROM HumanResources.Employee AS e2)
GO

----------------------ЗАДАНИЕ №9-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют позицию (HumanResources.Employee.JobTitle)
--'Sales Representative' или 'Network Administrator' или 'Network Manager'
-------------------------------------------------------------
SELECT * FROM HumanResources.Employee AS e
WHERE e.JobTitle IN ('Sales Representative', 'Network Administrator', 'Network Manager')
GO

----------------------ЗАДАНИЕ №10-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) и 
--их заказах (Purchasing.PurchaseOrderHeader). ЕСЛИ У СОТРУДНИКА НЕТ
--ЗАКАЗОВ ОН ДОЛЖЕН БЫТЬ ВЫВЕДЕН ТОЖЕ!!!
-------------------------------------------------------------
SELECT e.*, poh.* FROM HumanResources.Employee AS e
LEFT JOIN Purchasing.PurchaseOrderHeader AS poh ON e.BusinessEntityID=poh.EmployeeID
GO

