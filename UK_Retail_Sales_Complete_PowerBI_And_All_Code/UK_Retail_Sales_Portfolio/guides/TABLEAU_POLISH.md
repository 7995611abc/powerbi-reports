# Tableau dashboard enhancement plan

## Executive Overview
Create four KPI worksheets: `SUM([sales])`, `SUM([profit])`, `COUNTD([order_id])`, and `SUM([profit])/SUM([sales])` (handle zero denominators). Use a tiled layout and a fixed desktop dashboard size such as 1366×768.

- Row 1: sales, profit, unique orders, margin.
- Row 2: month-year sales trend (continuous month) and category revenue bars.
- Row 3: regional sales-profit comparison and top products.
- Right side: Year, Region and Category filters applying to all relevant worksheets using this data source.

## Product Profitability dashboard
Create a product/category table with sales, profit, margin; a bar chart ranking products by revenue; and a scatter chart with sales vs margin. Enable **Use as Filter** on bars to drive cross-highlighting. Use a tooltip with value, profit and margin; use currency/percent formats correctly.

## Tableau calculated fields (separate fields)
```text
Total Revenue: SUM([sales])
Total Profit: SUM([profit])
Total Orders: COUNTD([order_id])
Profit Margin: IF SUM([sales]) != 0 THEN SUM([profit])/SUM([sales]) END
Average Order Value: SUM([sales])/COUNTD([order_id])
```

## Acceptance tests
All filters cleared: revenue £1,601,846.50, profit £415,491.52, 2,500 orders, margin 25.94%. Confirm month-year granularity, no inflated row counts, correct date parsing, and no accidental duplicate records. Save packaged `.twbx` from Tableau or publish to Tableau Public; only share synthetic data.
