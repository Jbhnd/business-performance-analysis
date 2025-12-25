-- File: customer_analysis.sql
-- Customer lifetime value and customer segmentation

-- Export results
.mode csv
.headers on

-- Export customer lifetime value
.output data/customer_lifetime_value.csv

-- Customer lifetime value
SELECT customer_id, SUM(sales) AS lifetime_value
FROM cleaned_orders
GROUP BY customer_id
ORDER BY lifetime_value DESC;


-- Export customer segments
.output data/customer_segments.csv

-- Customer segmentation (High / Medium / Low)
WITH customer_revenue AS (
    SELECT customer_id, SUM(sales) AS total_spent
    FROM cleaned_orders
    GROUP BY customer_id
)
SELECT customer_id, total_spent,
    CASE
        WHEN total_spent >= 5000 THEN 'High Value'
        WHEN total_spent >= 2000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customer_revenue
ORDER BY total_spent DESC;

.output