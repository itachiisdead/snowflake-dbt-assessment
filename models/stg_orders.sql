with orders as (
    select *
    from {{ source('tpch', 'orders') }}
),
customers as (
    select *
    from {{ source('tpch', 'customer') }}
)

select
    o.o_orderkey,
    o.o_custkey,
    c.c_name as customer_name,
    extract(year from o.o_orderdate) as order_year,
    o.o_totalprice as total_price
from orders o
join customers c
    on o.o_custkey = c.c_custkey
