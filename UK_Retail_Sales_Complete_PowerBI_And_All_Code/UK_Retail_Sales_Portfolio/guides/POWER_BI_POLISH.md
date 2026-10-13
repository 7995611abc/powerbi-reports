# Power BI report enhancement plan

## Page 1: Executive Overview (16:9)
- Top banner: UK Retail Sales Performance | 2024–2025; small synthetic-data disclosure.
- KPI row: Total Sales, Total Profit, Unique Orders, Profit Margin %.
- Middle: monthly Sales line chart occupying ~60% width; Revenue by Category bar chart at ~40%.
- Bottom: Region Sales + Profit clustered columns and Top 5 Products bar chart.
- Slicer rail: Year, Region, Category; use a Reset Filters bookmark/button if desired.
- Consistent title typography, GBP formatting, tooltips and axis labels. Avoid gratuitous doughnut charts.

## Page 2: Profitability & Drill-through
- Matrix: Region > Category > Product; measures Total Sales, Total Profit, Profit Margin %.
- Scatter: Total Sales vs Profit Margin %, details = Product; tooltip with Orders and Total Profit.
- Year-over-year change card (guard against a blank prior-year denominator).
- Add drill-through using Product and a Back button.

## Suggested DAX measures (create separately)
```dax
Total Sales = SUM(Sales[sales])
Total Profit = SUM(Sales[profit])
Total Orders = DISTINCTCOUNT(Sales[order_id])
Profit Margin % = DIVIDE([Total Profit], [Total Sales])
Average Order Value = DIVIDE([Total Sales], [Total Orders])
Sales LY = CALCULATE([Total Sales], SAMEPERIODLASTYEAR('Calendar'[Date]))
YoY Sales % = DIVIDE([Total Sales] - [Sales LY], [Sales LY])
```
Build a Calendar with CALENDAR(MIN(Sales[order_date]),MAX(Sales[order_date])) and relate it to Sales[order_date]. Mark the Calendar date field as the Date Table. Sort month label by a numeric month/year key.

## Acceptance tests
- Unfiltered Sales £1,601,846.50; Profit £415,491.52; Orders 2500; Margin 25.94%.
- Filters affect all appropriate charts and KPI cards.
- Month axis displays 2024-01 through 2025-12 chronologically.
- No unverified percentage changes are described as causal effects.
- Save `powerbi/UK_Retail_Sales_PowerBI.pbix` locally and export genuine screenshots to `visuals/`.
