# Power BI: Professional three-page dashboard build

**Source**: `data/sales_data.csv` (2,500 transactions, 2024–2025). **Not a .pbix file.**

## Model first
1. Home > Get data > Text/CSV; choose `data/sales_data.csv`, then Transform Data.
2. Name the table `Sales`; set `order_date` to Date, numerical fields to decimal/integer, identifiers to Text. Close & Apply.
3. Enter `CALENDAR_TABLE.dax` one expression at a time. Mark `Calendar[Date]` as Date table. Make a 1:* single-direction relationship Calendar[Date] → Sales[order_date].
4. Create individual DAX measures from `POWER_BI_KPI_MEASURES.dax` with Modeling > New measure. Format sales/profit/cost as £; margin and growth as percentages.
5. Verify full-data cards: Total Sales **£1,601,846.50**; Total Profit **£415,491.52**; Total Orders **2,500**; Profit Margin **25.94%**; AOV **£640.74**; YoY Sales Growth (2025 context) **+2.87%**.

## Page 1: Executive Overview — 16:9 canvas
- Header: "UK Retail | Executive Sales Overview"; slicers: Year, Region, Category, Segment.
- Top row: six cards: Total Sales, Total Profit, Total Orders, Profit Margin %, Average Order Value, Sales YoY %.
- Mid-left (wide): Line chart. X = Calendar[Year Month], Y = Total Sales. Sort Year Month by Year Month Sort; continuous month-date axis is also valid.
- Mid-right: Horizontal bar. Y = Sales[category]; X = Total Sales; descending. Put Profit Margin % in Tooltip.
- Lower-left: Clustered column. X = Sales[region], Y = Total Sales and Total Profit (same £ unit). For easy margin comparison, add margin to tooltip or use a separate chart, not an unlabelled second axis.
- Lower-right: Horizontal Top 10 Products. Y = Sales[product]; X = Total Sales; apply visual Top N filter by Total Sales; add profit and margin in tooltip.
- Make category and region charts "Use as filter" with Format > Edit interactions (Power BI behaviour depends on visual type).

## Page 2: Profitability & Drivers
- Cards: Total Profit, Profit Margin %, Average Profit per Order, Units Sold.
- Bar chart: Sales[category] vs Profit Margin %.
- Scatter plot: X = Total Sales; Y = Profit Margin %; Size = Total Orders; Details = Sales[product] (if Power BI version labels this field 'Values', add product there); tooltip = Total Profit, Orders.
- Bar chart: Sales[region] vs Profit Margin %.
- Top/Bottom product table: Product, Sales, Profit, Profit Margin %, Product Rank by Sales. Conditional formatting highlights low margin products.
- Optional waterfall: Category as Category, Total Profit as Y to show category contributions; NOT a 2024-to-2025 growth bridge unless using proper change drivers.

## Page 3: Detailed Exploration
- Matrix: Rows Category → Product; Columns Region; Values Sales, Profit and Profit Margin %.
- Slicers: Date, Segment, Region. Add drillthrough filters for Product/Region in a dedicated drillthrough page if desired.
- Tooltip page for Product: Sales, Profit, Orders, Margin, monthly sales mini-line.

## KPI storytelling flow
Headline performance → time trend → segment contributors → margin quality → product drilldown → decision actions.

## Style
- Background #F5F8FB; card white; title #132D4E.
- Blue #236EAC = sales; Teal #0B967E = profit; Amber #E3A244 = margin/attention.
- Use GBP thousands/millions, restrained decimal places, informative titles, and a source/data disclaimer.

## Validation and limitations
- Measures aggregate existing transaction fields. **Profit is the dataset's `profit` field**, not necessarily accounting net profit.
- Ensure KPI totals match Excel/SQL/Python before applying filters.
- YoY is valid when a single year such as 2025 is in context; for all-years total, a YoY card may be misleading. Add a default Year slicer at 2025 for YoY analysis, or label the context.
- Avoid claiming causal explanations from these synthetic transactions.
- Visual references: `visuals/executive_overview_preview.png` and `visuals/profitability_preview.png` are generated previews, NOT screenshots of a real PBIX.
