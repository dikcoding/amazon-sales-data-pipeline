-- Comparison of B2B and B2C sales.
SELECT
    CASE WHEN is_b2b THEN 'B2B' ELSE 'B2C' END AS customer_type,
    SUM(revenue) AS total_revenue
FROM {{ ref('fct_sales') }}
GROUP BY 1
ORDER BY total_revenue DESC