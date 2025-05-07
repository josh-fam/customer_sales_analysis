-- Step 2: Monthly Revenue Trend
-- This query calculates the total revenue for each month by summing the TotalPrice for each month.
-- It uses the DATE_TRUNC function to group the data by month and the SUM function to calculate the total revenue for each month.

SELECT
    DATE_TRUNC('month', InvoiceDate) AS Month,
    SUM(TotalPrice) AS MonthlyRevenue
FROM CleanedSales
GROUP BY Month
ORDER BY Month;