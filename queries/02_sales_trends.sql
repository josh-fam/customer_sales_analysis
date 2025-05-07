-- 02_sales_trends.sql

-- Query to calculate total revenue per month
SELECT DATE_TRUNC('month', InvoiceDate) AS Month,
       SUM(Quantity * UnitPrice) AS Revenue
FROM sales_data
GROUP BY Month
ORDER BY Month;
