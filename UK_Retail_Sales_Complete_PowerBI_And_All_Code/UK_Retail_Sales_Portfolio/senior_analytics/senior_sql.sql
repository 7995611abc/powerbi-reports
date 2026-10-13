-- SQLite. Source: data/sales_data.csv. Import table as sales and parse order_date YYYY-MM-DD.
-- KPI reconciliation
SELECT COUNT(*) rows,COUNT(DISTINCT order_id) orders, ROUND(SUM(sales),2) revenue, ROUND(SUM(profit),2) profit, ROUND(100.0*SUM(profit)/NULLIF(SUM(sales),0),2) margin_pct FROM sales;

-- Reusable category-level metrics
WITH category_kpis AS (
 SELECT category, COUNT(DISTINCT order_id) orders, SUM(sales) revenue, SUM(cost) cost, SUM(profit) profit
 FROM sales GROUP BY category
)
SELECT category, orders, ROUND(revenue,2) revenue, ROUND(profit,2) profit, ROUND(100.0*profit/NULLIF(revenue,0),2) margin_pct,
 ROUND(100.0*revenue/SUM(revenue) OVER (),2) revenue_share_pct
FROM category_kpis ORDER BY revenue DESC;

-- Year over year sales using conditional aggregation
SELECT strftime('%m',order_date) month_number,
 ROUND(SUM(CASE WHEN strftime('%Y',order_date)='2024' THEN sales ELSE 0 END),2) revenue_2024,
 ROUND(SUM(CASE WHEN strftime('%Y',order_date)='2025' THEN sales ELSE 0 END),2) revenue_2025
FROM sales GROUP BY month_number ORDER BY month_number;

-- Regional product-mix contribution
WITH k AS (SELECT region, category, SUM(sales) revenue, SUM(profit) profit FROM sales GROUP BY region,category)
SELECT region,category,ROUND(revenue,2) revenue,ROUND(profit,2) profit,
 ROUND(100.0*revenue/NULLIF(SUM(revenue) OVER (PARTITION BY region),0),2) region_sales_share_pct
FROM k ORDER BY region,revenue DESC;

-- Data contracts / quality indicators
SELECT COUNT(*) row_count,COUNT(DISTINCT order_id) unique_orders,
 SUM(CASE WHEN order_date IS NULL OR order_date='' THEN 1 ELSE 0 END) missing_date,
 SUM(CASE WHEN sales < 0 THEN 1 ELSE 0 END) negative_revenue,
 SUM(CASE WHEN ABS(sales-cost-profit)>0.02 THEN 1 ELSE 0 END) invalid_profit_equation
FROM sales;
