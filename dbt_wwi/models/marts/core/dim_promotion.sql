with 

promotion as (

    select * from {{ ref('stg_sales__promotion') }}

),

final as (

    select

        special_deal_id as promotion_key,
        deal_description as promotion_description,
        start_date,
        end_date,
        cast(discount_amount as float) as discount_amount,
        cast(discount_percentage as float) as discount_percentage

    from promotion

)

select * from final
