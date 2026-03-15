SELECT
    strftime('%Y-%m', invoice_date) AS month,
    SUM(total) AS monthly_revenue
FROM invoices
GROUP BY month
ORDER BY month;
