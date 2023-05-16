with 

date_spine as (

    {{ 
        dbt_utils.date_spine(
            datepart="day",
            start_date="cast('2000-01-01' as date)",
            end_date="cast('2023-12-31' as date)"
        ) 
    }}

),

final as (

    select

        {{ convert_date_id('date_day') }} as date_key,
        date_day::timestamp::date as "date",
        extract(year from date_day) as "year",
        extract(month from date_day) as "month",
        extract(day from date_day) as "day",
        extract(quarter from date_day) as "quarter",
        extract(dow from date_day) as "day_of_week",
        extract(doy from date_day) as "day_of_year",
        extract(week from date_day) as "week_of_year"

    from date_spine
)

select * from final
