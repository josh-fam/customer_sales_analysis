SELECT
    Country,
    SUM(TotalPrice) AS Revenue
FROM CleanedSales
GROUP BY Country
ORDER BY Revenue DESC
LIMIT 5;