with 

countries as (

    select * from {{ ref('stg_application__countries') }}

),

state_provinces as (

    select * from {{ ref('stg_application__state_provinces') }}

),

cites as (

    select * from {{ ref('stg_application__cities') }}

),

location as (

    select

        c.city_id,
        sp.state_province_id,
        ct.country_id,
        c.city_name,
        sp.state_province_name,
        ct.country_name

    from countries as ct
    join state_provinces as sp using (country_id)
    join cites as c using (state_province_id)

)

select * from location
