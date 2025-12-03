

  create or replace view `ecommerce-project-479723`.`sale`.`report_total_orders`
  OPTIONS()
  as SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM `ecommerce-project-479723`.`sale`.`fct_sales`;

