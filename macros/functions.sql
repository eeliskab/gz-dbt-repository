{% macro margin_percent(revenue, margin)%}
    ROUND((margin / revenue),2) 
{%endmacro%}