---Data
select SalesOrderID , OrderDate,DueDate,ShipDate,AccountNumber,CustomerID,SalesPersonID,ShipMethodID,ShipDate,TerritoryID,SubTotal,TaxAmt,Freight
,TotalDue
from Sales.SalesOrderHeader
----Nulls
select SalesOrderID , OrderDate,DueDate,ShipDate,AccountNumber,CustomerID,SalesPersonID,ShipMethodID,ShipDate,TerritoryID,SubTotal,TaxAmt,Freight
,TotalDue
from Sales.SalesOrderHeader
where SalesPersonID is null
--
SELECT
     COUNT(SalesPersonID) AS count_column
    ,COUNT(*) AS count_all
FROM Sales.SalesOrderHeader
---
SELECT COUNT(*)
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NULL
---------duplicate 
SELECT SalesOrderID,COUNT(*)
FROM Sales.SalesOrderHeader
GROUP BY SalesOrderID
HAVING COUNT(*) > 1
----------------Detitl
select P.FirstName, P.LastName,P.PhoneNumber ,T.Name,T.CountryRegionCode,ST.Name,sh.Name , O.ShipDate,O.OrderDate
,cd.CardType,od.UnitPrice, od.UnitPriceDiscount, od.LineTotal
from Sales.SalesOrderHeader O
join Sales.SalesPerson s on O.SalesPersonID= s.BusinessEntityID
join Sales.Customer c on c.CustomerID = O.CustomerID
join Sales.CustomerPII P on P.CustomerID = c.CustomerID
join Sales.SalesTerritory T on T.TerritoryID = O.TerritoryID
join Sales.Store ST on ST.BusinessEntityID = c.StoreID
join Purchasing.ShipMethod sh on sh.ShipMethodID = O.ShipMethodID
join Sales.CreditCard cd on cd.CreditCardID = O.CreditCardID
join Sales.SalesOrderDetail od on od.SalesOrderID = O.SalesOrderID
-------------------salesPerson 
select p.FirstName, p.LastName,sp.SalesQuota,st.Name , st.SalesLastYear ,st.SalesYTD , sp.CommissionPct 
from Sales.SalesPerson sp
join Sales.SalesTerritory st on st.TerritoryID = sp.TerritoryID
 join Person.Person p on p.BusinessEntityID=sp.BusinessEntityID
------------------nulls
	SELECT COUNT(*)
FROM Person.Person
WHERE LastName IS NULL
---------------Dublicate
 SELECT LastName,COUNT(*)
FROM Person.Person
GROUP BY LastName
HAVING COUNT(*) > 1
-----------------StorbySalesPerson
select stor.Name , p.FirstName ,p.LastName ,sp.SalesLastYear
from Sales.Store stor
join Sales.SalesPerson sp on stor.SalesPersonID = sp.BusinessEntityID
join Person.Person  p on p.BusinessEntityID = sp.BusinessEntityID
-----person
select * from Person.Person

---Dublicate
SELECT SalesPersonID,COUNT(*)
FROM Sales.Store
GROUP BY SalesPersonID
HAVING COUNT(*) > 1

----------------SalesTerritory
select Name,CountryRegionCode , SalesLastYear ,SalesYTD 
from Sales.SalesTerritory
---null
select *
from Sales.SalesTerritory
where Name is null
----countNull
	SELECT COUNT(*)
FROM Sales.SalesTerritory
WHERE Name IS NULL
-------Dupliect
SELECT TerritoryID,COUNT(*)
FROM Sales.SalesTerritory
GROUP BY TerritoryID
HAVING COUNT(*) > 1

 select * from Sales.SalesTaxRate
 
