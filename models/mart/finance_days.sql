WITH orders AS (
    SELECT
    o.*
    , oo.operational_margin
    FROM {{ ref('int_orders_margin')}} AS o 
    JOIN {{ ref('int_orders_operational')}} AS oo USING (orders_id))

SELECT 
date_date
, COUNT(orders_id) AS nb_transactions
, ROUND(SUM(revenue),1) AS revenue
, ROUND(SUM(revenue)/ COUNT(orders_id),1) AS average_basket
, ROUND(SUM(margin),1) AS margin
, ROUND(SUM(operational_margin),1) AS operational_margin
FROM orders
GROUP BY date_date
ORDER BY date_date DESC
