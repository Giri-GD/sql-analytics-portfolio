SELECT
    billing_country,
    ROUND(SUM(total),2) AS total_revenue
FROM invoices
GROUP BY billing_country
ORDER BY total_revenue DESC;
