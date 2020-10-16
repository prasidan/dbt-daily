with airbnb as (
    select * from {{ref('agg_reviews_aus')}}
),

airport as (
    select * from {{ref('stg_wiki_day_airport_aus')}}
),

final as (
    select 
        * 
    from airport
    left join airbnb
    using(date_day)
    where date_day >= '2015-07-01'
    and date_day <= '2020-03-01'
    order by date_day
)

select *  from final