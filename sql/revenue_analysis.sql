-- FILE: revenue_analysis.sql
-- Revenue trends and top products analysis

-- Export results
.mode csv
.headers on

-- Export monthly revenue
.output data/monthly_revenue.csv

-- Total revenue by month
SELECT order_month, SUM(sales) AS total_revenue
FROM cleaned_orders
GROUP BY order_month
ORDER BY order_month;


-- Export month over month(MoM) revenue growth
.output data/mom_revenue.csv

-- Month-over-month(MoM) revenue growth
WITH monthly_revenue AS (
    SELECT
        order_month,
        SUM(sales) AS revenue
    FROM cleaned_orders
    GROUP BY order_month
)

SELECT
    order_month,
    revenue,
    LAG(revenue) OVER (ORDER BY order_month) AS prev_month_revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY order_month))
        / LAG(revenue) OVER (ORDER BY order_month) * 100,
        2
    ) AS mom_growth_pct
FROM monthly_revenue
ORDER BY order_month;


-- Export top 10 products by revenue
.output data/top_products.csv

-- Top 10 products by revenue
SELECT product_name, SUM(sales) AS total_revenue
FROM cleaned_orders
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;


-- Export revenue by region
.output data/revenue_by_region.csv

-- Revenue by region
SELECT region, SUM(sales) AS total_revenue
FROM cleaned_orders
GROUP BY region
ORDER BY total_revenue DESC;


.output