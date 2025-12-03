WITH source AS (
    SELECT * 
    FROM {{ source('sale', 'raw_invoices') }}
),

renamed AS (
    SELECT
        CAST(`Order ID` AS STRING) AS order_id,
        CAST(Date AS DATE) AS order_date,
        TRIM(Status) AS order_status,
        TRIM(Fulfilment) AS fulfilment_type,
        TRIM(`Sales Channel`) AS sales_channel,
        TRIM(`ship-service-level`) AS ship_service_level,
        TRIM(Style) AS style,
        TRIM(SKU) AS sku,
        TRIM(Category) AS category,
        TRIM(Size) AS size,
        TRIM(ASIN) AS asin,
        TRIM(`Courier Status`) AS courier_status,
        SAFE_CAST(Qty AS INT64) AS quantity,
        TRIM(currency) AS currency,
        SAFE_CAST(Amount AS FLOAT64) AS amount,
        TRIM(`ship-city`) AS ship_city,
        TRIM(`ship-state`) AS ship_state,
        CAST(`ship-postal-code` AS STRING) AS ship_postal_code,
        TRIM(`ship-country`) AS ship_country,
        `promotion-ids` AS promotion_ids,
        B2B AS is_b2b,
        TRIM(`fulfilled-by`) AS fulfilled_by,
        SAFE_CAST(unnamed_22 AS BOOL) AS extra_flag
    FROM source
)

SELECT * FROM renamed
