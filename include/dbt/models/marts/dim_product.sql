WITH product_cte AS (
    SELECT DISTINCT
        {{ dbt_utils.generate_surrogate_key(['sku', 'asin', 'style']) }} AS product_id,
        sku,
        asin,
        style,
        category,
        size
    FROM {{ ref('int_cleaned_invoices') }}
    WHERE sku IS NOT NULL
)

SELECT * FROM product_cte