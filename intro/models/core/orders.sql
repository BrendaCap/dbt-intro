--
--
{{
    config(
        materialized='table'
    )
}}


select
    id::integer as order_id,
    user_id as customer_id,
    order_date::date as order_date,
    status
from
    {{ source('jaffleshop', 'jaffleshop__orders') }}
   -- raw.dbazrsqljs01.jaffleshop__orders
