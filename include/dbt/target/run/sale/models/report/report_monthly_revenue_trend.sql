

  create or replace view `ecommerce-project-479723`.`sale`.`report_monthly_revenue_trend`
  OPTIONS()
  as SELECT
    d.year,
    d.month,
    SUM(f.monthly_revenue) AS revenue
FROM `ecommerce-project-479723`.`sale`.`fct_sales` f
LEFT JOIN `ecommerce-project-479723`.`sale`.`dim_date` d USING (date_id)
GROUP BY 1,2
ORDER BY year, month;

