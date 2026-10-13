# Build It Yourself — Tutorial-Inspired Step-by-Step Project

**Important:** This project follows a common five-tool portfolio workflow, not a verified scene-by-scene transcription of the video. Use it as your own original case study and disclose that the dataset is synthetic.

## 0. Project setup (30 min)
1. Extract the ZIP and place the folder somewhere permanent.
2. Review `sales_data.csv` and `README.md`.
3. Define questions: What are sales/profit trends? Which region/category/product performs best? Do discounts affect profitability?
4. Data dictionary: `order_id` unique transaction key; `order_date` date; `customer_id` simulated repeat customer; `segment` segment; `region` and `city` location; `category` and `product` merchandise; `quantity`, `unit_price`, `discount` inputs; `sales`, `cost`, `profit` modeled GBP outcomes.

## 1. Excel (about 2 hours)
1. Open `Sales_Analytics_Dashboard.xlsx` and inspect `Sales Data` for 2,500 transactions.
2. Confirm order ID uniqueness, date formatting, blank fields and negative values.
3. Add your own PivotTables from Sales Data: category by revenue, region by profit, months by sales.
4. Examine the existing `Dashboard` KPIs and charts; verify the overall revenue and profit against `summary.json`.
5. For more interactivity add PivotCharts and slicers for `region`, `segment`, `category` and date.
6. Write three findings in your own words and save a dashboard screenshot.

## 2. SQL (about 2 hours)
1. Open `sales_portfolio.sqlite` in DB Browser for SQLite.
2. Inspect `sales` with `SELECT * FROM sales LIMIT 10;`.
3. Run each query in `analysis.sql` individually (separate with semicolons).
4. Practice `GROUP BY`, `ORDER BY`, `CASE`, `HAVING` and date grouping.
5. Validate SUM(sales), SUM(profit) and COUNT(DISTINCT order_id) against the Excel dashboard.
6. Document one query per business question and screenshot the output.

## 3. Python (about 2 hours)
1. In a terminal inside the project folder run: `python -m pip install -r requirements.txt`.
2. Run: `python analyze_sales.py`.
3. Examine `monthly_revenue.png` and `category_revenue.png`.
4. Modify the analysis to calculate category margin, repeat customer count and highest-revenue month.
5. Explain any mismatch between Excel and Python aggregates before proceeding.

## 4. Power BI Desktop (about 2 hours)
1. Home → Get Data → Text/CSV → import `sales_data.csv` and name the table `Sales`.
2. Set `order_date` to Date, `quantity` to Whole Number, `discount` to Decimal Number, and money fields to Decimal Number.
3. Create a Date table using: `Date = CALENDAR(MIN(Sales[order_date]), MAX(Sales[order_date]))`.
4. Create a one-to-many relationship from Date[Date] to Sales[order_date]; mark Date as the date table.
5. Add the measure formulas in `power_bi_measures.dax` one at a time via Modeling → New measure.
6. Layout: top KPI cards (Revenue, Profit, Orders, Margin); middle monthly trend and regional profit; bottom category breakdown and top 10 products.
7. Add slicers for Year, Region, Segment and Category. Format monetary values as £; percentages as %.
8. Test the filters, compare unfiltered totals to `summary.json`, then save your `.pbix` file locally. A native PBIX is not included in this package.

## 5. Tableau (about 1.5 hours)
1. Connect → Text File → `sales_data.csv`; confirm data types.
2. Build calculated fields from `tableau_calculations.txt`.
3. Create worksheets: Monthly Revenue (Month date + SUM(sales)), Regional Revenue, Profit by Category, Top Products, Sales by Segment.
4. Create a dashboard at ~1200×800 pixels with KPI tiles, trend line, bar charts and consistent colour choices.
5. Set Region and Segment filters to apply to all relevant worksheets.
6. Check totals against SQL and export a dashboard image; save a packaged `.twbx` locally. A native TWBX is not included in this package.

## 6. Portfolio polish (about 1 hour)
1. Use `EXECUTIVE_INSIGHTS.md` as the basis of a concise business summary, but rewrite the insights in your own voice.
2. Upload code, CSV, dashboard screenshots and documentation to a GitHub repository.
3. Lead your portfolio page with the question, approach, screenshots and 3 evidence-based recommendations.
4. State clearly that this is a synthetic, tutorial-inspired independent project; do not present data as real customer transactions.

## Final quality checklist
- [ ] All tools agree on revenue, profit and order count.
- [ ] Excel chart labels and dates are readable.
- [ ] SQL includes validation, trends and rankings.
- [ ] Python runs on a fresh machine with requirements installed.
- [ ] Power BI and Tableau dashboard filters work.
- [ ] Screenshots, business findings and limitations are documented.
