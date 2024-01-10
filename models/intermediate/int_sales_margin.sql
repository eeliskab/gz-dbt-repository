WITH tempy AS (SELECT
*
, s.quantity * p.purchase_price AS purchase_cost
FROM {{ ref('stg_raw__sales')}} AS s
JOIN {{ ref('stg_raw__product')}} AS p USING (products_id)),

tempy2 AS (SELECT
*
, ROUND(revenue - purchase_cost,2) AS margin
FROM tempy)

SELECT
*
, {{ margin_percent(revenue, margin) }} AS margin_percent
FROM tempy2
