from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt

BASE = Path(__file__).resolve().parent
df = pd.read_csv(BASE / "sales_data.csv", parse_dates=["order_date"])
assert df["order_id"].is_unique
assert df[["order_date", "sales", "profit"]].notna().all().all()
print("Orders:", df["order_id"].nunique())
print("Revenue:", round(df["sales"].sum(), 2))
print("Profit:", round(df["profit"].sum(), 2))
print("Profit margin:", round(100*df["profit"].sum()/df["sales"].sum(), 2), "%")
monthly = df.groupby(df["order_date"].dt.to_period("M"))["sales"].sum()
category = df.groupby("category")["sales"].sum().sort_values(ascending=False)
monthly.index = monthly.index.astype(str)
ax = monthly.plot(kind="line", figsize=(11,5), title="Monthly revenue", marker="o")
ax.set_xlabel("Month");ax.set_ylabel("Revenue (£)");plt.xticks(rotation=60);plt.tight_layout()
plt.savefig(BASE / "monthly_revenue.png", dpi=150);plt.close()
ax = category.plot(kind="bar", figsize=(8,5), title="Revenue by category")
ax.set_ylabel("Revenue (£)");plt.xticks(rotation=0);plt.tight_layout()
plt.savefig(BASE / "category_revenue.png",dpi=150);plt.close()
