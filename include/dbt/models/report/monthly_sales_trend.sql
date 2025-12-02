-- Which product generates the most revenue
SELECT
    d.year,
    d.month,
    SUM(f.revenue) AS monthly_revenue
FROM {{ ref('fct_sales') }} f
JOIN {{ ref('dim_date') }} d USING (date_id)
GROUP BY 1, 2
ORDER BY 1, 2