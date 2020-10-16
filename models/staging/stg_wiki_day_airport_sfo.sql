with source  as (
    select * from {{'wiki_day_sfo_airport'}}
),

renamed as (
    select 
        substring(source.timestamp,1,8) as date_day
        ,views as wiki_airport_sfo

    from source
),

final as (
    select 
       to_date(renamed.date_day, 'YYYYMMDD') as date_day
       ,wiki_airport_sfo
    from renamed
)

select * from final