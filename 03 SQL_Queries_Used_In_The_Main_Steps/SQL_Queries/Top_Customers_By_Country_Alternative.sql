-- Find how many "top" customers (paid above average) are in each country
SELECT 
    d.country, 
    COUNT(DISTINCT a.customer_id) AS all_customer_count, -- total customers
    COUNT(DISTINCT CASE 
        WHEN (
            (SELECT SUM(p2.amount) 
             FROM payment p2 
             WHERE p2.customer_id = a.customer_id)
        ) > (
            SELECT AVG(total_sum) 
            FROM (
                SELECT SUM(p.amount) AS total_sum
                FROM payment p
                GROUP BY p.customer_id
            ) AS customer_totals
        ) 
        THEN a.customer_id 
    END) AS top_customer_count -- only keep customers who paid above average
FROM customer a
JOIN address b ON a.address_id = b.address_id
JOIN city c ON b.city_id = c.city_id
JOIN country d ON c.country_id = d.country_id
GROUP BY d.country
ORDER BY top_customer_count DESC
LIMIT 10;
