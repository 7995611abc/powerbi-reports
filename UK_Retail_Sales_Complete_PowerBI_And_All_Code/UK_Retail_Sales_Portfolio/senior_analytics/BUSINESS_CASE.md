# Decision memo — profitable growth (synthetic UK retail data)

## Executive summary
Across 2,500 transactions (2024–2025), revenue is £1,601,846.50, profit £415,491.52, and margin 25.94%.

## Findings
| category        |     sales |    profit |   margin_pct |
|:----------------|----------:|----------:|-------------:|
| Technology      | 928057.25 | 209121.45 |        22.53 |
| Furniture       | 627517.25 | 185891.35 |        29.62 |
| Office Supplies |  46272.00 |  20478.72 |        44.26 |

**Technology leads on revenue**, but **Furniture has a higher profit margin** (approximately 29.6% versus 22.5%). Office Supplies is small by revenue but has a high margin percentage; beware comparing contribution and rate without volume. North contributes the largest absolute sales (£584,072.60).

## Recommendations (hypotheses for testing, not causal findings)
1. Investigate whether shifting merchandising toward high-margin Furniture SKUs could improve profit without sacrificing demand.
2. Audit discounting and unit economics in Technology before recommending further growth.
3. Compare product mix and inventory availability across regions, controlling for store footprint and customer base (not represented in this dataset).
4. Define governed KPI specifications and row-level reconciliation tests before operational use.

## Limitations
Synthetic practice data, no store targets, stock, returns, acquisition costs or experimental evidence. These recommendations need real-world validation.
