with 

source as (

    select * from {{ source('sales', 'specialdeals') }}

),

transformed as (

    select
        
        specialdealid as special_deal_id,
        buyinggroupid as buying_group_id,
        dealdescription as deal_description,
        cast(startdate as timestamp) as start_date,
        cast(enddate as timestamp) as end_date,
        discountamount as discount_amount,
        discountpercentage as discount_percentage

    from source

)

select * from transformed
  