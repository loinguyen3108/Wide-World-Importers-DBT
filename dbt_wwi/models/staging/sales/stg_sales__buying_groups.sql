with 

source as (

    select * from {{ source('sales', 'buyinggroups') }}

),

transformed as (

    select
        
        buyinggroupid as buying_group_id,
        buyinggroupname as buying_group_name

    from source

)

select * from transformed
  