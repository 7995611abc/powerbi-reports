# Capture professional dashboard screenshots

1. Open `UK_Retail_Sales_Enhanced.pbix` in Power BI Desktop and save.
2. Reset slicers to a well-described default state, preferably all years and all regions/categories. Verify totals.
3. Switch to each main page; select View > Page view > Fit to page (or equivalent zoom option), hide unneeded panes, and ensure labels are legible.
4. On Windows, press **Win + Shift + S**, select the report canvas (avoid title bar and right-hand panes), and save a PNG named `01_executive_overview.png`. Repeat for `02_profitability_drivers.png` and `03_detailed_exploration.png`. Aim for approximately 1920×1080 capture if your display supports it.
5. For drillthrough capture, right-click a product in a source visual, select Drillthrough > Product Drillthrough, then capture `04_product_drillthrough.png` with product context clearly visible. Capture a tooltip with your pointer over a product, if useful.
6. Export a portable report from Power BI Desktop via **File > Export > Export to PDF**. Hidden/tooltip pages do not appear in the standard Desktop export. Name it `UK_Retail_Sales_Report.pdf`.
7. Inspect the PNGs at 100%: no cropped chart titles, tiny legends, wrong month order, unreadable table text, overlapping cards, or blank custom visuals.
8. Copy PNGs to `screenshots/`, PDF to `exports/` (optional), and the completed `.pbix` to a `powerbi/` folder before GitHub upload.

**Important:** A PDF or screenshot is a static representation. Drillthrough, hover tooltips and slicer interactions must be demonstrated in the `.pbix` or a legitimately published interactive report.
