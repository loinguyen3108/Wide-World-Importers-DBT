with 

delivery_methods as (

    select * from {{ ref('stg_application__delivery_methods') }}

),

final as (

    select

        delivery_method_id as delivery_method_key,
        delivery_method_name

    from delivery_methods

)

select * from final
