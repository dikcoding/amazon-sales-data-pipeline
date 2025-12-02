

  create or replace view `ecommerce-project-479723`.`sale`.`stg_invoices`
  OPTIONS()
  as WITH source AS (
    SELECT * 
    FROM `ecommerce-project-479723`.`sale`.`raw_invoices`
),

renamed AS (
    SELECT
        CAST(order_id AS STRING) AS order_id,
        CAST(Date AS DATE) AS order_date,
        
        TRIM(Status) AS order_status,
        TRIM(Fulfilment) AS fulfilment_type,
        TRIM(sales_channel) AS sales_channel,
        TRIM(ship_service_level) AS ship_service_level,

        -- Product attributes
        TRIM(SKU) AS sku,
        TRIM(ASIN) AS asin,
        TRIM(Style) AS style,
        TRIM(Category) AS category,
        TRIM(Size) AS size,

        -- Shipping attributes
        TRIM(ship_city) AS ship_city,
        TRIM(ship_state) AS ship_state,
        CAST(ship_postal_code AS INT64) AS ship_postal_code,
        TRIM(ship_country) AS ship_country,
        TRIM(courier_status) AS courier_status,

        -- Metrics
        CAST(Qty AS INT64) AS quantity,
        CAST(Amount AS FLOAT64) AS amount,

        -- Optional attributes
        promotion_ids,
        B2B AS is_b2b,
        TRIM(fulfilled_by) AS fulfilled_by
    FROM source
)

SELECT * FROM renamed;

