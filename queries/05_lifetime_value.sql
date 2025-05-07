-- Step 5: Customer Lifetime Value
SELECT
    CustomerID,
    SUM(TotalPrice) AS LifetimeValue
FROM CleanedSales
GROUP BY CustomerID
ORDER BY LifetimeValue DESC
LIMIT 10;