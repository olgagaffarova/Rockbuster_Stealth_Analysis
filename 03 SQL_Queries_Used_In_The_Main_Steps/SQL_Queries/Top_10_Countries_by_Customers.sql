-- Select the country name and count how many customers are in each country
SELECT 
    D.country, 
    COUNT(A.customer_id) AS customer_count

-- Start from the customer table (alias A)
FROM customer A

-- Join with address table (alias B) to connect customers to their addresses
INNER JOIN address B 
    ON A.address_id = B.address_id

-- Join with city table (alias C) to connect addresses to cities
INNER JOIN city C 
    ON B.city_id = C.city_id

-- Join with country table (alias D) to connect cities to countries
INNER JOIN country D 
    ON C.country_id = D.country_id

-- Group the results by country so we can count customers per country
GROUP BY D.country

-- Sort the results in descending order of customer count
ORDER BY customer_count DESC

-- Limit the output to the top 10 countries
LIMIT 10;
