-- FILE: data_cleaning.sql
-- Clean superstore sales dataset

-- Drop existing cleaned_orders table
DROP TABLE IF EXISTS cleaned_orders;

-- Remove duplicates and keep only valid orders
CREATE TABLE cleaned_orders AS
SELECT DISTINCT
    "order id" as order_id,
    "customer id" as customer_id,
    "order date" as order_date,
    "product name" as product_name,
    "category" as category,
    "sub-category" as sub_category,
    "region" as region,
    "sales" as sales
FROM orders
WHERE "order date" IS NOT NULL;

-- Add order month column
-- ALTER TABLE cleaned_orders
-- ADD COLUMN order_month DATE
ALTER TABLE cleaned_orders
ADD COLUMN order_month TEXT;

-- UPDATE cleaned_orders
-- SET order_month = DATE_TRUNC('month', order_date);
UPDATE cleaned_orders
SET order_month =
  strftime(
    '%Y-%m-01',
    substr(order_date, instr(order_date, '/') + 1 + instr(substr(order_date, instr(order_date, '/') + 1), '/'), 4) || '-' ||
    printf('%02d', substr(order_date, instr(order_date, '/') + 1, instr(substr(order_date, instr(order_date, '/') + 1), '/') - 1)) || '-' ||
    printf('%02d', substr(order_date, 1, instr(order_date, '/') - 1))
  );

/*UPDATE cleaned_orders
SET order_month =
  strftime(
    '%d/%m/%Y',
    substr(order_date, instr(order_date, '/') + 1 + instr(substr(order_date, instr(order_date, '/') + 1), '/'), 4) || '-' ||
    printf('%02d', substr(order_date, instr(order_date, '/') + 1, instr(substr(order_date, instr(order_date, '/') + 1), '/') - 1)) || '-01'
  );*/

-- Export cleaned_orders
.mode csv
.headers on
.output data/cleaned_superstore.csv
SELECT * FROM cleaned_orders;
.output