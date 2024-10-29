with raw1 as (
    select customer_unique_id, min(order_purchase_timestamp) as first_order_date
    from dbo.orders o
    join dbo.customers c on o.customer_id = c.customer_id
    where year(order_purchase_timestamp) = 2017
    group by customer_unique_id
),
raw2 as (
    SELECT c.customer_unique_id, o.order_purchase_timestamp
    FROM dbo.orders o
    JOIN dbo.customers c ON o.customer_id = c.customer_id
    where year(order_purchase_timestamp) = 2017
),
final_table as (
    select 
        a.customer_unique_id,
        MONTH(a.first_order_date) as cohort_month,
        MONTH(b.order_purchase_timestamp) as order_month,
        DATEDIFF(MONTH, a.first_order_date, b.order_purchase_timestamp) as month_diff
    from raw1 as a
    left join raw2 as b on a.customer_unique_id = b.customer_unique_id
)
select 
    cohort_month,
    count(distinct customer_unique_id) as number_of_user,
    count(distinct case when month_diff = 0 then customer_unique_id end) as month_0,
    count(distinct case when month_diff = 1 then customer_unique_id end) as month_1,
    count(distinct case when month_diff = 2 then customer_unique_id end) as month_2,
    count(distinct case when month_diff = 3 then customer_unique_id end) as month_3,
    count(distinct case when month_diff = 4 then customer_unique_id end) as month_4,
    count(distinct case when month_diff = 5 then customer_unique_id end) as month_5,
    count(distinct case when month_diff = 6 then customer_unique_id end) as month_6,
    count(distinct case when month_diff = 7 then customer_unique_id end) as month_7,
    count(distinct case when month_diff = 8 then customer_unique_id end) as month_8,
    count(distinct case when month_diff = 9 then customer_unique_id end) as month_9,
    count(distinct case when month_diff = 10 then customer_unique_id end) as month_10,
    count(distinct case when month_diff = 11 then customer_unique_id end) as month_11
from final_table
group by cohort_month
order by cohort_month
