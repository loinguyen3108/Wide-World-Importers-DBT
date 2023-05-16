with

customers as (

    select * from {{ ref('stg_sales__customers') }}

),

customer_categories as (

    select * from {{ ref('stg_sales__customer_categories') }}

),

buying_groups as (

    select * from {{ ref('stg_sales__buying_groups') }}

),

location as (

    select * from {{ ref('location') }}

),

final as (

    select

        cast(ctm.customer_id as int) as customer_key,
        ctm.customer_name,
        cc.customer_category_name,
        coalesce(bg.buying_group_name, 'unknown') as buying_group_name,
        {{ convert_date_id('account_opened_date') }} as open_date_key,
        ctm.phone_number,
        ctm.fax_number,
        ctm.website_url,
        lct.city_name as delivery_city,
        lct.state_province_name as delivery_state_province,
        lct.country_name as delivery_country

    from customers as ctm
    left join customer_categories as cc using (customer_category_id)
    left join buying_groups as bg using (buying_group_id)
    left join location as lct on ctm.delivery_city_id = lct.city_id

)

select * from final
