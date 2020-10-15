with airbnb as (
    select * from {{ref('agg_reviews_aus')}}
),

airport as (
    select * from {{ref('stg_wiki_day_airport_aus')}}
),

final as (
    select 
        * 
    from airbnb 
    left join airport
    using(date_day)
    order by date_day
)

select *  from final