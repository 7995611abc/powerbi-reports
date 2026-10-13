# Senior Data Analyst interview — case-study answer bank

## 45-second walkthrough
“This is a self-directed practice project using 2,500 synthetic UK retail orders. I built consistent sales/profit KPIs across SQL, Excel, Python, Power BI and Tableau and explored revenue, product mix and regions. Revenue totalled £1,601,846.50, profit £415,491.52, and margin 25.94%. Technology led revenue, but Furniture generated a higher margin percentage. The useful lesson was separating absolute contribution from margin rate, and documenting data-quality assumptions. This is portfolio work, not an implemented production solution.”

## What stakeholders would you ask first?
What decision must the analysis support? How are revenue, returns, discounts, time periods and margin defined? What trade-offs matter, and what action is feasible?

## How would you govern the semantic layer?
Define revenue and profit once, centralise date and category dimensions, set metric ownership, enforce data tests, record lineage and align BI tools on definitions. Explain that the current exercise does not itself demonstrate an enterprise semantic layer deployment.

## What does the data not prove?
That driving Furniture sales causes higher profit or that North performs better after adjustment for stores, traffic or market size. Observational aggregate data does not prove causation.

## How would you productionise?
Ingest raw data, establish schema contracts, automate validation and reconciliation, build governed fact/dimension model, publish tested measures, implement role-based access, monitor refresh quality, and gather stakeholder feedback.

## How do you reconcile conflicting reports?
Check filters, time boundaries, granularity, date logic, distinct order IDs, currency, missing/returned orders and allocation logic; then compare record-level exceptions.

## What was your contribution?
Describe specifically what you built and understood. Do not present synthetic practice outputs as outcomes from an actual employer.
