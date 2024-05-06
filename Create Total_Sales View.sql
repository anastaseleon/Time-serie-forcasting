drop view if exists [Total_Sales]
go
CREATE VIEW [dbo].[Total_Sales] AS

SELECT
abc.ProductID,
   b.OrderDate, 
    SUM(a.OrderQty) AS Quantity,
	abc.Category,
	b.TerritoryID,
	pc.name
	
FROM 
    sales.SalesOrderDetail a 
    LEFT JOIN ABC_analysis ABC on a.ProductID= abc.ProductID
	left join sales.SalesOrderHeader b ON a.SalesOrderID = b.SalesOrderID
	left join Production.Product pp on pp.ProductID= abc.productID
	left join  [Production].[ProductSubcategory] ps on pp.productsubcategoryid=ps.productsubcategoryid
	left join [Production].[ProductCategory] pc on ps.productcategoryid=pc.productcategoryid
	where b.territoryID=6
GROUP BY 
    b.OrderDate,abc.Category, abc.ProductID, abc.SalesAmount,  b.TerritoryID, pc.name
GO
