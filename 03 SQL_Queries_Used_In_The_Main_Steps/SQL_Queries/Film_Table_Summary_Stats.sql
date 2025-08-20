-- Summarize statistics from the film table
SELECT 
    COUNT(*) AS count_rows,                   -- total number of rows
    MIN(release_year) AS min_release_year,    -- earliest release year
    MAX(release_year) AS max_release_year,    -- latest release year
    COUNT(release_year) AS count_release_year, -- number of release_year records
    MIN(rental_duration) AS minimum_rental_duration, -- shortest rental duration
    MAX(rental_duration) AS maximum_rental_duration, -- longest rental duration
    AVG(rental_duration) AS average_rental_duration, -- average rental duration
    COUNT(rental_duration) AS count_rental_duration, -- number of rental_duration records
    MIN(rental_rate) AS minimum_rental_rate,  -- lowest rental rate
    MAX(rental_rate) AS maximum_rental_rate,  -- highest rental rate
    AVG(rental_rate) AS average_rental_rate,  -- average rental rate
    COUNT(rental_rate) AS count_rental_rate,  -- number of rental_rate records
    MIN(length) AS minimum_film_length,       -- shortest film
    MAX(length) AS maximum_film_length,       -- longest film
    AVG(length) AS average_film_length,       -- average film length
    COUNT(length) AS count_film_length,       -- number of length records
    MIN(replacement_cost) AS minimum_replacement_cost, -- lowest replacement cost
    MAX(replacement_cost) AS maximum_replacement_cost, -- highest replacement cost
    AVG(replacement_cost) AS average_replacement_cost, -- average replacement cost
    COUNT(replacement_cost) AS count_replacement_cost  -- number of replacement_cost records
FROM film;
