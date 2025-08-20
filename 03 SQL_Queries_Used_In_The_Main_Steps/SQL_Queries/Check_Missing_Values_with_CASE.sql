-- Use CASE statements to check if each column is NULL.
-- SUM adds up all the 1s (NULLs) → giving total missing values for each column.
SELECT
    SUM(CASE WHEN film_id IS NULL THEN 1 ELSE 0 END) AS missing_film_id,
    SUM(CASE WHEN title IS NULL THEN 1 ELSE 0 END) AS missing_title,
    SUM(CASE WHEN description IS NULL THEN 1 ELSE 0 END) AS missing_description,
    SUM(CASE WHEN release_year IS NULL THEN 1 ELSE 0 END) AS missing_release_year,
    SUM(CASE WHEN language_id IS NULL THEN 1 ELSE 0 END) AS missing_language_id,
    SUM(CASE WHEN rental_duration IS NULL THEN 1 ELSE 0 END) AS missing_rental_duration,
    SUM(CASE WHEN rental_rate IS NULL THEN 1 ELSE 0 END) AS missing_rental_rate,
    SUM(CASE WHEN length IS NULL THEN 1 ELSE 0 END) AS missing_length,
    SUM(CASE WHEN replacement_cost IS NULL THEN 1 ELSE 0 END) AS missing_replacement_cost,
    SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS missing_rating,
    SUM(CASE WHEN last_update IS NULL THEN 1 ELSE 0 END) AS missing_last_update,
    SUM(CASE WHEN special_features IS NULL THEN 1 ELSE 0 END) AS missing_special_features,
    SUM(CASE WHEN fulltext IS NULL THEN 1 ELSE 0 END) AS missing_fulltext
FROM film;
