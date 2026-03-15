import sqlite3
import pandas as pd

conn = sqlite3.connect("chinook.db")

query = """
SELECT billing_country,
SUM(total) as revenue
FROM invoices
GROUP BY billing_country
ORDER BY revenue DESC
"""

df = pd.read_sql_query(query, conn)

print(df)

conn.close()
