
  
    

    create or replace table `ecommerce-project-479723`.`sale`.`dim_date`
    
    

    OPTIONS()
    as (
      WITH dates AS (
    SELECT DISTINCT order_date
    FROM `ecommerce-project-479723`.`sale`.`int_cleaned_invoices`
    WHERE order_date IS NOT NULL
)

SELECT
    order_date AS date_id,
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    EXTRACT(DAY FROM order_date) AS day,
FROM dates
    );
  