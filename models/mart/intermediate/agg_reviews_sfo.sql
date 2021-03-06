with airbnb as (
    select * from {{ref('stg_reviews_sfo')}}
),

final as (
    select 
        date_day
        ,count(listing_sfo) as total_listings_sfo
        --use case when to add AUS column
        --this data is daily, so aggregate by month
        --sum reviews by month from airbnb
    from airbnb
    group by date_day
    order by date_day
)

select * from final