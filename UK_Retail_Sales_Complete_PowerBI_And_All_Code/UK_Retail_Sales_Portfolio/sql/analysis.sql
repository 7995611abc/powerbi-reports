-- SQLite-compatible Sales Portfolio Analysis
-- 1. Data-quality checks
SELECT COUNT(*) AS rows, COUNT(DISTINCT order_id) AS orders,
 SUM(CASE WHEN order_date IS NULL OR region IS NULL OR sales IS NULL THEN 1 ELSE 0 END) AS missing_key_fields
FROM sales;

-- 2. KPI overview
SELECT ROUND(SUM(sales),2) AS revenue, ROUND(SUM(profit),2) AS profit,
 ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales),0),2) AS profit_margin_pct,
 COUNT(DISTINCT order_id) AS orders, SUM(quantity) AS units,
 ROUND(SUM(sales)/NULLIF(COUNT(DISTINCT order_id),0),2) AS average_order_value
FROM sales;

-- 3. Monthly performance
SELECT substr(order_date,1,7) AS year_month, ROUND(SUM(sales),2) AS revenue,
 ROUND(SUM(profit),2) AS profit, COUNT(*) AS orders
FROM sales GROUP BY 1 ORDER BY 1;

-- 4. Product category performance
SELECT category, ROUND(SUM(sales),2) AS revenue, ROUND(SUM(profit),2) AS profit,
 ROUND(100.0*SUM(profit)/NULLIF(SUM(sales),0),2) AS margin_pct
FROM sales GROUP BY category ORDER BY revenue DESC;

-- 5. Regional sales
SELECT region, ROUND(SUM(sales),2) AS revenue, ROUND(SUM(profit),2) AS profit,
 COUNT(*) AS orders FROM sales GROUP BY region ORDER BY revenue DESC;

-- 6. Segment performance
SELECT segment, ROUND(SUM(sales),2) AS revenue,
 ROUND(SUM(profit),2) AS profit FROM sales GROUP BY segment ORDER BY revenue DESC;

-- 7. Top products by revenue
SELECT product, category, ROUND(SUM(sales),2) AS revenue,
 ROUND(SUM(profit),2) AS profit FROM sales GROUP BY product,category ORDER BY revenue DESC LIMIT 10;

-- 8. Discount effectiveness
SELECT CAST(ROUND(discount*100) AS INT) AS discount_pct, COUNT(*) AS orders,
 ROUND(SUM(sales),2) AS revenue, ROUND(SUM(profit),2) AS profit,
 ROUND(100.0*SUM(profit)/NULLIF(SUM(sales),0),2) AS margin_pct
FROM sales GROUP BY 1 ORDER BY 1;

-- 9. Rank products within category using window functions
WITH grouped AS (
 SELECT category, product, ROUND(SUM(sales),2) AS revenue FROM sales GROUP BY category,product
)
SELECT category, product, revenue,
 DENSE_RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS product_rank
FROM grouped ORDER BY category,product_rank;
