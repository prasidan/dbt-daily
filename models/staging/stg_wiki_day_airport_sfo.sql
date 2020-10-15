with source  as (
    select * from {{'wiki_day_sfo_airport'}}
),

renamed as (
    select 
        substring(source.timestamp,1,8) as date_day
        ,views

    from source
),

final as (
    select 
       to_date(renamed.date_day, 'YYYYMMDD') as date_day
       ,views
    from renamed
)

select * from final