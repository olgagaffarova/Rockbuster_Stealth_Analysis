-- Goal: Average amount paid by the TOP 5 customers
-- Approach: nested subqueries to (1) get top countries, (2) top cities in those countries,
-- (3) compute total paid per customer in those cities, (4) take top 5 and average them.

SELECT AVG(total_amount_paid) AS average_amount_paid
FROM (
    SELECT
        A.customer_id,
        A.first_name,
        A.last_name,
        D.country,
        C.city,
        SUM(P.amount) AS total_amount_paid            -- total paid by this customer
    FROM customer A
    INNER JOIN address  B ON A.address_id = B.address_id
    INNER JOIN city     C ON B.city_id    = C.city_id
    INNER JOIN country  D ON C.country_id = D.country_id
    INNER JOIN payment  P ON A.customer_id = P.customer_id
    WHERE C.city IN (
        -- Top 10 cities within the top 10 countries (by customer count)
        SELECT C.city
        FROM customer A
        INNER JOIN address B ON A.address_id = B.address_id
        INNER JOIN city    C ON B.city_id    = C.city_id
        INNER JOIN country D ON C.country_id = D.country_id
        WHERE D.country IN (
            -- Top 10 countries by customer count
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
    ORDER BY total_amount_paid DESC
    LIMIT 5
) AS top5;
