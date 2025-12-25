# Business Performance Analysis – Superstore Sales

## 1. Project Overview
This project is an **end-to-end business performance analysis** of a retail dataset. The goal is to identify **revenue trends, top products, high-value customers, and regional performance**. Insights are presented through **SQL queries, Python visualizations, and a Tableau dashboard**.  

**Key Skills Demonstrated:** SQL (data cleaning, aggregation, window functions), Python (Pandas, Seaborn, Matplotlib), Tableau, data storytelling.

---

## 2. Business Questions
The project aims to answer the following questions:

1. How is revenue trending monthly and yearly?  
2. Which products and categories drive the most revenue?  
3. Which regions are underperforming?  
4. Who are the most valuable customers?  
5. Are we growing or declining overall?  

---

## 3. Tools Used
- **SQL:** SQLite for data cleaning and analysis  
- **Python:** Pandas, Matplotlib, Seaborn for EDA and visualization  
- **Tableau:** Executive dashboard creation  
- **GitHub:** Version control and portfolio presentation  

---

## 4. Data Cleaning & Preparation
- Raw dataset: `data/raw_superstore.csv`  
- Cleaned dataset: `data/cleaned_superstore.csv`  
- Key cleaning steps (via `sql/data_cleaning.sql`):

  - Removed duplicates and rows with null order dates  
  - Eliminated negative or zero sales and quantity  
  - Standardized category, sub-category, and region text  
  - Added a `order_month` column for trend analysis  

---

## 5. Core Analysis

### Revenue Trends
- **Monthly revenue** shows steady growth with seasonal peaks at year-end.  
- **Month-over-month growth** highlights periods of faster expansion and slower growth.  

### Top Products & Categories
- Top 10 products account for a large portion of total revenue.  
- 3D systems cube printer is the highest sold product.  

### Regional Performance
- The **West region** is the highest performing, while the South underperforms, indicating growth opportunities.  

### Customer Analysis
- Customer segmentation identifies focus areas for retention and marketing.  
- Each high-value customer (top 15% by lifetime revenue) generates on average ~2x the revenue of customers in other sections. 

---

## 6. Dashboard Preview

![Dashboard Screenshot](<img width="1099" height="799" alt="SUPERSTORE SALES" src="https://github.com/user-attachments/assets/36c96375-0eb9-49f6-8a46-4c50c2258591" />)

**Dashboard Features:**
- Executive KPIs: Total Revenue, Top Product, Top Region
- Revenue Trend Line 
- Month-over-Month Growth
- Top 5 Products 
- Revenue by Region
- Customer Segments Revenue 

---

## 7. Project Folder Structure

```

business-performance-analysis/
│
├── sql/
│   ├── data_cleaning.sql
│   ├── revenue_analysis.sql
│   └── customer_analysis.sql
│
├── python/
│   └── eda.ipynb
│
├── dashboard/
│   └── dashboard_screenshot.png
│
├── data/
│   ├── raw_superstore.csv
│   ├── cleaned_superstore.csv
│   ├── monthly_revenue.csv
│   ├── mom_revenue.csv
│   ├── top_products.csv
│   ├── revenue_by_region.csv
|   ├── customer_lifetime_value.csv
│   └── customer_segments.csv
│
└── README.md

```

---

## 8. How to Reproduce
1. Load `raw_superstore.csv` into your SQL database.  
2. Run `data_cleaning.sql` to create `cleaned_orders`.  
3. Execute `revenue_analysis.sql` and `customer_analysis.sql` to generate results CSVs.  
4. Run `eda.ipynb` for Python visualizations.  
5. Connect Tableau to CSVs (or SQLite DB) and build dashboard.
