--- customer_orders
---
---

{{
    config(
        materialized='table'
    )
}}

select
    c.customer_id,
    count(1) as n_orders,
    max(order_date) as last_order_date
from
    {{ ref('customers') }} as c
left join
    {{ ref('orders') }} as o
    on c.customer_id = o.customer_id
group by
    c.customer_id

