SELECT
    SUM(monthly_revenue) AS total_revenue
FROM {{ ref('fct_sales') }}
