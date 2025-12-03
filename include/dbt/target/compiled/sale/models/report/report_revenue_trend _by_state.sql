SELECT
    d.year,
    d.month,
    s.ship_state,
    SUM(f.monthly_revenue) AS revenue
FROM `ecommerce-project-479723`.`sale`.`fct_sales` f
LEFT JOIN `ecommerce-project-479723`.`sale`.`dim_date` d USING (date_id)
LEFT JOIN `ecommerce-project-479723`.`sale`.`dim_state` s USING (state_id)
GROUP BY 1,2,3
ORDER BY year, month, revenue DESC