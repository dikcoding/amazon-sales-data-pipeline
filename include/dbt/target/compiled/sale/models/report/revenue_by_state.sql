-- income by state
SELECT
    s.ship_state,
    SUM(f.revenue) AS revenue
FROM `ecommerce-project-479723`.`sale`.`fct_sales` f
JOIN `ecommerce-project-479723`.`sale`.`dim_state` s USING (state_id)
GROUP BY 1
ORDER BY revenue DESC