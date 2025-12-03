SELECT
    d.year,
    d.month,
    SUM(f.quantity) AS quantity
FROM `ecommerce-project-479723`.`sale`.`fct_sales` f
LEFT JOIN `ecommerce-project-479723`.`sale`.`dim_date` d USING (date_id)
GROUP BY 1,2
ORDER BY year, month