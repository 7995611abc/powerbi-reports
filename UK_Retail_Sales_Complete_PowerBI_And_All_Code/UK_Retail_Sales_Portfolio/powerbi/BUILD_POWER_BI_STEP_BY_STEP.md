# UK Retail Sales Performance | Power BI Portfolio Project

## Goal
Create a two-page interactive Power BI report based on fictional UK retail transactions (2024–2025). Dataset: `sales_data.csv` (2,500 rows). The dataset is synthetic, not actual company records.

## Step 1: Install Power BI Desktop
On Windows, install from https://learn.microsoft.com/power-bi/fundamentals/desktop-get-the-desktop . Power BI Desktop is primarily a Windows desktop application.

## Step 2: Import
Home > Get data > Text/CSV > sales_data.csv > Transform Data. Rename query to **Sales**. In Power Query verify: `order_date` = Date; `quantity`, `unit_price` = Whole Number; `discount`, `sales`, `cost`, `profit` = Decimal Number; IDs/dimensions = Text. Inspect for nulls and errors (do not delete valid transactions). Close & Apply.

## Step 3: Calendar
Modeling > New table:
```DAX
Calendar = CALENDAR(MIN(Sales[order_date]), MAX(Sales[order_date]))
```
Create separate new columns on Calendar:
```DAX
Year = YEAR('Calendar'[Date])
Month Number = MONTH('Calendar'[Date])
Month Name = FORMAT('Calendar'[Date], "MMM")
Year Month = FORMAT('Calendar'[Date], "YYYY-MM")
```
Sort `Calendar[Month Name]` by `Calendar[Month Number]`. Set Calendar as a date table using `Calendar[Date]`, and connect Calendar[Date] (one) to Sales[order_date] (many), single direction.

## Step 4: Measures
Create **each** line as its own measure (the accompanying `PowerBI_Measures.dax` lists them).
```DAX
Total Sales = SUM(Sales[sales])
Total Profit = SUM(Sales[profit])
Total Orders = DISTINCTCOUNT(Sales[order_id])
Profit Margin % = DIVIDE([Total Profit], [Total Sales], 0)
Total Quantity = SUM(Sales[quantity])
Average Order Value = DIVIDE([Total Sales], [Total Orders], 0)
Total Cost = SUM(Sales[cost])
Sales PY = CALCULATE([Total Sales], SAMEPERIODLASTYEAR('Calendar'[Date]))
Sales YoY % = DIVIDE([Total Sales] - [Sales PY], [Sales PY])
```
Format monetary measures as £ GBP, and margin/YoY measures as Percentage (1 or 2 decimal places).

## Step 5: Executive Overview page
Set Page size to 16:9 and title to **UK Retail Sales | Executive Overview**. Top KPI cards: Total Sales, Total Profit, Total Orders, Profit Margin %. Middle: line chart with Calendar[Year Month] on X and Total Sales on Y (sort ascending); clustered bar chart with Category on axis and Total Sales on values (sort descending). Bottom: regional clustered columns with Region and Total Sales/Total Profit; products top 5 bar chart using visual-level Top N filter by Total Sales. Add slicers for Calendar[Year], Sales[region], Sales[category], and Sales[segment].

## Step 6: Profitability & Trends page
Cards: Total Quantity, Average Order Value, Sales YoY %. Add a matrix with Category > Product rows and Total Sales, Total Profit, Profit Margin % values; add a line chart for Sales vs Sales PY by Calendar[Year Month], or create a separate yearly trend with Year. Use a scatter plot with Sales[product] details and Total Sales on X and Total Profit on Y. Add a region filter and a reset-filters bookmark button if desired.

## Step 7: Interactivity
Test each slicer. Use Format > Edit interactions to control whether slicers affect a specific visual. If desired, sync the Year slicer between pages using View > Sync slicers. Add helpful tooltips and clean visual titles.

## Step 8: Validation
With no filters, checks against CSV:
- Total Sales: **£1,601,846.50**
- Total Profit: **£415,491.52**
- Total Orders: **2,500**
- Profit Margin: **25.94%**
These checks assume imported sales values are not recomputed or rounded differently.

## Step 9: Portfolio delivery
Save as `UK_Retail_Sales_PowerBI.pbix` in Power BI Desktop. Export clean PDF screenshots if needed. In your portfolio mention source data is synthetic, describe business questions, transformations, DAX and interactive design, and give 3 specific findings after verifying them with your report. Native PBIX must be saved in Power BI Desktop; this package does not contain a PBIX file.

### Troubleshooting
- If DAX table name contains spaces, reference it as `'Sales Data'[sales]`, or rename table **Sales**.
- If monthly chart is not sorted chronologically, use Year Month rather than Month Name alone.
- If Sales PY gives blank for 2024, that is expected: there is no 2023 comparison data.
- If revenue is wrong, check field type and whether report filters are active.
