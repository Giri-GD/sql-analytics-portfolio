SELECT
    c.first_name || ' ' || c.last_name AS customer,
    SUM(i.total) AS total_spent
FROM customers c
JOIN invoices i
ON c.customer_id = i.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 10;
