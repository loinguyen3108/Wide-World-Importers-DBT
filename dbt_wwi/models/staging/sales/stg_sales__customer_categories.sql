with 

source as (

    select * from {{ source('sales', 'customercategories') }}

),

transformed as (

    select
        
        customercategoryid as customer_category_id,
        customercategoryname as customer_category_name

    from source

)

select * from transformed
  