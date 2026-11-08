---- Check whether the data imported correctly
USE superstore_analysis;
SELECT *
FROM superstore_cleaned
LIMIT 10;

-- Count the records
SELECT COUNT(*) AS total_records
FROM superstore_cleaned;

-- Calculate total sales
SELECT
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore_cleaned;

------------------------------------------------------------------- 
-- SQL business analysis queries
----------------------------------------------------------------
-- Total revenue : How much revenue did the Superstore generate?
SELECT
    SUM(Sales) AS Total_Revenue
FROM superstore_cleaned;

-- Sales by year: Which year generated the highest revenue?
SELECT
    YEAR(`Order Date`) AS Order_Year,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore_cleaned
GROUP BY YEAR(`Order Date`)
ORDER BY Order_Year;

-- Sales by product category : Which category performs best?
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore_cleaned
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Top 10 products : Which products generate the most revenue?
SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore_cleaned
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- Sales by customer segment : Which customer segment contributes the most?
SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore_cleaned
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- Sales by region : Which region performs best?
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore_cleaned
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Top 10 cities : Where are the strongest sales markets?
SELECT
    City,
    State,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore_cleaned
GROUP BY City, State
ORDER BY Total_Sales DESC
LIMIT 10;

-- Shipping performance : Which shipping method is most commonly used, and what is its average shipping duration?
SELECT
    `Ship Mode`,
    COUNT(*) AS Total_Orders,
    ROUND(AVG(`Shipping Days`), 2) AS Average_Shipping_Days
FROM superstore_cleaned
GROUP BY `Ship Mode`
ORDER BY Total_Orders DESC;

-- Monthly sales : How does revenue change from month to month?
SELECT
    YEAR(`Order Date`) AS Sales_Year,
    MONTH(`Order Date`) AS Sales_Month,
    ROUND(SUM(Sales), 2) AS Monthly_Sales
FROM superstore_cleaned
GROUP BY
    YEAR(`Order Date`),
    MONTH(`Order Date`)
ORDER BY Sales_Year, Sales_Month;

-- Top customers by revenue : Which customers contribute the highest revenue?
SELECT
    `Customer ID`,
    `Customer Name`,
    ROUND(SUM(Sales), 2) AS Customer_Revenue
FROM superstore_cleaned
GROUP BY
    `Customer ID`,
    `Customer Name`
ORDER BY Customer_Revenue DESC
LIMIT 10;


