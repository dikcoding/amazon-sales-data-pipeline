SELECT
    SUM(quantity) AS total_quantity
FROM {{ ref('fct_sales') }}
