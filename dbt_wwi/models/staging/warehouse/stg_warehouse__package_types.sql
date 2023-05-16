with 

source as (

    select * from {{ source('warehouse', 'packagetypes') }}

),

transformed as (

    select
        
        packagetypeid as package_type_id,
        packagetypename as package_type_name

    from source

)

select * from transformed
  