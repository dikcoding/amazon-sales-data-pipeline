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
FROM `ecommerce-project-479723`.`sale`.`int_cleaned_invoices`
LEFT JOIN `ecommerce-project-479723`.`sale`.`dim_date`   USING (order_date)
LEFT JOIN `ecommerce-project-479723`.`sale`.`dim_product` USING (sku, asin, style)
LEFT JOIN `ecommerce-project-479723`.`sale`.`dim_state`   USING (ship_state, ship_country)