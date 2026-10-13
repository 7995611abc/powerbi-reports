"""Run from repository root: python senior_analytics/analyze_senior.py"""
from pathlib import Path
import pandas as pd
p=Path(__file__).resolve().parents[1] / 'data/sales_data.csv'
df=pd.read_csv(p,parse_dates=['order_date'])
assert df.order_id.is_unique, 'Duplicate order_id'
assert df.notna().all().all(), 'Missing values'
assert ((df.sales-df.cost-df.profit).abs()<.021).all(), 'Profit equation mismatch'
category=df.groupby('category').agg(revenue=('sales','sum'),profit=('profit','sum'),orders=('order_id','nunique'))
category['profit_margin_pct']=100*category['profit']/category['revenue']
print(category.sort_values('revenue',ascending=False).round(2).to_string())
print(f'\nTotal sales: £{df.sales.sum():,.2f}; total profit: £{df.profit.sum():,.2f}')
