SELECT
date_date
, (f.operational_margin - c.ads_cost) AS ads_margin
, f.average_basket
, f.operational_margin
FROM
{{ref('finance_days')}} AS f
JOIN {{ref('int_campaigns_day')}} AS c USING (date_date)
ORDER BY date_date DESC