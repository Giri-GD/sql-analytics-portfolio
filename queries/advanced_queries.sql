SELECT
    t.name AS track,
    COUNT(ii.invoice_line_id) AS sales_count
FROM invoice_items ii
JOIN tracks t
ON ii.track_id = t.track_id
GROUP BY t.track_id
ORDER BY sales_count ASC
LIMIT 10;

SELECT
    c.first_name,
    c.last_name,
    MAX(i.invoice_date) AS last_purchase
FROM customers c
JOIN invoices i
ON c.customer_id = i.customer_id
GROUP BY c.customer_id
HAVING last_purchase < date('now','-90 day');

SELECT
    billing_country,
    AVG(total) AS avg_order_value
FROM invoices
GROUP BY billing_country
ORDER BY avg_order_value DESC;

SELECT
    e.first_name || ' ' || e.last_name AS sales_rep,
    SUM(i.total) AS revenue
FROM employees e
JOIN customers c
ON e.employee_id = c.support_rep_id
JOIN invoices i
ON c.customer_id = i.customer_id
GROUP BY e.employee_id
ORDER BY revenue DESC;

SELECT
    t.name,
    COUNT(ii.invoice_line_id) AS sales_volume
FROM tracks t
JOIN invoice_items ii
ON t.track_id = ii.track_id
GROUP BY t.track_id
ORDER BY sales_volume DESC
LIMIT 10;

SELECT
    a.title AS album,
    ar.name AS artist,
    COUNT(t.track_id) AS total_tracks
FROM albums a
JOIN artists ar
ON a.artist_id = ar.artist_id
JOIN tracks t
ON a.album_id = t.album_id
GROUP BY a.album_id
ORDER BY total_tracks DESC;

SELECT
    a.title AS album,
    ar.name AS artist,
    COUNT(t.track_id) AS total_tracks
FROM albums a
JOIN artists ar
ON a.artist_id = ar.artist_id
JOIN tracks t
ON a.album_id = t.album_id
GROUP BY a.album_id
ORDER BY total_tracks DESC;

SELECT
    c.first_name,
    c.last_name,
    SUM(i.total) AS total_spent
FROM customers c
JOIN invoices i
ON c.customer_id = i.customer_id
GROUP BY c.customer_id
HAVING total_spent >
(
    SELECT AVG(total)
    FROM invoices
);
