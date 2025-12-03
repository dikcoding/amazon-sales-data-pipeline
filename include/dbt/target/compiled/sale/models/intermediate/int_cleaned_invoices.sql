WITH base AS (
    SELECT *
    FROM `ecommerce-project-479723`.`sale`.`stg_invoices`
),

cleaned AS (
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
        SAFE_CAST(quantity AS INT64) AS quantity,
        SAFE_CAST(amount AS FLOAT64) AS monthly_revenue,
        promotion_ids,
        extra_flag,
        is_b2b,
        fulfilled_by

    FROM base
    WHERE quantity >= 0
)

SELECT * FROM cleaned