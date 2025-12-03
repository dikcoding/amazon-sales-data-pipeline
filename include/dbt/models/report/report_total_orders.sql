SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM {{ ref('fct_sales') }}
