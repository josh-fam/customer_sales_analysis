-- Step 1: Create Cleaned View (remove nulls, bad data, and calculate TotalPrice)
CREATE VIEW CleanedSales AS
SELECT
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    UnitPrice,
    Quantity * UnitPrice AS TotalPrice,
    InvoiceDate,
    CustomerID,
    Country
FROM sales_data
WHERE
    CustomerID IS NOT NULL
    AND Quantity > 0
    AND UnitPrice > 0;
SELECT * FROM CleanedSales LIMIT 10;
