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
FROM sales_data
WHERE
    CustomerID IS NOT NULL
    AND Quantity > 0
    AND UnitPrice > 0;

Using the `CleanedSales` view, I performed key sales analyses including:

- 📈 Monthly Sales Trend  
- 🏆 Top 10 Best-Selling Products  
- 🌍 Top 5 Countries by Revenue  
- 💰 Customer Lifetime Value  
- 🧾 Average Order Value
