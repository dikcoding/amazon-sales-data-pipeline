WITH product_cte AS (
    SELECT DISTINCT
        to_hex(md5(cast(coalesce(cast(sku as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(asin as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(style as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) AS product_id,
        sku,
        asin,
        style,
        category,
        size
    FROM `ecommerce-project-479723`.`sale`.`int_cleaned_invoices`
    WHERE sku IS NOT NULL
)

SELECT * FROM product_cte