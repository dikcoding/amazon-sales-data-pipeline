

  create or replace view `ecommerce-project-479723`.`sale`.`report_total_revenue`
  OPTIONS()
  as SELECT
    SUM(monthly_revenue) AS total_revenue
FROM `ecommerce-project-479723`.`sale`.`fct_sales`;

