# Rebuild Project 1 from scratch — guided plan

**Purpose:** Independently reproduce the sales-analysis workflow without relying on finished dashboards. Allocate your own pace; durations are illustrative, not mandatory.

## Stage 0: Business brief & source data
- Goal: understand revenue, profit margin, year-over-year performance, regional differences, and product mix in a fictional UK retail company.
- Copy `data/sales_data.csv` to a clean working folder. Define `sales = revenue`, `profit = sales - cost` and order uniqueness by `order_id`.
- Check 2,500 rows, 2,500 distinct order IDs, 0 missing cells, dates in 2024–2025. Keep original source unchanged.

## Stage 1: Excel
1. Import CSV via Data > From Text/CSV. Confirm date/numeric types and create a table named SalesData.
2. Create KPIs: `=SUM(SalesData[sales])`, `=SUM(SalesData[profit])`, `=COUNTA(SalesData[order_id])`, `=SUM(SalesData[profit])/SUM(SalesData[sales])`.
3. Pivot 1: `category` rows, sum of `sales`. Pivot 2: `region` rows, sum of `profit`. Pivot 3: `order_date` grouped by month and year, sum of `sales`.
4. Add line and bar charts; build an Executive Overview tab; add slicers if desired. Validate full totals.

## Stage 2: SQL (SQLite)
1. Import CSV with column headers into table `sales` using DB Browser for SQLite.
2. Validate data: `SELECT COUNT(*), COUNT(DISTINCT order_id) FROM sales;`.
3. Run business questions:
```sql
SELECT ROUND(SUM(sales),2) AS revenue, ROUND(SUM(profit),2) AS profit FROM sales;
SELECT category, ROUND(SUM(sales),2) AS revenue FROM sales GROUP BY category ORDER BY revenue DESC;
SELECT region, ROUND(SUM(sales),2) AS revenue FROM sales GROUP BY region ORDER BY revenue DESC;
SELECT substr(order_date,1,7) AS month, ROUND(SUM(sales),2) AS revenue FROM sales GROUP BY month ORDER BY month;
SELECT product, ROUND(SUM(sales),2) AS revenue FROM sales GROUP BY product ORDER BY revenue DESC LIMIT 5;
```
4. Save your queries as `sql/analysis.sql` and the database as `.sqlite`.

## Stage 3: Python
1. Install pandas/matplotlib/jupyter. Load `data/sales_data.csv` and parse `order_date`.
2. Validate missing/duplicate data, compute `sales.sum()`, `profit.sum()`, `order_id.nunique()`, margin.
3. Group by category, region and `order_date.dt.to_period('M')`; chart revenue over time.
4. Export plots to `visuals/`, notebook to `python/`. Repeat calculations from SQL to confirm values.

## Stage 4: Power BI
1. Import CSV; in Power Query verify Text/Date/Decimal fields.
2. Rename data table `Sales`. Make Calendar table and one-to-many date relationship; mark as date table.
3. Add DAX measures in `guides/POWER_BI_POLISH.md`.
4. Build two pages, cross-filters and tooltips; verify numbers; save `.pbix`.

## Stage 5: Tableau
1. Connect to the same CSV, use Date for `order_date`, use Number for `sales`, `profit`.
2. Create KPI fields and charts in `guides/TABLEAU_POLISH.md`.
3. Build two dashboards, apply date/category/region filters globally, save `.twbx` and screenshots.

## Stage 6: Present & publish
1. Write: question, method, results, recommendations, caveats.
2. Use `README.md` and `guides/GITHUB_PUBLISHING.md` to package and publish.
3. Clearly distinguish **synthetic data** from real-world impact. Do not claim revenue increases caused by the analysis.

## Consistency checklist
- Full data: 2,500 unique orders; £1,601,846.50 sales; £415,491.52 profit; 25.94% profit margin.
- Technology £928,057.25 sales; North £584,072.60; revenue growth 2025 vs 2024 about 2.87%.
