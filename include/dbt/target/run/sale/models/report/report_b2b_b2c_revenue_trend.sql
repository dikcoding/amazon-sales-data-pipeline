

  create or replace view `ecommerce-project-479723`.`sale`.`report_b2b_b2c_revenue_trend`
  OPTIONS()
  as SELECT
    d.year,
    d.month,
    CASE WHEN f.is_b2b THEN 'B2B' ELSE 'B2C' END AS customer_type,
    SUM(f.monthly_revenue) AS revenue
FROM `ecommerce-project-479723`.`sale`.`fct_sales` f
LEFT JOIN `ecommerce-project-479723`.`sale`.`dim_date` d USING (date_id)
GROUP BY 1,2,3
ORDER BY year, month, customer_type;

