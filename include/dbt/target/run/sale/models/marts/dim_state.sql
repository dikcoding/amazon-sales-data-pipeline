
  
    

    create or replace table `ecommerce-project-479723`.`sale`.`dim_state`
    
    

    OPTIONS()
    as (
      SELECT DISTINCT
    to_hex(md5(cast(coalesce(cast(ship_state as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(ship_country as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) AS state_id,
    ship_state,
    ship_city,
    ship_country,
    ship_postal_code,
FROM `ecommerce-project-479723`.`sale`.`int_cleaned_invoices`
WHERE ship_state IS NOT NULL
    );
  