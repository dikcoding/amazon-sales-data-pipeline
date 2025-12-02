SELECT
    order_id,
    date_id,
    product_id,
    state_id,
    quantity,
    amount,
    revenue,
    promotion_ids,
    is_b2b,
    fulfilled_by
FROM {{ ref('int_cleaned_invoices') }}
LEFT JOIN {{ ref('dim_date') }}   USING (order_date)
LEFT JOIN {{ ref('dim_product') }} USING (sku, asin, style)
LEFT JOIN {{ ref('dim_state') }}   USING (ship_state, ship_country)