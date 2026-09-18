CREATE DATABASE SupplyChainAnalytics;

USE SupplyChainAnalytics;
GO

(REPLACE[SupplyChainAnalytics] with the SupplyChainAnalytics)
SELECT COUNT(*) AS Total_Rows
FROM DataCo_cleaned;

SELECT TOP 10
    Latitude,
    Longitude,
    [Customer_Zipcode]
FROM DataCo_cleaned;

SELECT TOP 10 *
FROM DataCo_cleaned;

-- TOTAL_SALES --
SELECT 
SUM(SALES) AS TOTAL_SALES
FROM DataCo_cleaned;


-- TOTAL_PROFIT --
SELECT 
    SUM([Order_Profit_Per_Order]) AS Total_Profit
FROM DataCo_cleaned;


-- TOTAL ORDERS --
SELECT 
    COUNT(DISTINCT [Order_Id]) AS Total_Orders
FROM DataCo_cleaned;


-- SALES BY YEAR --
SELECT
    Year,
    SUM(Sales) AS Total_Sales,
    SUM([Order_Profit_Per_Order]) AS Total_Profit,
    COUNT(DISTINCT [Order_Id]) AS Total_Orders
FROM DataCo_cleaned
GROUP BY Year
ORDER BY Year;


-- MONTHLY SALES --
 SELECT
    Month,
    SUM(Sales) AS Total_Sales,
    SUM([Order_Profit_Per_Order]) AS Total_Profit,
    COUNT(DISTINCT [Order_Id]) AS Total_Orders
FROM DataCo_cleaned
GROUP BY Month
ORDER BY Month;


-- SALES BY DEPARTMENT --

SELECT
    DEPARTMENT_Id,DEPARTMENT_NAME,
    SUM(Sales) AS Total_Sales,
    SUM([Order_Profit_Per_Order]) AS Total_Profit,
    COUNT(DISTINCT [Order_Id]) AS Total_Orders
FROM DataCo_cleaned
GROUP BY DEPARTMENT_Id,Department_Name
ORDER BY Total_Sales DESC;


-- SALES BY CATEGORY --

SELECT
   CATEGORY_Name,
    SUM(Sales) AS Total_Sales,
    SUM([Order_Profit_Per_Order]) AS Total_Profit,
    COUNT(DISTINCT [Order_Id]) AS Total_Orders
FROM DataCo_cleaned
GROUP BY CATEGORY_Name
ORDER BY Total_Sales DESC;


-- SALES BY CUSTOMER SEGMENT --

SELECT
   Customer_Segment,
    SUM(Sales) AS Total_Sales,
    SUM([Order_Profit_Per_Order]) AS Total_Profit,
    COUNT(DISTINCT [Order_Id]) AS Total_Orders
FROM DataCo_cleaned
GROUP BY Customer_Segment
ORDER BY Total_Sales DESC;


-- Sales by Market --

SELECT
   Market,
    SUM(Sales) AS Total_Sales,
    SUM([Order_Profit_Per_Order]) AS Total_Profit,
    COUNT(DISTINCT [Order_Id]) AS Total_Orders
FROM DataCo_cleaned
GROUP BY Market
ORDER BY Total_Sales DESC;


-- Sales By Region --
SELECT
   Order_Region,
    SUM(Sales) AS Total_Sales,
    SUM([Order_Profit_Per_Order]) AS Total_Profit,
    COUNT(DISTINCT [Order_Id]) AS Total_Orders
FROM DataCo_cleaned
GROUP BY Order_Region
ORDER BY Total_Sales DESC;


-- Profit Margin by Category --
SELECT
    [Category_Name],
    SUM(Sales) AS Total_Sales,
    SUM([Order_Profit_Per_Order]) AS Total_Profit,
    ROUND(
        SUM([Order_Profit_Per_Order]) * 100.0 / SUM(Sales) , 2
    ) AS Profit_Margin_Percent
FROM DataCo_cleaned
GROUP BY [Category_Name]
ORDER BY Profit_Margin_Percent DESC;



-- OverAll Late Delivery Late --
SELECT 
AVG(CAST(Late_delivery_risk AS FLOAT) * 100) AS Late_Delivery_Rate_percent
FROM DataCo_cleaned



-- Delivery Performance by Shipping Mode --
SELECT 
Shipping_Mode,
COUNT(DISTINCT[Order_id]) AS Total_Orders,
SUM(SALES) AS Total_Sales,
SUM(Order_Profit_Per_Order) AS Total_Profit,
ROUND(AVG(CAST(Days_for_shipping_real AS FLOAT)),2) AS Avg_Shipping_Days,
ROUND(AVG(CAST(Late_delivery_risk AS FLOAT)*100 ),2) AS Late_Delivery_Rate
FROM DataCo_cleaned
GROUP BY Shipping_Mode
ORDER BY Late_Delivery_Rate DESC;



-- Delivery Performance by Region --

SELECT
    Order_Region,
    COUNT(DISTINCT [Order_Id]) AS Total_Orders,
    ROUND(AVG(CAST([Delivery_Gap] AS FLOAT)), 2) AS Avg_Delivery_Gap,
    ROUND(AVG(CAST(Late_delivery_risk AS FLOAT)) * 100, 2) AS Late_Delivery_Rate,
    ROUND(AVG(CAST([Days_for_shipping_real] AS FLOAT)), 2) AS Avg_Shipping_Days
FROM DataCo_cleaned
GROUP BY Order_Region
ORDER BY Late_Delivery_Rate DESC;



-- Top 10 Products by Sales --
SELECT TOP 10 
Product_Name,
COUNT(DISTINCT[Order_id]) AS Total_Orders,
SUM(SALES) AS Total_Sales,
SUM(Order_Profit_Per_Order) AS Total_Profit
FROM DataCo_cleaned
GROUP BY Product_Name
ORDER BY Total_Profit DESC;



-- Top 10 Products by Profit --
SELECT TOP 10 
Product_Name,
COUNT(DISTINCT[Order_id]) AS Total_Orders,
SUM(SALES) AS Total_Sales,
SUM(Order_Profit_Per_Order) AS Total_Profit
FROM DataCo_cleaned
GROUP BY Product_Name
ORDER BY Total_Profit DESC;



-- Loss Making Products --
SELECT 
Product_Name,
COUNT(DISTINCT[Order_id]) AS Total_Orders,
SUM(SALES) AS Total_Sales,
SUM(Order_Profit_Per_Order) AS Total_Profit
FROM DataCo_cleaned
GROUP BY Product_Name
HAVING SUM(Order_Profit_Per_Order) < 0
ORDER BY Total_Profit DESC;



-- Sales Contribution by Category --

SELECT 
  Category_Name,
  SUM(SALES) AS Total_Sales,
  ROUND (
   SUM(SALES) * 100.0 /
   (SELECT SUM(SALES) FROM DataCo_Cleaned) , 
   2
   )
   AS Sales_Contribution_percent 
   FROM DataCo_Cleaned
   GROUP BY Category_Name
   ORDER BY Sales_Contribution_percent



   -- Year-over-Year Sales Growth using LAG() --

WITH YEARLYSALES AS (
       SELECT 
       Year,
       SUM(SALES) AS Total_Sales
       FROM DataCo_Cleaned
       GROUP BY Year
       )
       SELECT 
       Year ,
       Total_Sales ,
       LAG(Total_Sales) OVER (ORDER BY Year) AS Previous_year_Sales,
       ROUND 
       (
       (Total_Sales - LAG(Total_Sales) OVER (ORDER BY Year) ) * 100.0 / LAG(Total_Sales) OVER (ORDER BY Year) ,
       2 ) AS YOY_Growth_Percent 
       FROM YEARLYSALES 
       ORDER BY YEAR 



   -- Rank Categories by Sales --
   
   SELECT 
       Category_Name,
       SUM(SALES) AS Total_Sales,
       RANK() OVER (
       ORDER BY SUM(SALES) DESC 
       ) AS Sales_Rank
       FROM DataCo_Cleaned 
       GROUP BY Category_Name
       ORDER BY Sales_Rank;
