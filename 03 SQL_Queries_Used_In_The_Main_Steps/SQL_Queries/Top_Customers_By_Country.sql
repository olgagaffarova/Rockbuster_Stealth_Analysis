-- Step 1: Calculate total amount paid by each customer
WITH customer_totals AS (
    SELECT 
        p.customer_id,
        SUM(p.amount) AS total_sum
    FROM payment p
    GROUP BY p.customer_id
),
-- Step 2: Find average total amount paid across all customers
avg_total_payment AS (
    SELECT AVG(total_sum) AS avg_payment
    FROM customer_totals
),
-- Step 3: Identify top customers (paid above average)
top_customers AS (
    SELECT ct.customer_id
    FROM customer_totals ct
    CROSS JOIN avg_total_payment atp
    WHERE ct.total_sum > atp.avg_payment
),
-- Step 4: Link customers to their countries
customer_country AS (
    SELECT 
        a.customer_id,
        d.country
    FROM customer a
    JOIN address b ON a.address_id = b.address_id
    JOIN city c ON b.city_id = c.city_id
    JOIN country d ON c.country_id = d.country_id
),
-- Step 5: Count all vs top customers per country
country_stats AS (
    SELECT 
        cc.country,
        COUNT(DISTINCT cc.customer_id) AS all_customer_count,
        COUNT(DISTINCT tc.customer_id) AS top_customer_count
    FROM customer_country cc
    LEFT JOIN top_customers tc ON cc.customer_id = tc.customer_id
    GROUP BY cc.country
)
-- Step 6: Return top 10 countries by top customer count
SELECT 
    country,
    all_customer_count,
    top_customer_count
FROM country_stats
ORDER BY top_customer_count DESC
LIMIT 10;
