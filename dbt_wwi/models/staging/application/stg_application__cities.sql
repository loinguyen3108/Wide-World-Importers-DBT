with 

source as (

    select * from {{ source('application', 'cities') }}
    
),

transformed as (

    select

        cityid as city_id,
        stateprovinceid as state_province_id,
        cityname as city_name

    from source

)

select * from transformed
