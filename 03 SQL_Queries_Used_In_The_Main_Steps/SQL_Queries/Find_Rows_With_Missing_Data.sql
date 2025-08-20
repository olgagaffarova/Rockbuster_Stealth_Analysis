-- Retrieve rows from customer table that have NULL values in any column
SELECT *
FROM customer
WHERE customer_id IS NULL
   OR store_id IS NULL
   OR first_name IS NULL
   OR last_name IS NULL
   OR email IS NULL
   OR address_id IS NULL
   OR activebool IS NULL
   OR create_date IS NULL
   OR last_update IS NULL
   OR active IS NULL;
