# Interview Preparation — Senior Data Analyst Portfolio

## 60-second project narrative
“I built a retail analytics case study on 2,500 synthetic orders spanning 2024 and 2025. I defined consistent revenue, profit, order and margin measures, then created a three-page Power BI report. The executive page answers what happened; the profitability page compares revenue scale with margin quality, including a Pareto ranking and category contribution; and the detail page allows managers to investigate individual products and transactions through drillthrough and tooltips. I reconciled summary KPIs against the source dataset, and treated actions like discount and cost review as testable recommendations rather than proven causes.”

## Likely interview questions and talking points
**Why three pages?** Distinct audiences and tasks: scan performance, diagnose profit drivers, inspect detailed evidence.

**How did you ensure KPI trust?** Unique-order count, typed dates, shared base measures, weighted margin, reconciled filtered totals to data.

**How does Pareto respond to filters?** Ranking and cumulative-sales percentages use ALLSELECTED(product) to preserve other slicer context. Test the final point is 100%.

**What did drillthrough add?** Product context passed from a high-level visual to a transaction-level view; easier to investigate without cluttering the executive page.

**What business insight stood out?** Technology had the highest sales, while Furniture achieved stronger margin; revenue alone would not tell the profitability story.

**What would you improve with real data?** Cost/discount drivers, returns, forecasting, data ownership, refresh monitoring, metric governance, stakeholder usability testing.

**What limitations matter?** Synthetic dataset and no causal experiment; findings are illustrative.

Avoid representing this independent practice project as a paid client engagement or production deployment.
