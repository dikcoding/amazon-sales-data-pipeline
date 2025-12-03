WITH base AS (
    SELECT *
    FROM {{ ref('int_cleaned_invoices') }}
)

SELECT
    order_id,
    base.order_date,
    d.date_id,
    p.product_id,
    s.state_id,
    quantity,
    monthly_revenue,
    promotion_ids,
    is_b2b,
    fulfilled_by,
    fulfilment_type,
    sales_channel,
    ship_service_level,
    courier_status

FROM base
LEFT JOIN {{ ref('dim_date') }} d
    ON base.order_date = d.date_id

LEFT JOIN {{ ref('dim_product') }} p
    ON base.sku = p.sku
    AND base.asin = p.asin
    AND base.style = p.style
    AND base.category = p.category
    AND base.size = p.size

LEFT JOIN {{ ref('dim_state') }} s
    ON base.ship_state = s.ship_state
    AND base.ship_city = s.ship_city
    AND base.ship_country = s.ship_country
    AND base.ship_postal_code = s.ship_postal_code