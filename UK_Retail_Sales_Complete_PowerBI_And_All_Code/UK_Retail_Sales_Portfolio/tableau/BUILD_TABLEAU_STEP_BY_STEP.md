# Project 5 — UK Retail Sales Analytics in Tableau

Original practice project using synthetic UK retail sales transactions (2024–2025). Recreate in Tableau Desktop Public Edition or Tableau Desktop. Save as `UK_Retail_Sales_Tableau.twbx` using Tableau's packaged workbook save option.

## 1. Connect and audit
- Tableau > Connect > Text File > `sales_data.csv`
- Name the data source `UK Retail Sales`.
- Set `order_date` to Date, `order_id` and `customer_id` to String, `quantity` to Number (Whole), and `sales`, `cost`, `profit`, `unit_price`, `discount` to Number (Decimal).
- Verify 2,500 unique orders and date range 2024-01-01 to 2025-12-31.

## 2. Calculated fields
Create one field for each expression below:

**Total Revenue**
```
SUM([sales])
```
**Total Profit**
```
SUM([profit])
```
**Total Orders**
```
COUNTD([order_id])
```
**Profit Margin**
```
IF SUM([sales]) != 0 THEN SUM([profit]) / SUM([sales]) END
```
**Average Order Value**
```
IF COUNTD([order_id]) != 0 THEN SUM([sales]) / COUNTD([order_id]) END
```
**Order Year**
```
YEAR([order_date])
```
**Order Month**
```
DATETRUNC('month', [order_date])
```

Format Total Revenue, Total Profit and Average Order Value as GBP; Profit Margin as percentage. The Total Revenue and Profit fields are aggregate calculations, so don't sum them again.

## 3. KPI worksheets
Create separate worksheets named `KPI Revenue`, `KPI Profit`, `KPI Orders`, `KPI Margin`:
- Drag the corresponding calculated field to Marks > Text.
- Align centre; add an informative worksheet title.
- Expected unfiltered: revenue £1,601,846.50; profit £415,491.52; orders 2,500; margin 25.94%.

## 4. Charts
**Monthly Revenue:** `MONTH([order_date])` as a *continuous month/date* (not month-of-year alone) on Columns; `SUM([sales])` on Rows; Marks Line. Covers Jan 2024–Dec 2025. Alternatively place `Order Month` on Columns and set it continuous.

**Revenue by Category:** `category` on Rows and `SUM([sales])` on Columns; Marks Bar; descending sort. Technology £928,057.25, Furniture £627,517.25, Office Supplies £46,272.00.

**Regional Revenue and Profit:** `region` on Rows; Measure Values on Columns; retain only `SUM([sales])` and `SUM([profit])`; put Measure Names on Color. North £584,072.60 revenue.

**Top 5 Products:** `product` on Rows; `SUM([sales])` on Columns; apply a Top tab filter for top 5 by SUM(sales); sort descending.

**Category Margin:** `category` on Rows; `Profit Margin` on Columns; Marks Bar; sort descending.

**Product Detail:** `category` then `product` on Rows; Measure Values as columns for SUM(sales), SUM(profit), and Profit Margin. Use Measure Names and Measure Values to construct the table.

## 5. Executive Overview dashboard
- Create Dashboard, size 1366 x 768 (fixed desktop layout).
- Title `UK Retail | Executive Sales Overview`.
- Use a vertical container: title; 4 KPI tiles in a horizontal container; monthly sales line chart; two charts side-by-side (category, regional).
- Add Year, Region and Category slicer-like filter cards: show `order_date` (years), `region`, `category` filters on one worksheet. In filter card menu choose `Apply to Worksheets > All Using This Data Source`.
- Click any chart on the dashboard and use **Use as Filter** if helpful.

## 6. Profitability dashboard
- Title `Product Profitability & Opportunities`.
- Add Category Margin, Top 5 Products, and Product Detail worksheets.
- Add Region and Year filters and apply to all sheets using the same data source.
- Add a brief text box noting that low revenue isn't automatically low profitability, so assess both profit margin and sales volume.

## 7. Validation
- With all filters cleared, verify exactly 2,500 orders, £1,601,846.50 in revenue, £415,491.52 profit, margin 25.94%.
- Filtering to Technology must change category-level visuals, KPIs and totals consistently.
- Use chronological month-year rather than aggregating January 2024 and January 2025 together.
- Check numeric types if SUM or axis marks look wrong.

## 8. Save and showcase
- Save locally as `UK_Retail_Sales_Tableau.twbx` (packaged workbook) if your edition permits.
- For Tableau Public, Server > Tableau Public > Save to Tableau Public; published workbooks and data are public. Use only this synthetic dataset, never customer-confidential records.
- Export a screenshot for a GitHub README and explain the business question, methodology, KPIs, findings, and design choices.

## Storytelling prompts
- Which categories account for most revenue?
- Which region is strongest? Why might revenue and profit rank differently?
- Which top products also have healthy profit margins?
- Are month-to-month patterns consistent across 2024 and 2025?

This starter kit does NOT include a native .twbx file; build that in Tableau using these steps.
