-- income by state
SELECT
    s.ship_state,
    SUM(f.revenue) AS revenue
FROM {{ ref('fct_sales') }} f
JOIN {{ ref('dim_state') }} s USING (state_id)
GROUP BY 1
ORDER BY revenue DESC