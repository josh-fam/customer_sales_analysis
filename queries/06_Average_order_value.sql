-- Step 6: Average Order Value
WITH OrderTotals AS (
    SELECT
        InvoiceNo,
        SUM(TotalPrice) AS OrderValue
    FROM CleanedSales
    GROUP BY InvoiceNo
)
SELECT
    AVG(OrderValue) AS AverageOrderValue
FROM OrderTotals;