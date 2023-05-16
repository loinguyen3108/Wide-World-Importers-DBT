with 

source as (

    select * from {{ source('application', 'deliverymethods') }}

),

transformed as (

    select

        deliverymethodid as delivery_method_id,
        deliverymethodname as delivery_method_name

    from source

)

select * from transformed
