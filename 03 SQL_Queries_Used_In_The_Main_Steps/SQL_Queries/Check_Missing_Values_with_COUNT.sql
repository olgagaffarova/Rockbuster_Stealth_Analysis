-- Count total records in the film table
-- Then calculate missing values for each column as:
--   COUNT(*) - COUNT(column) → number of NULLs
SELECT 
    COUNT(*) AS total_records,                          -- total rows in the table
    COUNT(*) - COUNT(film_id) AS missing_film_id,       -- count missing film_id
    COUNT(*) - COUNT(title) AS missing_title,           -- count missing titles
    COUNT(*) - COUNT(description) AS missing_description, -- count missing descriptions
    COUNT(*) - COUNT(release_year) AS missing_release_year, -- count missing release_year
    COUNT(*) - COUNT(language_id) AS missing_language_id,   -- count missing language_id
    COUNT(*) - COUNT(rental_duration) AS missing_rental_duration, -- count missing rental_duration
    COUNT(*) - COUNT(rental_rate) AS missing_rental_rate, -- count missing rental_rate
    COUNT(*) - COUNT(length) AS missing_length,          -- count missing length
    COUNT(*) - COUNT(replacement_cost) AS missing_replacement_cost, -- count missing replacement_cost
    COUNT(*) - COUNT(rating) AS missing_rating,          -- count missing rating
    COUNT(*) - COUNT(last_update) AS missing_last_update, -- count missing last_update
    COUNT(*) - COUNT(special_features) AS missing_special_features, -- count missing special_features
    COUNT(*) - COUNT(fulltext) AS missing_fulltext       -- count missing fulltext
FROM film;
