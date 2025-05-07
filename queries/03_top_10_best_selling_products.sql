SELECT
    Description,
    SUM(Quantity) AS TotalSold
FROM CleanedSales
GROUP BY Description
ORDER BY TotalSold DESC
LIMIT 10;