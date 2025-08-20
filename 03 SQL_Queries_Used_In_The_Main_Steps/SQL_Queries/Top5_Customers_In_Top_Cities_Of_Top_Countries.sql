-- Goal: List the TOP 5 customers (name, country, city) by total amount paid
-- Scope: Only consider customers in the TOP 10 cities of the TOP 10 countries (by customer count)

SELECT
    A.customer_id,
    A.first_name,
    A.last_name,
    D.country,
    C.city,
    SUM(P.amount) AS total_paid                  -- total paid by this customer
FROM customer A
INNER JOIN address  B ON A.address_id = B.address_id
INNER JOIN city     C ON B.city_id    = C.city_id
INNER JOIN country  D ON C.country_id = D.country_id
INNER JOIN payment  P ON A.customer_id = P.customer_id
WHERE C.city IN (
    -- Top 10 cities from the top 10 countries
    SELECT C.city
    FROM customer A
    INNER JOIN address B ON A.address_id = B.address_id
    INNER JOIN city    C ON B.city_id    = C.city_id
    INNER JOIN country D ON C.country_id = D.country_id
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
    LIMIT 10
)
GROUP BY A.customer_id, A.first_name, A.last_name, D.country, C.city
ORDER BY total_paid DESC
LIMIT 5;
