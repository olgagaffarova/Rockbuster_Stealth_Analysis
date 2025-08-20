-- Step 1: Calculate the total amount paid by each customer with their details
WITH customer_payments AS (
    SELECT 
        A.customer_id,
        A.first_name,
        A.last_name,
        D.country,
        C.city,
        SUM(P.amount) AS total_amount_paid -- total amount paid by customer
    FROM customer A
    JOIN address B ON A.address_id = B.address_id
    JOIN city C ON B.city_id = C.city_id
    JOIN country D ON C.country_id = D.country_id
    JOIN payment P ON A.customer_id = P.customer_id
    GROUP BY A.customer_id, A.first_name, A.last_name, D.country, C.city
),
-- Step 2: Get top 10 countries by number of customers
top_countries AS (
    SELECT D.country
    FROM customer A
    JOIN address B ON A.address_id = B.address_id
    JOIN city C ON B.city_id = C.city_id
    JOIN country D ON C.country_id = D.country_id
    GROUP BY D.country
    ORDER BY COUNT(A.customer_id) DESC
    LIMIT 10
),
-- Step 3: Get top 10 cities within these countries
top_cities AS (
    SELECT C.city
    FROM customer A
    JOIN address B ON A.address_id = B.address_id
    JOIN city C ON B.city_id = C.city_id
    JOIN country D ON C.country_id = D.country_id
    WHERE D.country IN (SELECT country FROM top_countries)
    GROUP BY D.country, C.city
    ORDER BY COUNT(A.customer_id) DESC
    LIMIT 10
),
-- Step 4: From the top cities, find top 5 customers by amount paid
top_customers AS (
    SELECT *
    FROM customer_payments
    WHERE city IN (SELECT city FROM top_cities)
    ORDER BY total_amount_paid DESC
    LIMIT 5
)
-- Step 5: Calculate the average payment of these top 5
SELECT 
    AVG(total_amount_paid) AS average_amount_paid
FROM top_customers;
