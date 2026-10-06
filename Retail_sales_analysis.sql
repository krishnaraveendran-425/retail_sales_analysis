-- Retail Sales Analysis
-- Synthetic dataset created for portfolio and learning purposes.
-- Database: retail_sales
-- Table: sales

USE retail_sales;

-- 1. Total Sales
SELECT SUM(price) AS total_sales
FROM sales;

-- 2. Total Orders
SELECT COUNT(*) AS total_orders
FROM sales;

-- 3. Average Price
SELECT ROUND(AVG(price), 2) AS average_price
FROM sales;

-- 4. Highest Price
SELECT MAX(price) AS highest_price
FROM sales;

-- 5. Lowest Price
SELECT MIN(price) AS lowest_price
FROM sales;

-- 6. Sales by Product Brand
SELECT
    product_brand,
    SUM(price) AS total_sales
FROM sales
GROUP BY product_brand
ORDER BY total_sales DESC;

-- 7. Sales by Product Category
SELECT
    product_category,
    SUM(price) AS total_sales
FROM sales
GROUP BY product_category
ORDER BY total_sales DESC;

-- 8. Sales by Individual Product
SELECT
    product_name,
    SUM(price) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC;

-- 9. Monthly Sales
SELECT
    MONTHNAME(order_date) AS month,
    SUM(price) AS total_sales
FROM sales
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY total_sales DESC;

-- 10. Average Price by Product Category
SELECT
    product_category,
    ROUND(AVG(price), 2) AS average_price
FROM sales
GROUP BY product_category
ORDER BY average_price DESC;

-- 11. Order Count by Product Category
SELECT
    product_category,
    COUNT(*) AS order_count
FROM sales
GROUP BY product_category
ORDER BY order_count DESC;

-- 12. Order Count by Product Brand
SELECT
    product_brand,
    COUNT(*) AS order_count
FROM sales
GROUP BY product_brand
ORDER BY order_count DESC;

-- 13. Average Price by Product Brand
SELECT
    product_brand,
    ROUND(AVG(price), 2) AS average_price
FROM sales
GROUP BY product_brand
ORDER BY average_price DESC;

-- 14. Price Range Analysis
SELECT
    CASE
        WHEN price < 30000 THEN 'Below ₹30,000'
        WHEN price <= 60000 THEN '₹30,000–₹60,000'
        WHEN price <= 90000 THEN '₹60,000–₹90,000'
        ELSE 'Above ₹90,000'
    END AS price_range,
    COUNT(*) AS order_count
FROM sales
GROUP BY price_range
ORDER BY order_count DESC;
