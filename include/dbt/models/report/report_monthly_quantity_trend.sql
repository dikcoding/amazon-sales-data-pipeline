SELECT
    d.year,
    d.month,
    SUM(f.quantity) AS quantity
FROM {{ ref('fct_sales') }} f
LEFT JOIN {{ ref('dim_date') }} d USING (date_id)
GROUP BY 1,2
ORDER BY year, month
