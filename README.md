# 🛍️ Customer Sales & Retention Analysis

## 📊 Project Overview
This project analyzes customer behavior and sales data from an online retail company using SQL. The goal is to uncover insights that help improve customer retention, product strategy, and overall business performance.

---

## ✅ Analysis Steps & Findings

### 1️⃣ Step 1: Data Cleaning (`01_cleaning.sql`)
- **What was done:**
  - Removed transactions with:
    - Missing customer IDs
    - Negative quantities (returns)
    - Zero or negative prices
  - Calculated `TotalPrice` as `Quantity * UnitPrice`
  - Created a view `CleanedSales` for reusable queries

```sql
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
FROM OnlineRetail
WHERE
    CustomerID IS NOT NULL
    AND Quantity > 0
    AND UnitPrice > 0;

2️⃣ Step 2: Top 10 Best-Selling Products

    What was done:

        Aggregated total quantity sold per product

        Sorted to find the top 10 products by volume

SELECT
    Description,
    SUM(Quantity) AS TotalSold
FROM CleanedSales
GROUP BY Description
ORDER BY TotalSold DESC
LIMIT 10;

    Insight: These are your highest-moving products; great candidates for promotions or bundling.

3️⃣ Step 3: Top 5 Countries by Revenue

    What was done:

        Summed total revenue (TotalPrice) by country

SELECT
    Country,
    SUM(TotalPrice) AS Revenue
FROM CleanedSales
GROUP BY Country
ORDER BY Revenue DESC
LIMIT 5;

    Insight: Shows your most profitable international markets.

4️⃣ Step 4: Monthly Revenue Trend (02_sales_trends.sql)

    What was done:

        Grouped transactions by month

        Calculated monthly revenue

SELECT
    DATE_TRUNC('month', InvoiceDate) AS Month,
    SUM(TotalPrice) AS MonthlyRevenue
FROM CleanedSales
GROUP BY Month
ORDER BY Month;

    Replace DATE_TRUNC with:

        STRFTIME('%Y-%m', InvoiceDate) for SQLite

        DATE_FORMAT(InvoiceDate, '%Y-%m') for MySQL

    Insight: Helps identify seasonality and performance over time.

5️⃣ Step 5: Customer Lifetime Value (LTV)

    What was done:

        Aggregated each customer’s total purchases

SELECT
    CustomerID,
    SUM(TotalPrice) AS LifetimeValue
FROM CleanedSales
GROUP BY CustomerID
ORDER BY LifetimeValue DESC
LIMIT 10;

    Insight: Top 10 customers generate a significant portion of revenue — ideal for loyalty or VIP programs.

6️⃣ Step 6: Average Order Value (AOV)

    What was done:

        Summed revenue per order (invoice)

        Calculated average order value

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

    Insight: AOV helps benchmark marketing efficiency and upselling strategies.

🛠️ Tools Used

    SQL (PostgreSQL / SQLite / MySQL)

    Visual Studio Code

    Git & GitHub

📁 Folder Structure

customer_sales_analysis/
│
├── data/              # Raw dataset (CSV or SQL dump)
│   └── online_retail.csv
│
├── queries/           # SQL queries
│   └── 01_cleaning.sql
│   └── 02_sales_trends.sql
│
├── results/           # Optional exports or charts
├── README.md          # Project documentation
└── .gitignoregit