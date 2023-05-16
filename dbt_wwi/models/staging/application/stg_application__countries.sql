with

source as (
    
    select * from {{ source('application', 'countries') }}

),

transformed as (

    select

        countryid as country_id,
        countryname as country_name

    from source

)

select * from transformed
