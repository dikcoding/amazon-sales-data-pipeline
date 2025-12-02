-- int_cleaned_invoices.sql

WITH base AS (
    SELECT * FROM `ecommerce-project-479723`.`sale`.`stg_invoices`
),

transformed AS (
    SELECT
        order_id,
        order_date,
        order_status,
        fulfilment_type,
        sales_channel,
        ship_service_level,
        sku,
        asin,
        style,
        category,
        size,
        ship_city,
        ship_state,
        ship_postal_code,
        ship_country,
        courier_status,
        quantity,
        amount,
        quantity * amount AS revenue,
        promotion_ids,
        is_b2b,
        COALESCE(fulfilled_by, 'UNKNOWN') AS fulfilled_by
    FROM base
    WHERE quantity > 0
)

SELECT * FROM transformed