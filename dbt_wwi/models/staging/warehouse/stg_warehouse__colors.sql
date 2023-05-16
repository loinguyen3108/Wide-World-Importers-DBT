with 

source as (

    select * from {{ source('warehouse', 'colors') }}

),

transformed as (

    select
        
        colorid as color_id,
        colorname as color_name

    from source

)

select * from transformed
  