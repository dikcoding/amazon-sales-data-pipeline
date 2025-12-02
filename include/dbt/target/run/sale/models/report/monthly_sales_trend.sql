

  create or replace view `ecommerce-project-479723`.`sale`.`monthly_sales_trend`
  OPTIONS()
  as -- Which product generates the most revenue
SELECT
    d.year,
    d.month,
    SUM(f.revenue) AS monthly_revenue
FROM `ecommerce-project-479723`.`sale`.`fct_sales` f
JOIN `ecommerce-project-479723`.`sale`.`dim_date` d USING (date_id)
GROUP BY 1, 2
ORDER BY 1, 2;

