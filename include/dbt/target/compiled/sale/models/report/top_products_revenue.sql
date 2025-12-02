-- monthly income trend
SELECT
  s.ship_country AS country,
  s.ship_state   AS state,
  COUNT(f.order_id) AS total_orders,
  SUM(f.revenue) AS total_revenue
FROM `ecommerce-project-479723`.`sale`.`fct_sales` f
JOIN `ecommerce-project-479723`.`sale`.`dim_state` s ON f.state_id = s.state_id
GROUP BY
  s.ship_country,
  s.ship_state
ORDER BY total_revenue DESC
LIMIT 10