# Website review and publish checklist

The original `website/index.html` is included. It is a stand-alone HTML interactive dashboard. It contains data embedded in the HTML, so GitHub Pages can serve it without a backend.

## Review before publishing
- Open it locally; check year, region and category filters and compare KPI totals after clearing filters.
- Test on both phone and desktop for text overflow, chart legibility and navigation.
- Ensure no claim that synthetic data reflects actual UK retail trading.
- Add genuine screenshots of Power BI / Tableau only if you exported them yourself.
- Run accessibility checks: color contrast, keyboard tab order, captions and alternative descriptions.
- Do not upload private customer data.

## Hosting
Copy `website/index.html` to repository root `index.html`; in GitHub Settings → Pages choose Deploy from a branch → main → /(root).

## Honest scope
This is a review checklist, not proof of a full browser regression test. Interactive controls were not independently verified in Chrome/Edge in this run.
