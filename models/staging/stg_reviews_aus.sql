with source  as (
    select * from {{'reviews_summary_aus'}}
),

renamed as (
    select 
        to_date(date, 'YYYY-MM-DD') as date_day
        ,listing_id as listing_aus

    from source
    --group by date_day
)

select * from renamed