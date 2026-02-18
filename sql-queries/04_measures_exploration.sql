/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/

-- Find the Total Sales
SELECT SUM(sales_amount) AS total_sales FROM dbo.fact_sales

-- Find how many items are sold
SELECT SUM(quantity) AS total_quantity FROM dbo.fact_sales

-- Find the average selling price
SELECT AVG(price) AS avg_price FROM dbo.fact_sales

-- Find the Total number of Orders
SELECT COUNT(order_number) AS total_orders FROM dbo.fact_sales
SELECT COUNT(DISTINCT order_number) AS total_orders FROM dbo.fact_sales

-- Find the total number of products
SELECT COUNT(product_name) AS total_products FROM dbo.dim_products

-- Find the total number of customers
SELECT COUNT(customer_key) AS total_customers FROM dbo.dim_customers;

-- Find the total number of customers that has placed an order
SELECT COUNT(DISTINCT customer_key) AS total_customers FROM dbo.fact_sales;

-- Generate a Report that shows all key metrics of the business
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM dbo.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM dbo.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM dbo.fact_sales
UNION ALL
SELECT 'Total Orders', COUNT(DISTINCT order_number) FROM dbo.fact_sales
UNION ALL
SELECT 'Total Products', COUNT(DISTINCT product_name) FROM dbo.dim_products
UNION ALL
SELECT 'Total Customers', COUNT(customer_key) FROM dbo.dim_customers;
