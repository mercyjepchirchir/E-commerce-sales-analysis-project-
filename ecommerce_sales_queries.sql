-- E-commerce Sales Analysis
-- Table name: ecommerce_sales


-- 1. Calculate total sales and total profit

SELECT
    ROUND(SUM(Net_Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM ecommerce_sales;


-- 2. Analyze sales by product

SELECT
    Product,
    SUM(Quantity) AS units_sold,
    ROUND(SUM(Net_Sales), 2) AS sales,
    ROUND(SUM(Profit), 2) AS profit
FROM ecommerce_sales
GROUP BY Product
ORDER BY sales DESC;


-- 3. Analyze sales by region

SELECT
    Region,
    COUNT(*) AS orders,
    ROUND(SUM(Net_Sales), 2) AS sales
FROM ecommerce_sales
GROUP BY Region
ORDER BY sales DESC;


-- 4. Analyze monthly sales

SELECT
    EXTRACT(YEAR FROM Order_Date) AS year,
    EXTRACT(MONTH FROM Order_Date) AS month,
    ROUND(SUM(Net_Sales), 2) AS sales
FROM ecommerce_sales
GROUP BY
    EXTRACT(YEAR FROM Order_Date),
    EXTRACT(MONTH FROM Order_Date)
ORDER BY year, month;


-- 5. Find products with profit margins above 35%

SELECT
    Product,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Net_Sales), 0) * 100,
        2
    ) AS profit_margin_pct
FROM ecommerce_sales
GROUP BY Product
HAVING SUM(Profit) / NULLIF(SUM(Net_Sales), 0) > 0.35
ORDER BY profit_margin_pct DESC;