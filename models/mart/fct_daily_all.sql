with aus as (
    select * from {{ref('fct_daily_aus')}}
),

sfo as (
    select * from {{ref('fct_daily_sfo')}}
),

final as(
    select aus.*
    ,sfo.wiki_airport_sfo
    ,sfo.total_listings_sfo
    from aus 
    left join sfo
    on(aus.date_day = sfo.date_day)
    order by aus.date_day
)

select * from final
