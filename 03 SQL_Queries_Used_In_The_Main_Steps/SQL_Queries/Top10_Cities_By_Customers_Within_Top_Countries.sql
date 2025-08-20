-- Goal: Show the TOP 10 cities (and their countries) with the most customers
-- Constraint: Only consider cities that belong to the TOP 10 countries (by customer count)

SELECT
    C.city,
    D.country,
    COUNT(A.customer_id) AS count_of_customers     -- number of customers in this city
FROM customer A
INNER JOIN address  B ON A.address_id = B.address_id
INNER JOIN city     C ON B.city_id    = C.city_id
INNER JOIN country  D ON C.country_id = D.country_id
WHERE D.country IN (
    -- Top 10 countries by number of customers
    SELECT D.country
    FROM customer A
    INNER JOIN address B ON A.address_id = B.address_id
    INNER JOIN city    C ON B.city_id    = C.city_id
    INNER JOIN country D ON C.country_id = D.country_id
    GROUP BY D.country
    ORDER BY COUNT(A.customer_id) DESC
    LIMIT 10
)
GROUP BY D.country, C.city
ORDER BY COUNT(A.customer_id) DESC
LIMIT 10;
