WITH tempy AS (SELECT
*
, s.quantity * p.purchase_price AS purchase_cost
FROM {{ ref('stg_raw__sales')}} AS s
JOIN {{ ref('stg_raw__product')}} AS p USING (products_id))

SELECT
*
, purchase_cost - quantity AS margin
FROM tempy
