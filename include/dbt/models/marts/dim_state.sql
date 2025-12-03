SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['ship_state', 'ship_country']) }} AS state_id,
    ship_state,
    ship_city,
    ship_country,
    ship_postal_code,
FROM {{ ref('int_cleaned_invoices') }}
WHERE ship_state IS NOT NULL