-- Summarize key statistics from the customer table
SELECT 
    MIN(customer_id) AS Min_Customer_ID,   -- lowest customer ID
    MAX(customer_id) AS Max_Customer_ID,   -- highest customer ID
    MIN(store_id) AS Min_Store_ID,         -- lowest store ID
    MAX(store_id) AS Max_Store_ID,         -- highest store ID
    COUNT(store_id) AS Count_Store_ID,     -- number of store_id values
    MIN(active) AS Min_Active,             -- minimum active flag (0/1)
    MAX(active) AS Max_Active,             -- maximum active flag (0/1)
    COUNT(active) AS Count_Active,         -- count of active values
    AVG(active) AS Avg_Active,             -- average active value
    MIN(last_update) AS Min_last_update,   -- earliest update timestamp
    MAX(last_update) AS Max_last_update,   -- latest update timestamp
    COUNT(last_update) AS Count_last_update -- count of update records
FROM customer;
