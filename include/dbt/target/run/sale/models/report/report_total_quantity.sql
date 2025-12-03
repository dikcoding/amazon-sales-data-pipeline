

  create or replace view `ecommerce-project-479723`.`sale`.`report_total_quantity`
  OPTIONS()
  as SELECT
    SUM(quantity) AS total_quantity
FROM `ecommerce-project-479723`.`sale`.`fct_sales`;

