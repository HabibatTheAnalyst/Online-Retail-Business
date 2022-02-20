/****** Script for SelectTopNRows command from SSMS  ******/
USE DATraining
GO

SELECT *
  FROM RAW_OnlineRetailAnalysis_20220211



SELECT 
		CustomerID,
		Country,
		ROUND(Quantity * UnitPrice, 1) AS TotalPrice
FROM RAW_OnlineRetailAnalysis_20220211
ORDER BY TotalPrice DESC;



--- Countries with highest total price
SELECT
		DISTINCT(CustomerID),
		Country,
		ROUND(Quantity * UnitPrice, 1) AS TotalPrice
FROM RAW_OnlineRetailAnalysis_20220211
ORDER BY TotalPrice DESC;


--- Contries and Customers with highest repeating orders
SELECT 
		COUNT(CustomerID) AS RepeatOrder,
		ROUND(SUM(UnitPrice), 0) AS TotalPrice,
		CustomerID,
		InvoiceDate,
		Country
FROM RAW_OnlineRetailAnalysis_20220211
GROUP BY CustomerID, UnitPrice, InvoiceDate, Country
ORDER BY RepeatOrder DESC, TotalPrice DESC;



--- Quantity of products purchased in each country
SELECT
		DISTINCT(Description),
		COUNT(Quantity) AS TotalQuantity,
		Country
FROM RAW_OnlineRetailAnalysis_20220211
GROUP BY Quantity, Description, Country
ORDER BY TotalQuantity DESC;


---
SELECT
		DISTINCT(Description),
		COUNT(Quantity) AS TotalQuantity,
		ROUND(SUM(UnitPrice), 0) AS TotalPrice,
		Country
FROM RAW_OnlineRetailAnalysis_20220211
GROUP BY Quantity, Description, Country, UnitPrice 
ORDER BY TotalQuantity DESC, TotalPrice DESC;