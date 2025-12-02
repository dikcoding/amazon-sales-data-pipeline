-- monthly income trend
SELECT
  s.ship_country AS country,
  s.ship_state   AS state,
  COUNT(f.order_id) AS total_orders,
  SUM(f.revenue) AS total_revenue
FROM {{ ref('fct_sales') }} f
JOIN {{ ref('dim_state') }} s ON f.state_id = s.state_id
GROUP BY
  s.ship_country,
  s.ship_state
ORDER BY total_revenue DESC
LIMIT 10