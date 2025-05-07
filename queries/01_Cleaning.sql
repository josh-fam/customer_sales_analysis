-- 01_cleaning.sql

-- Remove rows where CustomerID is null (this helps clean the data)
SELECT *
FROM sales_data
WHERE CustomerID IS NOT NULL;   
