/****** Script for SelectTopNRows command from SSMS  ******/
USE DATraining
GO   


--- View all rows
SELECT *
FROM RAW_OnlineRetailAnalysis_20220211
WHERE YEAR(InvoiceDate) = '2011'
ORDER BY Quantity DESC;


---
SELECT 
		CustomerID,
		Country,
		ROUND(Quantity * UnitPrice, 1) AS Revenue
FROM RAW_OnlineRetailAnalysis_20220211
ORDER BY Revenue DESC;


--- Countries with highest revenue
SELECT
		DISTINCT(CustomerID),
		Country,
		ROUND(Quantity * UnitPrice, 1) AS Revenue
FROM RAW_OnlineRetailAnalysis_20220211
ORDER BY Revenue DESC;  


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
		ROUND(SUM(UnitPrice), 0) AS TotalPrice,
		Country
FROM RAW_OnlineRetailAnalysis_20220211
GROUP BY Quantity, Description, Country, UnitPrice 
ORDER BY TotalQuantity DESC, TotalPrice DESC; 


--- Top 20 products with highest unit price
SELECT TOP(20)
		UnitPrice,
		Description,
		Country,
		InvoiceDate
FROM RAW_OnlineRetailAnalysis_20220211
ORDER BY UnitPrice DESC; 


--- Number of orders for different products from each country
SELECT
		COUNT(Description) NumberofOrders,
		Description,
		Country
FROM RAW_OnlineRetailAnalysis_20220211
GROUP BY Country, Description
ORDER BY NumberofOrders DESC;


--- --- Number of orders for the 5 most expensive products
SELECT
		COUNT(Description) NumberofOrders,
		Description,
		Country
FROM RAW_OnlineRetailAnalysis_20220211
WHERE Description IN ('AMAZON FEE', 'DOTCOM POSTAGE', 'Adjust debt', 'Manual', 'POSTAGE')
GROUP BY Country, Description;


--- Total orders made by different customers in each country
SELECT
		Country,
		COUNT(DISTINCT CustomerID) AS CountryOrders
FROM RAW_OnlineRetailAnalysis_20220211
GROUP BY Country
ORDER BY CountryOrders DESC;


--- Number of records in each month of the year 2011
SELECT COUNT(*) AS NumberofOrders, MONTH(InvoiceDate) AS Month
FROM RAW_OnlineRetailAnalysis_20220211
WHERE YEAR(InvoiceDate) = '2011' 
GROUP BY  MONTH(InvoiceDate)
ORDER BY NumberofOrders DESC;


--- Products purchased in the month of november
SELECT * 
FROM RAW_OnlineRetailAnalysis_20220211 
WHERE MONTH(InvoiceDate) = 11 AND YEAR(InvoiceDate) = '2011'
ORDER BY Quantity DESC;