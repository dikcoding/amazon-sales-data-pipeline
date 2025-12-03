SELECT
    d.year,
    d.month,
    SUM(f.monthly_revenue) AS revenue
FROM {{ ref('fct_sales') }} f
LEFT JOIN {{ ref('dim_date') }} d USING (date_id)
GROUP BY 1,2
ORDER BY year, month
