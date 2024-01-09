SELECT
orders_id
, o.date_date
, ROUND((o.margin + s.ship_fee - log_cost - ship_cost),2) AS operational_margin
FROM {{ ref('int_orders_margin')}} AS o 
JOIN {{ ref('stg_raw__ship')}} AS s USING (orders_id)
ORDER BY orders_id DESC