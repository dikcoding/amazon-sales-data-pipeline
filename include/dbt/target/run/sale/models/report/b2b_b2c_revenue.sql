

  create or replace view `ecommerce-project-479723`.`sale`.`b2b_b2c_revenue`
  OPTIONS()
  as -- Comparison of B2B and B2C sales.
SELECT
    CASE WHEN is_b2b THEN 'B2B' ELSE 'B2C' END AS customer_type,
    SUM(revenue) AS total_revenue
FROM `ecommerce-project-479723`.`sale`.`fct_sales`
GROUP BY 1
ORDER BY total_revenue DESC;

