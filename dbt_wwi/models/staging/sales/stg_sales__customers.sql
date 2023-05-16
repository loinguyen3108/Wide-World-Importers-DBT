with 

source as (

    select * from {{ source('sales', 'customers') }}

),

transformed as (

    select
        
        customerid as customer_id,
        customercategoryid as customer_category_id,
        buyinggroupid as buying_group_id,
        deliverycityid as delivery_city_id,
        customername as customer_name,
        cast(accountopeneddate as timestamp) as account_opened_date,
        phonenumber as phone_number,
        faxnumber as fax_number,
        websiteurl as website_url

    from source

)

select * from transformed
  