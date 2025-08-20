-- Check if there are duplicate or non-uniform customer rows
SELECT 
    customer_id, 
    store_id, 
    first_name, 
    last_name,
    email, 
    address_id, 
    activebool,
    create_date, 
    last_update, 
    active
FROM customer
GROUP BY 
    customer_id, 
    store_id, 
    first_name, 
    last_name,
    email, 
    address_id, 
    activebool,
    create_date, 
    last_update, 
    active
HAVING COUNT(*) > 1;   -- return only records that appear more than once
