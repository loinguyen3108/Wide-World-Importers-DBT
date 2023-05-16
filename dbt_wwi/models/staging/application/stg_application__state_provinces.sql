with

source as (

    select * from {{ source('application', 'stateprovinces') }}

),

transformed as (

    select

        stateprovinceid as state_province_id,
        countryid as country_id,
        stateprovincename as state_province_name

    from source

)

select * from transformed

